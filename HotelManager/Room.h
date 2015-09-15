//
//  Room.h
//  HotelManager
//
//  Created by MICK SOUMPHONPHAKDY on 9/7/15.
//  Copyright (c) 2015 MICK SOUMPHONPHAKDY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hotel;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) Hotel *hotel;

@end
