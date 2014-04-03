//
//  AudioPlayer.h
//  AudioManager
//
//  Created by ICARO NASCIMENTO FERREIRA on 03/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioPlayer : NSObject <AVAudioPlayerDelegate>

@property AVPlayer *player;

@end

