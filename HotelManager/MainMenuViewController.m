//
//  MainMenuViewController.m
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright (c) 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import "MainMenuViewController.h"
#import "HotelViewController.h"
#import "SelectDateViewController.h"

@interface MainMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray *menuTitleItems;

@end

@implementation MainMenuViewController


- (void)loadView{
  self.title = @"Main Menu";
  self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];

  self.tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  self.tableView.backgroundColor = [UIColor whiteColor];
  
  UIView *darkView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
  darkView.backgroundColor = [UIColor blackColor];

  // Add in NLayoutConstraints to TableView:
  self.view = self.tableView;
  [self.tableView addSubview:rootView];
//  [rootView addSubview:self.tableView];
//  self.view = rootView;
//  
  }

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MainMenuCell"];
  
  self.menuTitleItems = @[@"Browse a Room", @"Book a Room", @"Look Up Reservation"];
  [self.tableView reloadData];
  
}

#pragma mark - MainMenuTableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return  [self.menuTitleItems count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainMenuCell" forIndexPath:indexPath];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainMenuCell"];
  }
  cell.textLabel.text = [self.menuTitleItems objectAtIndex:indexPath.row];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  NSString *menuSelected = [self.menuTitleItems objectAtIndex:indexPath.row];
  
  if ([menuSelected isEqualToString:@"Browse a Room"]) {
    NSLog(@"Browse a Rooom");
    //initialize controller
    HotelViewController *hotelListViewController = [[HotelViewController alloc]init];
    [self.navigationController pushViewController:hotelListViewController animated:YES];
    //push onto the navigation stack
  }else if ([menuSelected isEqualToString:@"Look Up Reservation"]){
    NSLog(@"Looking up that Reserv");
  }else if ([menuSelected isEqualToString:@"Book a Room"]){
    SelectDateViewController *selectDateViewController = [[SelectDateViewController alloc] init];
    [self.navigationController pushViewController:selectDateViewController animated:YES];
    NSLog(@"Book it");
  }
}

@end
