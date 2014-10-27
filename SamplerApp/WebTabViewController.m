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
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *urlText = @"http://www.google.com";
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)configureView {
//    NSURL *url = _urlTextField.text;
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end