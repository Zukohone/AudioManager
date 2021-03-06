//
//  AudioMenagerViewController.h
//  AudioMenager_01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 31/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdicionarBibliotecaViewController.h"
#import "TituloCell.h"

@interface AudioMenagerViewController : UITableViewController <AdicionarBibliotecaViewControllerDelegate>

@property (strong) NSMutableArray *bibliotecas;

@property TituloCell* titulo;

@end
