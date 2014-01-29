//
//  BVPrimingSugarViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/11/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVPrimingSugarViewController.h"
#import <Social/Social.h>

@interface BVPrimingSugarViewController ()

@end

@implementation BVPrimingSugarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenName = @"Priming Sugar Calculator";
    // Do any additional setup after loading the view.
    self.temperature.delegate = self;
    self.beerVolume.delegate = self;
    self.co2Volume.delegate = self;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    float lastPrimingSugarTemp = [userDefaults floatForKey:@"lastPrimingSugarTemp"];
    float lastPrimingSugarYield = [userDefaults floatForKey:@"lastPrimingSugarYield"];
    float lastPrimingSugarVolume = [userDefaults floatForKey:@"lastPrimingSugarVolume"];
    if (lastPrimingSugarTemp != 0)
    {
        self.temperature.text = [NSString stringWithFormat:@"%.3f", lastPrimingSugarTemp];
    }
    
    if (lastPrimingSugarYield != 0)
    {
        self.beerVolume.text = [NSString stringWithFormat:@"%.3f", lastPrimingSugarYield];
    }
    
    if (lastPrimingSugarVolume != 0)
    {
        self.co2Volume.text = [NSString stringWithFormat:@"%.3f", lastPrimingSugarVolume];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = @"";
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    
    if ([self.beerVolume.text length] == 0)
    {
        self.beerVolume.placeholder = @"Yield in Gallons";
    }
    
    if ([self.temperature.text length] == 0)
    {
        self.temperature.placeholder = @"Temp";
    }
    
    if ([self.co2Volume.text length] == 0)
    {
        self.co2Volume.placeholder = @"Volumes of CO\u2082";
    }
    
    [self updateSugarAmount];
    [self.co2Volume resignFirstResponder];
    return YES;
}

- (float)sugarAmountInGrams : (float) volume : (float) co2Volume : (float) temperature
{
    return 15.195 * volume * ( co2Volume - 3.0378 + .050062 * temperature - .00026555 * temperature * temperature );
}

- (IBAction)postToFacebook:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:[self.beerVolume.text stringByAppendingString:@" gallons of beer of my new brew being bottled"]];
        [self presentViewController:facebookVC animated:YES completion:NULL];
    }
}

- (void) updateSugarAmount
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    float beerVolume = [self.beerVolume.text floatValue];
    float co2Volume = [self.co2Volume.text floatValue];
    float temperature = [self.temperature.text floatValue];
    [userDefaults setFloat:beerVolume forKey:@"lastPrimingSugarYield"];
    [userDefaults setFloat:temperature forKey:@"lastPrimingSugarTemp"];
    [userDefaults setFloat:co2Volume forKey:@"lastPrimingSugarVolume"];
    float sugarAmountToDisplay = [self sugarAmountInGrams: beerVolume: co2Volume: temperature];
    if (sugarAmountToDisplay > 0)
    {
        self.sugarAmountLabel.text = [NSString stringWithFormat:@"%.3f g", sugarAmountToDisplay];
    }
    else
    {
        self.sugarAmountLabel.text = nil;
    }
    [userDefaults synchronize];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.co2Volume isFirstResponder] && [touch view] != self.co2Volume) {
        [self.co2Volume resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)sugarAmountChanged:(id)sender
{
    [self updateSugarAmount];
}
@end
