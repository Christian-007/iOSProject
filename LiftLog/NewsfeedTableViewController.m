//
//  NewsfeedTableViewController.m
//  LiftLog
//
//  Created by Christian Ing on 21/01/2017.
//  Copyright © 2017 Christian Ing. All rights reserved.
//

#import "NewsfeedTableViewController.h"
#import "DetailWebViewController.h"

@interface NewsfeedTableViewController ()

@end

@implementation NewsfeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsfeeds = [[NSMutableArray alloc] init];
    
    // Fetch all of the articles from the given RSS Feed
    NSURL *url = [NSURL URLWithString:@"http://www.bodybuilding.com/rss/articles/training"];
    self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    [self.xmlParser setDelegate:self];
    [self.xmlParser setShouldResolveExternalEntities:NO];
    [self.xmlParser parse];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark: NSXMLParser delegate method
// NSXMLParser will go through the given URL and find an XML element <item> in the XML file
// if it finds <item> tag, instantiate the item, title, and link variables
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
    
    if ([self.element isEqualToString:@"item"]) {
        self.item = [[NSMutableDictionary alloc] init];
        self.linkTitle = [[NSMutableString alloc] init];
        self.link = [[NSMutableString alloc] init];
        self.pubDate = [[NSMutableString alloc] init];
    }
}

// If there's <item> tag, it will find characters inside that <item> tag
// Store those <item> details called title and link
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([self.element isEqualToString:@"title"]) {
        [self.linkTitle appendString:string];
    } else if ([self.element isEqualToString:@"link"]) {
        [self.link appendString:string];
    } else if ([self.element isEqualToString:@"pubDate"]) {
        [self.pubDate appendString:string];
    }
    
}

// If it found the end of </item> tag, add each of the object to an array
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        [self.item setObject:self.linkTitle forKey:@"title"];
        [self.item setObject:self.link forKey:@"link"];
        [self.item setObject:self.pubDate forKey:@"pubDate"];
        
        [self.newsfeeds addObject:[self.item copy]];
    }
    
}

// Reload the table view to display the parsed data from XML
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.tableView reloadData];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsfeeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"NewsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [[self.newsfeeds objectAtIndex:indexPath.row] objectForKey: @"title"];
    cell.detailTextLabel.text = [[self.newsfeeds objectAtIndex:indexPath.row] objectForKey:@"pubDate"];
    
    return cell;
}

#pragma mark navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showArticle"]){
        DetailWebViewController *dwvc = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *selectedURL = [self.newsfeeds[indexPath.row] objectForKey: @"link"];
        dwvc.url = selectedURL;
    }
}

@end
