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
    
   
    
    if ( [_detailViewControllerimage isEqualToString:@""] )
    {
        _detailViewControllerImage.image = [UIImage imageNamed:@"default.jpg"];//Default Image        
        
    }else{
         NSURL * imageURL = [NSURL URLWithString:_detailViewControllerimage];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        [_detailViewControllerImage setImage: image];
        
    }
    
    
    [self.activityIndicatorView stopAnimating];
    
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
