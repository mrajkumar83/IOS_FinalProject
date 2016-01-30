//
//  DetailedViewController.h
//  NewsApp
//
//  Created by Guest User on 29/01/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, retain) NSString * detailViewControllerString;
@property (nonatomic, retain) NSString * detailViewControllerdescription;
@property (nonatomic, retain) NSString * detailViewControllerimage;

@property (nonatomic, retain) IBOutlet UILabel * detailViewControllerLabel;
@property (nonatomic, retain) IBOutlet UILabel * detailViewControllerDescription;
@property (nonatomic, retain) IBOutlet UILabel * detailViewControllerLink;
@property (nonatomic, retain) IBOutlet UIImageView * detailViewControllerImage;

@property (copy, nonatomic) NSString *url;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
