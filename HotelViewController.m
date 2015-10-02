//
//  HotelViewController.m
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright © 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import "HotelViewController.h"
#import "RoomViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"

@interface HotelViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *hotels;
@property(strong, nonatomic) UITableView *tableView;

@end

@implementation HotelViewController

- (void)loadView{
  self.title = @"Hotel Listings";
  
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  self.tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  self.tableView.backgroundColor = [UIColor whiteColor];
  
  self.view= self.tableView;
  [self.tableView addSubview:rootView];
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HotelCell"];
  
//  self.hotels = @[@"Hotel1", @"Hotel2", @"Hotel3"];
  
  AppDelegate* appDelegate = [AppDelegate sharedAppDelegate];
  
  NSManagedObjectContext* context = appDelegate.managedObjectContext;
  
  NSError *fetchError;
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  self.hotels = [context executeFetchRequest:fetchRequest error:&fetchError];
  if (fetchError) {
    NSLog(@"%@", fetchError.localizedDescription);
  }
  
  
  [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return  self.hotels.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelCell" forIndexPath:indexPath];
  Hotel *hotel = [self.hotels objectAtIndex:indexPath.row];
  cell.textLabel.text = hotel.name;
  return cell;
}

#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  [self.tableView deselectRowAtIndexPath:indexPath animated:true];
 
  RoomViewController *roomViewController = [[RoomViewController alloc] init];
  roomViewController.hotel = self.hotels[indexPath.row];
  [self.navigationController pushViewController:roomViewController animated:true];
  NSLog(@"Browse Hotel Selected");

}






@end
