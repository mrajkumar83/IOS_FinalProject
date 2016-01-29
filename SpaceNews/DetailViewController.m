//
//  DetailedViewController.m
//  NewsApp
//
//  Created by Guest User on 29/01/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _url = [_url stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    _detailViewControllerLabel.text = _detailViewControllerString;
    _detailViewControllerDescription.text = _detailViewControllerdescription;
    _detailViewControllerLink.text = _url;
    //NSURL *myURL = [NSURL URLWithString: _url];
    //NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    //[_webView setDelegate: self];
    
    //[self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
