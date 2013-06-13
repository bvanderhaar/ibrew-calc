//
//  BVSecondViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVAbvController.h"
#import <Social/Social.h>

@interface BVAbvController ()

@end

@implementation BVAbvController

- (void)viewDidLoad
{
    self.originalGravity.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    float gravity = [self.originalGravity.text floatValue];
    float finalGravity = [self.finalGravity.text floatValue];
    //[NSString stringWithFormat:@"%.02f%%",someFloat]
    self.abvPercentage.text = [NSString stringWithFormat:@"%.02f%%", [self abv: gravity: finalGravity]];
    [textField resignFirstResponder];
    return YES;
}

- (float) abv: (float) originalGravity : (float) finalGravity
{
    return ((1.05 * (originalGravity - finalGravity)) / finalGravity) / 0.79 * 100;
}

- (IBAction)postToFacebook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:[self.originalGravity.text stringByAppendingString:@" original gravity on my new brew"]];
        [self presentViewController:facebookVC animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"no facebook available");
    }
}
- (IBAction)findRecipes:(id)sender {
    NSString *stringURL = @"http://beersmithrecipes.com/";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.finalGravity isFirstResponder] && [touch view] != self.finalGravity) {
        [self.finalGravity  resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}
@end
