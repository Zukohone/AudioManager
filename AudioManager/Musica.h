//
//  Musica.h
//  AudioManager
//
//  Created by Icaro Nascimento Ferreira on 03/04/14.
//  Copyright (c) 2014 ICARO NASCIMENTO FERREIRA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Musica : NSManagedObject

@property (nonatomic, retain) NSString * diretorio;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * pathUrl;

@end
