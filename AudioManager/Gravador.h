//
//  Gravador.h
//  AudioManager
//
//  Created by ICARO NASCIMENTO FERREIRA on 01/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Gravador : NSObject <AVAudioRecorderDelegate>
{
    AVAudioRecorder *gravador;
}

-(void)preparaGravador;
- (NSString *) dateString;
@end
