//
//  ViewController.h
//  NewsApp
//
//  Created by Guest User on 29/01/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate> {
    
    NSXMLParser * parser;
    NSMutableArray * feeds;
    NSMutableDictionary * item;
    NSMutableString * title;
    NSMutableString * link;
    NSString * element;
}

@property (nonatomic, retain) NSArray * list;

@property (nonatomic, retain) IBOutlet UITableView * tableView;

@end

