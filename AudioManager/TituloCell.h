//
//  TituloCell.h
//  AudioManager
//
//  Created by ICARO NASCIMENTO FERREIRA on 03/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TituloCell : NSObject {
    NSString *text;
}

@property (nonatomic, retain) NSString *text;

+ (id)sharedTituloCell;

@end

