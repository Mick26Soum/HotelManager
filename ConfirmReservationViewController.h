//
//  ConfirmReservationViewController.h
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright © 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room.h"

@interface ConfirmReservationViewController : UIViewController

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) Room *selectedRoom;

@end
