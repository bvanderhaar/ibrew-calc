//
//  BVFirstViewController.h
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BVSpecificGravityController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField* originalGravity;
@property (strong, nonatomic) IBOutlet UITextField* temperature;
- (IBAction)postToFacebook:(id)sender;
- (IBAction)findRecipes:(id)sender;
- (IBAction)tempEditingChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *specificGravity;
@end
