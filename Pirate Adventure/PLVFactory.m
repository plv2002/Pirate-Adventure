//
//  PLVFactory.m
//  Pirate Adventure
//
//  Created by Paul Vana on 7/22/14.
//  Copyright (c) 2014 Paul Vana. All rights reserved.
//

#import "PLVFactory.h"
#import "PLVTile.h"

@implementation PLVFactory

//This will make the coordinate system for the player to move on.


//36912
//25811
//14710
-(NSArray *)tiles
{
    //there will be thress tiles per colum
    PLVTile *tile1 = [[PLVTile alloc] init];
    tile1.story = @"Captin, we need a fearless leader to lead us on the dangerous voyage, would you like a blunted sword to take with you?";
    tile1.backgroundImage  = [UIImage imageNamed:@"PirateStart.jpg"];
    PLVWeapon *bluntedSword = [[PLVWeapon alloc]init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName  = @"Take Sword";
    
    PLVTile *tile2 = [[PLVTile alloc] init];
    tile2.story = @"You have come across a armory, would you like to upgrade to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    PLVArmor *steelArmor = [[PLVArmor alloc]init];
    steelArmor.name =@"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take Armor";
    
    PLVTile *tile3 = [[PLVTile alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon, would like to stop and get our bearings?";
    tile3.backgroundImage  =[UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop at Dock";
    
    //Makes an array of the three tiles to make the column
    NSMutableArray  *firstColumn = [[NSMutableArray alloc]init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    PLVTile *tile4 = [[PLVTile alloc] init];
    tile4.story = @"You have found a parrot, parrots increase your defense and are loyal to their captin.";
    tile4.backgroundImage  = [UIImage imageNamed:@"PirateParrot.jpg"];
    PLVArmor *parrotArmor = [[PLVArmor alloc]init];
    parrotArmor.name = @"Parrot";
    parrotArmor.health = 6;
    tile4.armor = parrotArmor;
    tile4.actionButtonName = @"Adopt Parrot";
    
    PLVTile *tile5 = [[PLVTile alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons, would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    PLVWeapon *pistolStandard = [[PLVWeapon alloc]init];
    pistolStandard.name = @"Standard Pistol";
    pistolStandard.damage = 16;
    tile5.weapon = pistolStandard;
    tile5.actionButtonName = @"Take Pistol";
    
    PLVTile *tile6 = [[PLVTile alloc] init];
    tile6.story = @"You have been captured and are forced to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Walk the Plank";
    
    NSMutableArray  *secondColumn = [[NSMutableArray alloc]init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    PLVTile *tile7 = [[PLVTile alloc] init];
    tile7.story = @"The lookout has sighted a pirate ship battle in the horizon, should we intervene captin?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Join Ship Battle";
    
    PLVTile *tile8 = [[PLVTile alloc] init];
    tile8.story = @"The legend of the deep, the mighty Kraken appears";
    tile8.backgroundImage  = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Fight Kraken";
    
    PLVTile *tile9 = [[PLVTile alloc] init];
    tile9.story = @"You have found a hidden treasure chest";
    tile9.backgroundImage  = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take Treasure";
    
    NSMutableArray  *thirdColumn = [[NSMutableArray alloc]init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    PLVTile *tile10 = [[PLVTile alloc] init];
    tile10.story = @"A group of pirates try to board the ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionButtonName = @"Fight Pirate Boarders";
    
    PLVTile *tile11 = [[PLVTile alloc] init];
    tile11.story = @"You have found a another treasure chest, will it bring fortune or ruin?";
    tile11.backgroundImage  = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Collect Treasure";
    
    PLVTile *tile12 = [[PLVTile alloc] init];
    tile12.story = @"You have finally meet the feared pirate Black Beard!! Do you have what it takes to defeat him!!!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight Boss";
    
    NSMutableArray  *forthColumn = [[NSMutableArray alloc]init];
    [forthColumn addObject:tile10];
    [forthColumn addObject:tile11];
    [forthColumn addObject:tile12];
    
    //This will group the the four arrays together and return it.  the below code could also be used for the arry initialization above
    NSArray *tiles = [[NSArray alloc]initWithObjects:firstColumn,secondColumn,thirdColumn,forthColumn, nil];
    
    return tiles;
}

-(PLVCharacter *)character
{
    PLVCharacter *character = [[PLVCharacter alloc]init];
    character.health = 100;
    
    PLVArmor *armor = [[PLVArmor alloc]init];
    armor.name = @"Cloak";
    armor.health   = 5;
    character.armor = armor;
    
    PLVWeapon *weapon = [[PLVWeapon alloc]init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    
    return character;
}

-(PLVBoss *)boss
{
    PLVBoss *boss = [[PLVBoss alloc]init];
    boss.health = 65;
    return boss;
}

@end
