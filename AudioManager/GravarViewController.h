//
//  GravarViewController.h
//  AudioMenager_01
//
//  Created by GABRIEL FARIA DE CARVALHO TAVARES on 31/03/14.
//  Copyright (c) 2014 GABRIEL FARIA DE CARVALHO TAVARES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Gravador.h"

@interface GravarViewController : UIViewController <AVAudioRecorderDelegate>
@property (weak, nonatomic) IBOutlet UIButton *gravarBT;
@property Gravador * gravador;
@end
