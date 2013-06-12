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
@property (strong, nonatomic) IBOutlet UITextField* specificGravity;
- (IBAction)postToFacebook:(id)sender;
@end
