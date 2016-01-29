//
//  ViewController.m
//  SpaceNews
//
//  Created by fis on 1/28/16.
//  Copyright (c) 2016 Epita. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _list=[NSArray arrayWithObjects:@"list 1",@"list 2",@"list 3",nil];
    
   // self.NewsTableView.delegate = self;
    //self.NewsTableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_list count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableIdentifier = @ "Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
        //cell.textLabel.text = [_list objectAtIndex:indexPath.row];
        
    }    cell.textLabel.text = [_list objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text =[_list objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"default.png"];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
