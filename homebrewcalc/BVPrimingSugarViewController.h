//
//  BVPrimingSugarViewController.h
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/11/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BVPrimingSugarViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *beerVolume;
@property (strong, nonatomic) IBOutlet UITextField *co2Volume;
@property (strong, nonatomic) IBOutlet UITextField *temperature;
@property (weak, nonatomic) IBOutlet UILabel *sugarAmountLabel;
- (IBAction)sugarAmountChanged:(id)sender;

@end
