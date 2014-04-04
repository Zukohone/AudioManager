//
//  TituloCell.m
//  AudioManager
//
//  Created by ICARO NASCIMENTO FERREIRA on 03/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import "TituloCell.h"

@implementation TituloCell

@synthesize text;

+ (id)sharedTituloCell {
    static TituloCell *sharedTituloCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTituloCell = [[self alloc] init];
    });
    return sharedTituloCell;
}



- (id)init {
    if (self = [super init]) {
        text = [[NSString alloc] init];
    }
    return self;
}

@end