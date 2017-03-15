//
//  SettingsViewController.m
//  Tipcalculator
//
//  Created by Victoria Ku on 3/8/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
/*@property (weak, nonatomic) IBOutlet UITextField *defaultTipPercentage;
    UISegmentedControl *defaultTipControl;
- (IBAction)defaultTipChanged:(id)sender;
@end*/
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)defaultTipChanged:(id)sender;
@end


@implementation SettingsViewController

static NSString* defaultTipKey = @"default_tip_key";


- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.defaultTipControl setSelectedSegmentIndex:[self getStoredDefaultTipValue]];

    // Do any additional setup after loading the view.
    self.title = @"Default Settings";
    
    // get user preferences
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Get the default tip (by segment index). I checked to make sure
    // that if the user hasn't set a default, we get 0 (a reasonable value)
    int defaultTipIdx = [defaults integerForKey:@"defaultTipKey"];
    
    // Apply the value we got from preferences to the segmented control
    self.defaultTipControl.selectedSegmentIndex = defaultTipIdx;
    
}


- (IBAction)defaultTipChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   
    
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"defaultTipKey"];
    [defaults synchronize];
    
    NSLog(@"Saved default index0: %d", self.defaultTipControl.selectedSegmentIndex);
}

/*- (int) getStoredDefaultTipValue {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults integerForKey:defaultTipKey];
}*/


@end
