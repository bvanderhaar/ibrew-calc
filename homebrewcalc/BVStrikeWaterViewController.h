//
//  BVStrikeWaterViewController.h
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/21/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "GAITrackedViewController.h"

@interface BVStrikeWaterViewController : GAITrackedViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *density;
@property (weak, nonatomic) IBOutlet UITextField *totalGrain;
@property (weak, nonatomic) IBOutlet UILabel *totalVolume;

@end
