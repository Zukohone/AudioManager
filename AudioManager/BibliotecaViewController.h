//
//  BibliotecaViewController.h
//  AudioMenager_01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 31/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioPlayer.h"
#import "TituloCell.h"

@interface BibliotecaViewController : UITableViewController

@property AudioPlayer *audio;
@property (strong, nonatomic) NSMutableArray *sondsList;
@property (strong, nonatomic) NSMutableArray *sondsListClean;
@property (weak, nonatomic) IBOutlet UIButton *playPause;
@property (weak, nonatomic) IBOutlet UISlider *slider;

-(IBAction)playPauseTapped:(id)sender;

@end
