//
//  ViewController.m
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/7/15.
//  Copyright (c) 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

- (void)loadView {
  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
  redView.backgroundColor = [UIColor redColor];
  [rootView addSubview:redView];
  self.view = rootView;

}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
//  UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
//  tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//  tableView.delegate = self;
//  tableView.dataSource = self;
//  [tableView reloadData];
//  
//  [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
