//
//  DetailWebViewController.m
//  LiftLog
//
//  Created by Christian Ing on 21/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "DetailWebViewController.h"

@interface DetailWebViewController ()

@end

@implementation DetailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO; // eliminate a gap between navbar and uiwebview
    
    // Multi-threading method GCD
    dispatch_queue_t downloadQueue = dispatch_queue_create("Article downloader", NULL);
    // Get the URL from selected row on Newsfeeds, trim any white space and new line
    NSURL *myURL = [NSURL URLWithString: [self.url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    dispatch_async(downloadQueue, ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.webView loadRequest:request]; // load the URL into the web view
        });
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)exitPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
