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
    
    _detailViewControllerLabel.text = _detailViewControllerString;
    _url = [_url stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSURL *myURL = [NSURL URLWithString: _url];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    //[_webView setDelegate: self];
    
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //read your request here
    //before the webview will load your request
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //access your request
    //_textContent.request;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    //access your request
    //_textContent.request;
    //spinner.stopAnimating;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"could not load the website caused by error: %@", error);
}

@end
