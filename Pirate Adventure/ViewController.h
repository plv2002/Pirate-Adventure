//
//  ViewController.h
//  Pirate Adventure
//
//  Created by Paul Vana on 7/1/14.
//  Copyright (c) 2014 Paul Vana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLVCharacter.h"
#import "PLVBoss.h"


@interface ViewController : UIViewController

//iVars(Instance Variables)
@property(nonatomic) CGPoint currentPoint;
@property(nonatomic,strong) NSArray *tiles;
@property(nonatomic,strong) PLVCharacter *character;
@property(nonatomic,strong) PLVBoss *boss;

//IBOutlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

//IBActions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;



@end

