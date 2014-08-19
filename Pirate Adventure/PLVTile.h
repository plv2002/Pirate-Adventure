//
//  PLVTile.h
//  Pirate Adventure
//
//  Created by Paul Vana on 7/20/14.
//  Copyright (c) 2014 Paul Vana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "PLVWeapon.h"
#import "PLVArmor.h"

@interface PLVTile:NSObject

@property (strong,nonatomic) NSString *story;
@property (strong,nonatomic) UIImage *backgroundImage;
@property(strong,nonatomic) NSString *actionButtonName;
@property(nonatomic,strong) PLVWeapon *weapon;
@property(nonatomic,strong) PLVArmor *armor;
@property(nonatomic) int healthEffect;

@end
