//
//  SegmentTabViewController.m
//  SamplerApp
//
//  Created by Tra` Beo' on 10/27/14.
//  Copyright (c) 2014 Giang Pham. All rights reserved.
//

#import "SegmentTabViewController.h"

@interface SegmentTabViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *progressSwitch;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progressActivityIndicator;
@property (weak, nonatomic) IBOutlet UIButton * doneEditingButton;
@property (weak, nonatomic) IBOutlet UITextView *segmentTextView;
@property (weak, nonatomic) IBOutlet UIButton *alertButton;
@end

@implementation SegmentTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //show Progress features upon loading view
    self.progressSwitch.hidden = NO;
    self.progressActivityIndicator.hidden = NO;
    self.segmentTextView.hidden = YES;
    self.doneEditingButton.hidden = YES;
    self.alertButton.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// show/hide features according to selected option
- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.progressSwitch.hidden = NO;
        self.progressActivityIndicator.hidden = NO;
        self.segmentTextView.hidden = YES;
        self.doneEditingButton.hidden = YES;
        self.alertButton.hidden = YES;
    }
    else if (sender.selectedSegmentIndex == 1) {
        self.progressSwitch.hidden = YES;
        self.progressActivityIndicator.hidden = YES;
        self.segmentTextView.hidden = NO;
        self.doneEditingButton.hidden = NO;
        self.alertButton.hidden = YES;
    }
    else {
        self.progressSwitch.hidden = YES;
        self.progressActivityIndicator.hidden = YES;
        self.segmentTextView.hidden = YES;
        self.doneEditingButton.hidden = YES;
        self.alertButton.hidden = NO;
    }
        
        
}

// in Progress option
- (IBAction)switchChanged:(UISwitch *)sender {
    //on/off switch reponds to start/stop activity indicator respectively
    BOOL setting = sender.isOn;
    [self.progressSwitch setOn:setting animated:YES];
    if (self.progressSwitch.on)
        [self.progressActivityIndicator startAnimating];
    else
        [self.progressActivityIndicator stopAnimating];
}

// in Text option
- (IBAction)doneEdittingButtonPressed:(id)sender {
    [self.segmentTextView resignFirstResponder];
}

// in Alert option
- (IBAction)alertButtonPressed:(id)sender {
    //show message when button is pressed
    NSString *message = @"Do you like iPhone?";
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Alert message"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}


@end
