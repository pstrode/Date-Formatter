//
//  DateFormatter.m
//  Jango
//
//  Created by Parker Strode on 3/7/12.
//  Copyright (c) 2012 Green Grass Studios. All rights reserved.
//

#import "DateFormat.h"
#import "StringAdjuster.h"

@implementation DateFormat


// Output -> 'Mon, Jan 16, 2012'
+ (NSString *)todaysDate
{
    // Date formatter
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE MMM d Y"];    
    
    NSDate *now = [[NSDate alloc] init];
    
    return [dateFormat stringFromDate:now];
}


// Output -> '1330625358.46'
+ (NSString *)currentUnixTime
{
    // Unix time... 
    NSString *timestamp = [NSString stringWithFormat:@"%0.2f", [[NSDate date] timeIntervalSince1970]];
    
    NSLog(@"\nPost Time: |%@| \n",timestamp); 
    
    return [NSString stringWithFormat:@"%@",timestamp];
}

// Input -> '1334954140.42' Output -> 'Fri Apr 20 2012'
+ (NSString *)unixTimeToPrettyDate:(NSString *)unixDateFormat
{
    NSTimeInterval seconds = [unixDateFormat doubleValue];
    NSDate *epochNSDate = [[NSDate alloc] initWithTimeIntervalSince1970:seconds];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE MMM d Y"];    
    
    NSString *date = [dateFormat stringFromDate:epochNSDate];
    
    NSString *outputDate = [StringAdjuster replaceSpacesFor:date replaceSpaceWith:@"%20"];
    
    return [NSString stringWithFormat:@"%@",outputDate];
}

// Output ->  Wednesday, March 7, 2012 at 11:24 PM
+ (NSString *)prettyDate
{
    //Date formattter
    NSDate *today = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE, MMMM d, Y"];
    
    NSString *dateString = [dateFormat stringFromDate:today];
    
    //Time formatter
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"h:m a"];
    
    NSString *timeString = [timeFormat stringFromDate:today];
        
    return [NSString stringWithFormat:@"%@ at %@", dateString, timeString];
}

@end


