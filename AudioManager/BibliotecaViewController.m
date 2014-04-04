//
//  BibliotecaViewController.m
//  AudioMenager_01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 31/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "BibliotecaViewController.h"

@interface BibliotecaViewController ()
@property NSString *nomeBiblioteca;
@property AVAudioPlayer *player;
@property NSIndexPath *hl;

@end

@implementation BibliotecaViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self setAudio:[[AudioPlayer alloc] init]];
    
    TituloCell *sharedManager = [TituloCell sharedTituloCell];
    
    self.nomeBiblioteca = sharedManager.text;
    
    [[self navigationItem] setTitle:sharedManager.text];

    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//metodo que gera o cotexto para o coredata
- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the musicas from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Musica"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"diretorio == %@", [self nomeBiblioteca]];
    [fetchRequest setPredicate:predicate];
    
    self.sondsList = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    [self.tableView reloadData];
}

//- (IBAction)playPauseBTtap:(id)sender {
//    NSLog(@"test");
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)[[sender superview] superview]];
//    NSLog(@"%i",indexPath.row);
//    
//    NSManagedObject *sound = [self.sondsList objectAtIndex:0];
//    NSLog(@"%@", [sound valueForKey:@"pathUrl"] );
//    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[sound valueForKey:@"pathUrl"] ]error:nil];
//    [self.player setDelegate:self];
//    [self.player play];
//    
//}


//tabela
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sondsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSManagedObject *sound = [self.sondsList objectAtIndex:indexPath.row];
    NSString* title= [NSString stringWithFormat:@"%@-%@", [self nomeBiblioteca], [sound valueForKey:@"nome"]];
    
    [[cell textLabel] setText:title];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%i",indexPath.row);

}

- (BOOL) deletaSound:(NSString*) path
{
    
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *sound = [self.sondsList objectAtIndex:indexPath.row];
    
    //deleta a musica dentro da pasta
    [self deletaSound:[sound valueForKey:@"pathUrl"]];
    
    
    // Delete object from database
    [context deleteObject:[self.sondsList objectAtIndex:indexPath.row]];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Erro ao deletar! : %@ %@", error, [error localizedDescription]);
        return;
    }
    
    // Remove device from table view
    [self.sondsList removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
