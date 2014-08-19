//
//  PLVFactory.h
//  Pirate Adventure
//
//  Created by Paul Vana on 7/22/14.
//  Copyright (c) 2014 Paul Vana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLVCharacter.h"
#import "PLVBoss.h"

@interface PLVFactory : NSObject

-(NSArray *)tiles;
-(PLVCharacter *)character;
-(PLVBoss *)boss;
@end
