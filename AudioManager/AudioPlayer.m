//
//  AudioPlayer.m
//  AudioManager
//
//  Created by ICARO NASCIMENTO FERREIRA on 03/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "AudioPlayer.h"

@implementation AudioPlayer

@synthesize player;

-(id)init{
    self = [super init];
    if (self) {
        player = [[AVPlayer alloc] init];
    }
    return self;
}

@end
