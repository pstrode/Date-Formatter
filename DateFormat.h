//
//  DateFormatter.h
//  Jango
//
//  Created by Parker Strode on 3/7/12.
//  Copyright (c) 2012 Green Grass Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DateFormat;

@interface DateFormat : NSObject

+ (NSString *)todaysDate;
+ (NSString *)currentUnixTime;
+ (NSString *)unixTimeToPrettyDate:(NSString *)unixDateFormat;
+ (NSString *)prettyDate;

@end
