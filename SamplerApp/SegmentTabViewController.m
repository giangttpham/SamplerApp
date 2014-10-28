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
    // Do any additional setup after loading the view.
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
- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting = sender.isOn;
    [self.progressSwitch setOn:setting animated:YES];
    if (self.progressSwitch.on)
        [self.progressActivityIndicator startAnimating];
    else
        [self.progressActivityIndicator stopAnimating];
   
}
- (IBAction)doneEdittingButtonPressed:(id)sender {
    [self.segmentTextView resignFirstResponder];
}

- (IBAction)alertButtonPressed:(id)sender {
    NSString *message = @"Do you like iPhone?";
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Alert message"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
