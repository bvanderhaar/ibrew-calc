//
//  BVSecondViewController.h
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BVAbvController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField* originalGravity;
@property (strong, nonatomic) IBOutlet UITextField* finalGravity;
@property (strong, nonatomic) IBOutlet UITextField* abvPercentage;
@end
