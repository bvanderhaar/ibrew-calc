//
//  BVEfficiencyCalculatorViewController.h
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/21/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

@interface BVEfficiencyCalculatorViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *originalGravity;
@property (weak, nonatomic) IBOutlet UITextField *volume;
@property (weak, nonatomic) IBOutlet UITextField *ppg;
@property (weak, nonatomic) IBOutlet UILabel *efficiencyPercentage;

@end
