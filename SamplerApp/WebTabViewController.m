//
//  WebTabViewController.m
//  SamplerApp
//
//  Created by Tra` Beo' on 10/27/14.
//  Copyright (c) 2014 Giang Pham. All rights reserved.
//

#import "WebTabViewController.h"

@interface WebTabViewController ()
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *sampleWebView;

@end

@implementation WebTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.urlTextField setReturnKeyType:UIReturnKeyDone];

    //load google.com upon loading view
    self.urlTextField.text = @"http://www.google.com";
    NSString *urlText = [self.urlTextField text];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.sampleWebView loadRequest:request];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDoneEditing:(id)sender {
    //close keyboard and load the appropriate webpage based on entered URL
    [sender resignFirstResponder];
    NSString *urlText = [self.urlTextField text];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.sampleWebView loadRequest:request];

}


@end
