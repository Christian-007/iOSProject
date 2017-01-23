//
//  NewsfeedTableViewController.h
//  LiftLog
//
//  Created by Christian Ing on 21/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsfeedTableViewController : UITableViewController <NSXMLParserDelegate>

@property (strong) NSMutableArray *allArticles;
@property (strong) NSXMLParser *xmlParser;
@property (strong) NSMutableArray *newsfeeds;
@property (strong) NSMutableDictionary *item;
@property (strong) NSMutableString *linkTitle;
@property (strong) NSMutableString *link;
@property (strong) NSMutableString *pubDate;
@property (strong) NSString *element;

@end
