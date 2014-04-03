//
//  BibliotecaViewController.m
//  AudioMenager_01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 31/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "BibliotecaViewController.h"

@interface BibliotecaViewController ()

@end

@implementation BibliotecaViewController

@synthesize audio, sondsList, sondsListClean;

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

//-(void)filtra{
//    for(int i = 0; i<self.sondsList.count; i++){
//        if([self.sondsList)
//    }
//}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the musicas from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Musica"];
    
    self.sondsList = [[managedObjectContext executeFetchRequest:fetchRequest error:nil]mutableCopy];

    
    [self.tableView reloadData];
}

//player
-(IBAction)playPauseTapped:(id)sender
{
    
    if (self.playPause.selected)
    {
        //[self.audio.player pause];
        [self.playPause setImage:[UIImage imageNamed:@"pause.ico"]forState:UIControlStateNormal];
        [self.playPause setSelected:NO];
    }
    else
    {
        //[self.audio.player play];
        [self.playPause setImage:[UIImage imageNamed:@"play.ico"]forState:UIControlStateNormal];
        [self.playPause setSelected:YES];
    }
}



//tabela
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sondsList.count;
}
-(void)filtro:(NSIndexPath *)indexPath{
    TituloCell *sharedManager = [TituloCell sharedTituloCell];
    NSManagedObject *sound = [self.sondsList objectAtIndex:indexPath.row];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    //MPMediaItem *song = [self.songsList objectAtIndex:indexPath.row];
    //NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
    //NSString *durationLabel = [song valueForProperty: MPMediaItemPropertyGenre];
    
    TituloCell *sharedManager = [TituloCell sharedTituloCell];
    
    NSManagedObject *sound = [self.sondsList objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText:[sound valueForKey:@"nome"]];
    //[[cell detailTextLabel] setText:[biblioteca valueForKey:@"descricao"]];
    //cell.detailTextLabel.text = durationLabel;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[self.audio.player pause];
    //MPMediaItem *song = [self.songsList objectAtIndex:indexPath.row];
    //AVPlayerItem * currentItem = [AVPlayerItem playerItemWithURL:[song valueForProperty:MPMediaItemPropertyAssetURL]];
    
    //[self.audio.player replaceCurrentItemWithPlayerItem:currentItem];
    //[self.audio.player play];
    //[self.playPause setSelected:YES];
    
    //[self.slider setMaximumValue:self.audio.player.currentItem.duration.value / self.audio.player.currentItem.duration.timescale];
}

@end
