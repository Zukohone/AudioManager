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
}

- (void)AdicionarBibliotecaViewControllerDidCancelar:(AdicionarBibliotecaViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)AdicionarBibliotecaViewControllerDidPronto:(AdicionarBibliotecaViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [[cell textLabel] setText:@"Titulo"];
    [[cell textLabel] setText:@"subTexto"];
    
    return cell;
}

@end
