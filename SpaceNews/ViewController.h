//
//  ViewController.h
//  SpaceNews
//
//  Created by fis on 1/28/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *NewsTableView;
@property (nonatomic, retain)NSArray *list;
@end

