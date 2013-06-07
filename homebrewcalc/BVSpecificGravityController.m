//
//  BVFirstViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVSpecificGravityController.h"
#import "BVGravityTextField.h"

@interface BVSpecificGravityController ()

@end

@implementation BVSpecificGravityController

- (void)viewDidLoad
{
    self.originalGravity.delegate = self;
    self.temperature.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) textFieldDidBeginEditing:(BVGravityTextField *)textField
{
    if ([textField.text length] == 0)
    {
        NSLog(@"text field is empty");
    }
    textField.placeholder = @"";
    NSLog(@"textFieldDidBeginEditing");

}

- (BOOL) textFieldShouldBeginEditing:(BVGravityTextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}


@end
