//
//  AdicionarBibliotecaViewController.h
//  AudioMenager
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 27/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdicionarBibliotecaViewController;

@protocol AdicionarBibliotecaViewControllerDelegate <NSObject>
- (void)AdicionarBibliotecaViewControllerDidCancelar:(AdicionarBibliotecaViewController *)controller;
- (void)AdicionarBibliotecaViewControllerDidPronto:(AdicionarBibliotecaViewController *)controller;
@end

@interface AdicionarBibliotecaViewController : UITableViewController

@property (nonatomic, weak) id <AdicionarBibliotecaViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *labelNome;
@property (weak, nonatomic) IBOutlet UITextField *labelDesc;
@property (strong) NSMutableArray *sounds;

@end
