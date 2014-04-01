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
    [self.delegate AdicionarBibliotecaViewControllerDidPronto:self];
}

@end
