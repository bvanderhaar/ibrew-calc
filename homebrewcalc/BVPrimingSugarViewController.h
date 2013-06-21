//
//  BVPrimingSugarViewController.h
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/11/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
@interface BVPrimingSugarViewController : GAITrackedViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *beerVolume;
@property (strong, nonatomic) IBOutlet UITextField *co2Volume;
@property (strong, nonatomic) IBOutlet UITextField *temperature;
- (IBAction)postToFacebook:(id)sender;
- (IBAction)findRecipes:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *sugarAmountLabel;
- (IBAction)sugarAmountChanged:(id)sender;

@end
