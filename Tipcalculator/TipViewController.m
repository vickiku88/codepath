//
//  ViewController.m
//  Tipcalculator
//
//  Created by Victoria Ku on 3/6/17.
//  Copyright © 2017 Codepath. All rights reserved.
//


#import "TipViewController.h"
#import "SettingsViewController.h"


@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

@property (nonatomic,weak) IBOutlet UIImageView *firstView;
@property (nonatomic,weak) IBOutlet UIImageView *secondView;


- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;

@end

@implementation TipViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateValues];
    [self loadDefaultTipPercent];
    self.title = @"Tip Calculator";
    
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger intValue = [defaults integerForKey:@"defaultTipKey"];
    
    //self.tipControl.selectedSegmentIndex = intValue;
    NSLog(@"TipView: %d", intValue);

    
    
    
 }


- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
    NSLog(@"settingsbutton");


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)OnValueChange:(UISegmentedControl *)sender {
    [self updateValues];
    NSLog(@"onvaluechange");
    [self updateValues];

}




 - (IBAction)onTap:(UITapGestureRecognizer *)sender {
 [self.view endEditing:YES];
 [self updateValues];
     [self loadDefaultTipPercent];
 }

- (void)updateValues{
    NSLog(@"updateValues");
    
    
    //get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // compute tip and total
    NSArray *tipValues = @[@(0.15),@(0.2),@(0.25)];
    float tipAmount = [tipValues [self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    //update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];

    
}


/*
- (void) updateTipUsingDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultValue = [defaults integerForKey:@"default_tip_key"];
    [self.tipControl setSelectedSegmentIndex:defaultValue];
}*/

- (void)loadDefaultTipPercent {
     NSInteger tipPercentPreference = [[NSUserDefaults standardUserDefaults] integerForKey:@"defaultTipKey"];
    NSLog(@"Saved default loaddefault: %d", tipPercentPreference);
    [self.tipControl setSelectedSegmentIndex: tipPercentPreference];
}


- (void)viewWillAppear:(BOOL)animated {
    [self loadDefaultTipPercent];
    
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    
    self.firstView.alpha = 0;
    self.secondView.alpha = 1;
    [UIView animateWithDuration:0.4 animations:^{
        // This causes first view to fade in and second view to fade out
        self.firstView.alpha = 1;
        self.secondView.alpha = 0;
        NSLog(@"adnimating!");

    } completion:^(BOOL finished) {
        // Do something here when the animation finishes.
        NSLog(@"Done!");

    }];
    
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}


@end
