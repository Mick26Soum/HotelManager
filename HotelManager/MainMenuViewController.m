//
//  MainMenuViewController.m
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright (c) 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) UITableView *tableView;

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
  
  // Create a UITableView Controller and add it to the subview
  //
  self.view = self.tableView;
  [self.tableView addSubview:rootView];
  
  //instantiate button here to push the hotel list controller
  //via UIButton Action
  // inside each IBAction, allocate and initialize the second view controller
  
//  - (void)viewDidLoad
//  {
//  [super viewDidLoad];
//  UIButton* testButn = [UIButton buttonWithType:UIButtonTypeCustom];
//  [testButn setFrame:CGRectMake(0, 135, 40, 38)];
//  [testButn setImage:[UIImage imageNamed:@"New_PICT0019.jpg"] forState:UIControlStateNormal];
//  [testButn setImage:[UIImage imageNamed:@"New_PICT0002.jpg"]   forState:UIControlStateSelected];
//  [testButn addTarget:self action:@selector(stayPressed:) forControlEvents:UIControlEventTouchDown];
//  [self.view addSubview:testButn];
//  }
//  
//  -(void)stayPressed:(UIButton *) sender {
//    if (sender.selected == YES) {
//      sender.selected = NO;
//    }else{
//      sender.selected = YES;
//    }
//  }
  
  }

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MainMenuCell"];
  
    // Do any additional setup after loading the view.
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MainMenuTableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return  4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainMenuCell" forIndexPath:indexPath];

  return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
