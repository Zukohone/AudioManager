//
//  Gravador.h
//  AudioManager
//
//  Created by ICARO NASCIMENTO FERREIRA on 01/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "TituloCell.h"
@interface Gravador : NSObject <AVAudioRecorderDelegate>

@property (strong) AVAudioRecorder *gravador;
-(void)preparaGravador;
- (NSString *) dateString;
@end
