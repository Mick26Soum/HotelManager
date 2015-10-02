//
//  RoomViewController.m
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright © 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import "RoomViewController.h"

@interface RoomViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) NSArray *rooms;

@end

@implementation RoomViewController

- (void)loadView{
  self.title = @"Available Rooms";
  
  // set rootView Controller
  UIView *rootView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//  [rootView setTranslatesAutoresizingMaskIntoConstraints:false];
  
  // instantite UITableView
  self.tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
  [self.tableView setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:self.tableView];
  
  NSDictionary *views = @{@"tableView" : self.tableView};
  
  //set constraints
  NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewHorizontalConstraints];
  
  NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewVerticalConstraints];
  
//  self.view= self.tableView;
//  [self.tableView addSubview:rootView];
  self.view = rootView;
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.rowHeight = 90;
  self.rooms = [self.hotel.rooms allObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate, UITableDataSoure - methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [self.rooms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  }
  
  Room *room = [self.rooms objectAtIndex:indexPath.row];
//  cell.textLabel.text = [NSString stringWithFormat:<#(nonnull NSString *), ...#>]
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.text =[NSString stringWithFormat:@"Room #: %@\nNumber of Beds: %@\nRate: %@", room.number, room.beds, room.rate];

  return cell;
  
}

@end
