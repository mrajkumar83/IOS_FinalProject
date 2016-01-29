//
//  ViewController.m
//  NewsApp
//
//  Created by Guest User on 29/01/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Find a news feed from the local bundle
    //NSURL * url = [[NSBundle mainBundle]URLForResource:@"news" withExtension:@"xml"];
    NSURL *url = [NSURL URLWithString:@"http://feeds.bbci.co.uk/news/rss.xml"];

    //Initialize data
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    //Initialize parser
    parser = [[NSXMLParser alloc]initWithData:data];
    
    //Initalize feeds
    feeds = [[NSMutableArray alloc]init];
    
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    _list = [NSArray arrayWithObjects: @"List 1", @"List 2", @"List 3", nil];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
    if ([element isEqualToString:@"item"]) {
        item = [[NSMutableDictionary alloc]init];
        title = [[NSMutableString alloc]init];
        link = [[NSMutableString alloc]init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [feeds addObject:[item copy]];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    NSLog(@"%@",feeds);
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    NSDictionary * userInfo = parseError.userInfo;
    NSNumber * lineNumber = userInfo[@"NSXMLParserErrorLineNumber"];
    NSNumber * errorColumn = userInfo[@"NSXMLParserErrorColumn"];
    NSString * errorMessage = userInfo[@"NSXMLParserErrorMessage"];
    NSLog(@"Error at line %@ and column %@: %@", lineNumber, errorColumn, errorMessage);
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //return [_list count];
    return [feeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * tableIdentifier = @"SimpleTableCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    //cell.textLabel.text = [_list objectAtIndex:indexPath.row];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:@"default.png"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"showConnector" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showConnector"]) {
        
        DetailViewController * detailView = segue.destinationViewController;
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        detailView.detailViewControllerString = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
        //detailView.detailViewControllerLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
        //NSLog(@"%@",detailView.detailViewControllerLabel.text);
    }
}

@end
