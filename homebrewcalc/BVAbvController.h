//
//  BVSecondViewController.h
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
@interface BVAbvController : GAITrackedViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField* originalGravity;
@property (strong, nonatomic) IBOutlet UITextField* finalGravity;
- (IBAction)postToFacebook:(id)sender;
- (IBAction)findRecipes:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *abvLabel;
- (IBAction)finalGravityChanged:(id)sender;
@end
