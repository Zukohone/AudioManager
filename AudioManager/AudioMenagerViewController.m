//
//  AudioMenagerViewController.m
//  AudioMenager_01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 31/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "AudioMenagerViewController.h"

@interface AudioMenagerViewController ()

@end

@implementation AudioMenagerViewController

@synthesize titulo;

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
    
    //singleton
    [self setTitulo:[TituloCell sharedTituloCell]];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setTitulo:[TituloCell sharedTituloCell]];
    
    // Fetch the musicas from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Biblioteca"];
    self.bibliotecas = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // importatnte para o segue funcionar pra voltar ao root view
    // deve ser vericiar a ID do segue no storyboard
    if ([segue.identifier isEqualToString:@"Add"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        AdicionarBibliotecaViewController *add = [navigationController viewControllers][0];
        add.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"Cell"])
    {
        UITableViewCell* cell = sender;
        
        
        [[self titulo] setText:cell.textLabel.text];

    }
}

- (void)AdicionarBibliotecaViewControllerDidCancelar:(AdicionarBibliotecaViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)AdicionarBibliotecaViewControllerDidPronto:(AdicionarBibliotecaViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bibliotecas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSManagedObject *biblioteca = [self.bibliotecas objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[biblioteca valueForKey:@"nomeDir"]];
    [[cell detailTextLabel] setText:[biblioteca valueForKey:@"descricao"]];
    return cell;
}


 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }

- (BOOL) deletaDiretorio:(NSString*) path
{
    
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
     
     NSManagedObjectContext *context = [self managedObjectContext];
     NSManagedObject *biblioteca = [self.bibliotecas objectAtIndex:indexPath.row];
     
     //deleta a pasta dentro do aplicativo
     [self deletaDiretorio:[biblioteca valueForKey:@"dirPath"]];
     
     
     // Delete object from database
     [context deleteObject:[self.bibliotecas objectAtIndex:indexPath.row]];
     
     NSError *error = nil;
     if (![context save:&error]) {
         NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
         return;
     }
     
     // Remove device from table view
     [self.bibliotecas removeObjectAtIndex:indexPath.row];
     [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */


@end
