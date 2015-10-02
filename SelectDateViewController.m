//
//  SelectDateViewController.m
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright © 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import "SelectDateViewController.h"
#import "ReservationViewController.h"


@interface SelectDateViewController ()
@property(strong, nonatomic)UIDatePicker *startDate;
@property(strong, nonatomic)UIDatePicker *endDate;
@property(strong, nonatomic)UILabel *startDateLabel;
@property(strong, nonatomic)UILabel *endDateLabel;
@property(strong, nonatomic)NSDateFormatter *dateFormatter;
@end

@implementation SelectDateViewController

- (void)loadView{
  UIView *rootView = [[UIView alloc] init];
  
  // instantiate start date picker
  self.startDate = [[UIDatePicker alloc] init];
  self.startDate.datePickerMode = UIDatePickerModeDate;
  [self.startDate setTranslatesAutoresizingMaskIntoConstraints:false];
  rootView.backgroundColor = [UIColor whiteColor];
  [rootView addSubview: self.startDate];
  
  // add start label
  self.startDateLabel = [[UILabel alloc] init];
  self.startDateLabel.textColor = [UIColor redColor];
  [self.startDateLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  self.startDateLabel.text = @"Check In Date";
  [rootView addSubview: self.startDateLabel];
  
  // instantiate end date picker
  self.endDate = [[UIDatePicker alloc] init];
  self.endDate.datePickerMode = UIDatePickerModeDate;
  [self.endDate setTranslatesAutoresizingMaskIntoConstraints:false];
  rootView.backgroundColor = [UIColor whiteColor];
  [rootView addSubview: self.endDate];
  
  // end date label
  self.endDateLabel = [[UILabel alloc] init];
  self.endDateLabel.textColor = [UIColor redColor];
  [self.endDateLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  self.endDateLabel.text = @"Check Out Date";
  [rootView addSubview: self.endDateLabel];
  
  NSDictionary *views = @{@"startDate" : self.startDate,@"endDate" :  self.endDate, @"startDateLabel" : self.startDateLabel, @"endDateLabel" : self.endDateLabel};
  
  //Start Date Label Constraints
  NSArray *startDateLabelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[startDateLabel]" options:0 metrics:nil views:views];
  [rootView addConstraints:startDateLabelHorizontalConstraints];
  NSArray *startDateLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[startDateLabel]" options:0 metrics:nil views:views];
  [rootView addConstraints:startDateLabelVerticalConstraints];
  
  //Start Date Picker Constraints
  NSArray *startDatePickerHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[startDate]|" options:0 metrics:nil views:views];
  [rootView addConstraints:startDatePickerHorizontalConstraints];
  NSArray *startDatePickerVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[startDateLabel][startDate]" options:0 metrics:nil views:views];
  [rootView addConstraints:startDatePickerVerticalConstraints];
  
  //End Date Label Constraints
  NSArray *endDateLabelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[endDateLabel]|" options:0 metrics:nil views:views];
  [rootView addConstraints:endDateLabelHorizontalConstraints];
  NSArray *endDateLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[startDate][endDateLabel]" options:0 metrics:nil views:views];
  [rootView addConstraints:endDateLabelVerticalConstraints];
  
  //End Date Picker Constraints
  NSArray *endDatePickerHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[endDate]|" options:0 metrics:nil views:views];
  [rootView addConstraints:endDatePickerHorizontalConstraints];
  NSArray *endDatePickerVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[endDateLabel][endDate]" options:0 metrics:nil views:views];
  [rootView addConstraints:endDatePickerVerticalConstraints];
  
  // Alloc and initialize button
  UIButton *nextButton = [[UIButton alloc] init];
  
  // Trigger button when pressed, set action
  [nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  //Button setup
  [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [nextButton setTitle:@"Next" forState:UIControlStateNormal];
  [nextButton setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:nextButton];
  
  NSLayoutConstraint *nextButtonCenterX = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  nextButtonCenterX.active = true;
  
  NSLayoutConstraint *nextButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-8];
  nextButtonBottomConstraint.active = true;
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)nextButtonPressed:(UIButton *)sender {
  ReservationViewController *reservationViewController = [[ReservationViewController alloc] init];
  reservationViewController.startDate = self.startDate.date;
  reservationViewController.endDate = self.endDate.date;
  [self.navigationController pushViewController:reservationViewController animated:true];
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
