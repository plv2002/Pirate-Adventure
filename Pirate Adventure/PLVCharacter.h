//
//  PLVCharacter.h
//  Pirate Adventure
//
//  Created by Paul Vana on 7/30/14.
//  Copyright (c) 2014 Paul Vana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLVArmor.h"  //Import header files from armor and weapon classes so you can create instances of them for the character
#import "PLVWeapon.h"

@interface PLVCharacter : NSObject

@property(nonatomic, strong) PLVArmor *armor;
@property(nonatomic,strong) PLVWeapon *weapon;
@property(nonatomic) int damage;
@property(nonatomic) int health;

@end
