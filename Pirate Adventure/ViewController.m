//
//  ViewController.m
//  Pirate Adventure
//
//  Created by Paul Vana on 7/1/14.
//  Copyright (c) 2014 Paul Vana. All rights reserved.
//

#import "ViewController.h"
#import "PLVFactory.h"
#import "PLVTile.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PLVFactory *factory = [[PLVFactory alloc]init];
    self.tiles = [factory tiles]; //holds tiles objects
    self.character = [factory character]; //hold character model
    self.boss = [factory boss]; //holds boss character model
    
    self.currentPoint = CGPointMake(0, 0); //Starts in bottom left of grid
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffects:0]; //Set initial values for character
    
    [self updateTile];
    [self updateButtons];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions  //Puts bookmark and divider

//Action Button Pressed
- (IBAction)actionButtonPressed:(UIButton *)sender
{
    PLVTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    
    //Check to see if you are on the boss tile(since it is the only one that removes 15 hit points)
    if(tile.healthEffect == -15)
    {
        self.boss.health = self.boss.health - self.character.damage; //takes off hit points based on weapon player is carrying
    }
    
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffects:tile.healthEffect];
    
    //Alert player if they died
    if(self.character.health <=0)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Death Message" message:@"You have died, please restart game!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show]; //show the message
    }
    else if(self.boss.health <=0)  // Test Boss's health
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Victory Message" message:@"You have defeated the pirate Boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show]; //Show message
    }
    
    [self updateTile];
}

//Reset Button Pressed
- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.character = nil; //sets character to nil to wipe it
    self.boss = nil; //sets boss to nil to wipe it
    [self viewDidLoad]; //calls viewdidload to restart game
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    //Advance the tile up one for the the north button
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y +1);
    [self updateButtons];//Call to update what buttons are hidden
    [self updateTile];//call to update story info
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    //Advance the tile right one for the the east button
    self.currentPoint = CGPointMake(self.currentPoint.x +1, self.currentPoint.y);
    [self updateButtons];//Call to update what buttons are hidden
    [self updateTile];//call to update story info
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    //Advance the tile down one for the the south button
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y -1);
    [self updateButtons];//Call to update what buttons are hidden
    [self updateTile];//call to update story info
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    //Advance the tile left one for the the west button
    self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    [self updateButtons];//Call to update what buttons are hidden
    [self updateTile];//call to update story info
}

#pragma mark - Helper Methods

//Helper Methods
-(void)updateTile
{
    PLVTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i",self.character.health];  //converts int to string to place in text field
    self.damageLabel.text = [NSString stringWithFormat:@"%i",self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
}

//Calls to verfiy which direction you can move
-(void)updateButtons
{
    //subtract one from the x axis to make sure you can move that way.  Calls the tileExistsAtPoint and passes in the current point with subtracting one fromt the X
    self.westButton.hidden  = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
    self.eastButton.hidden  = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.northButton.hidden  = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y +1)];
    self.southButton.hidden  = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)];
}

//Check to see if tile exists at point on grid system
-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    //make sure the tile is not in the negative of the y and x axis.  Make sure the x and y is not greater then the number of columns and rows
    if(point.y >= 0 && point.x >= 0 && point.x < self.tiles.count && point.y < [[self.tiles objectAtIndex:point.x] count])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(PLVArmor *) armor withWeapons:(PLVWeapon *) weapon withHealthEffects:(int) healthEffect
{
    //Test if armor is passed on title
    if (armor != nil)
    {
        //New health is = current health - current armor rating and add new armor rating
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil)
    {
        //New damage is = current damage - current weapon rating and add new weapon rating
        self.character.damage = self.character.damage  -self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if(healthEffect != 0)
    {
        self.character.health = self.character.health + healthEffect;
    }
    else
    {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
    
}

@end
