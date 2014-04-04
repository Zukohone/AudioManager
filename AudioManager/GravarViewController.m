//
//  GravarViewController.m
//  AudioMenager_01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 31/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import "GravarViewController.h"

@interface GravarViewController ()


@end

@implementation GravarViewController
@synthesize gravador;

- (IBAction)gravarBTtap:(id)sender {
    
    [self setGravador:nil];
    
    UIButton *gravarBT = (UIButton*)sender;
    if (gravarBT.selected == NO) {
        [gravarBT setImage:[UIImage imageNamed:@"micBT-ON.png"] forState:UIControlStateNormal];
        [self setGravador:[[Gravador alloc] init]];
        [self.gravador.gravador prepareToRecord];
        [self.gravador.gravador record];
        
    } else {
        [gravarBT setImage:[UIImage imageNamed:@"micBT.png"] forState:UIControlStateNormal];
        [self.gravador.gravador stop];
        
    }
    
    gravarBT.selected = !gravarBT.selected;
    
}

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
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
