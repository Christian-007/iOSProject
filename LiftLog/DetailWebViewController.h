//
//  DetailWebViewController.h
//  LiftLog
//
//  Created by Christian Ing on 21/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailWebViewController : UIViewController

- (IBAction)exitPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong) NSString *url;
@end
