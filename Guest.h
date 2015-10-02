//
//  Guest.h
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/12/15.
//  Copyright © 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservation;

@interface Guest : NSManagedObject

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) Reservation *reservation;

@end

