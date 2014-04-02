//
//  AdicionarBibliotecaViewController.m
//  AudioMenager
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 27/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "AdicionarBibliotecaViewController.h"

@interface AdicionarBibliotecaViewController ()


@end

@implementation AdicionarBibliotecaViewController

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



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.labelNome becomeFirstResponder];
        [self.labelNome setText:@""];
        [self.labelNome setTextColor:[UIColor blackColor]];
    }
    
    if (indexPath.section == 1) {
        [self.labelDesc becomeFirstResponder];
        [self.labelDesc setText:@""];
        [self.labelDesc setTextColor:[UIColor blackColor]];
    }
}

- (IBAction)cancelar:(id)sender
{
    [self.delegate AdicionarBibliotecaViewControllerDidCancelar:self];
}

- (IBAction)pronto:(id)sender
{
    //Cria novo diretorio com base nos dados das labels
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // pega o diretorio Documents
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:self.labelNome.text];
    NSError *err = nil;
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]){
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&err];
    }
    
    // cria novo ManagedObject e salva os dados no BD
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newDir = [NSEntityDescription insertNewObjectForEntityForName:@"Biblioteca" inManagedObjectContext:context];
    [newDir setValue:self.labelNome.text forKey:@"nomeDir"];
    [newDir setValue:dataPath forKey:@"dirPath"];
    [newDir setValue:self.labelDesc.text forKey:@"descricao"];
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Não salvou no banco. Erro: %@ %@", error, [error localizedDescription]);
    }
    printf("Pasta %s criada.\nURL:%s \n", [[newDir valueForKey:@"nomeDir"] UTF8String], [[newDir valueForKey:@"dirPath"] UTF8String]);
    
    
    //retorna a view anterior
    [self.delegate AdicionarBibliotecaViewControllerDidPronto:self];
}

@end
