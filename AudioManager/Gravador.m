//
//  Gravador.m
//  AudioManager
//
//  Created by ICARO NASCIMENTO FERREIRA on 01/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "Gravador.h"
#import <AVFoundation/AVFoundation.h>

@implementation Gravador

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(id)init {
    self = [super init];
    if (self) {
        [self preparaGravador];
    }
    return self;
}

- (NSString *) dateString
{
    // return a formatted string for a file name
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd_MM_HH_mm_ss";
    return [[formatter stringFromDate:[NSDate date]] stringByAppendingString:@".m4a"];
}



-(void)preparaGravador{
    
    printf("Iniciando sessao de audio e suas configuracoes...\n");
    
    //singleton
    TituloCell *sharedManager = [TituloCell sharedTituloCell];
    NSString * nomeDoAudio = [self dateString];
    
    // Inicia sessão de audio
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define as configuracoes do audio e sua qualidade
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    printf("Qualidade definida!\n");
    
    //Inicia o gravador
    NSArray *searchPaths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths objectAtIndex: 0];
    printf("Gravador iniciado!\n");
    
    //Definicao do caminho em que sera salvo
    //NSString *pathToSave = [documentPath stringByAppendingPathComponent:nomeDoAudio];
    NSString *pathToSave = [documentPath stringByAppendingPathComponent:sharedManager.text];
    pathToSave = [pathToSave stringByAppendingString:[NSString stringWithFormat:@"/%@", nomeDoAudio]];
    NSURL *pathUrl = [NSURL fileURLWithPath:pathToSave];
    
    // Iniciando e preparando o gravador
    
    gravador = [[AVAudioRecorder alloc] initWithURL:pathUrl settings:recordSetting error:NULL];
    gravador.delegate = self;
    gravador.meteringEnabled = YES;
    [gravador prepareToRecord];
    printf("Gravador preparado!\n");
    
    // cria um manageObject
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newSound = [NSEntityDescription insertNewObjectForEntityForName:@"Musica" inManagedObjectContext:context];
    [newSound setValue:pathUrl.path forKey:@"pathUrl"];
    [newSound setValue:nomeDoAudio forKey:@"nome"];
    [newSound setValue:sharedManager.text forKey:@"diretorio"];
    printf("Arquivo criado em: %s\n", [[newSound valueForKey:@"pathUrl"] UTF8String]);
    printf("Url gravada no banco!\n");
    
    //error handler
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    printf("Sessao iniciada!\n");
}

@end
