//
//  BusLocationModel.m
//  MapTest
//
//  Created by hushuangfei on 16/11/1.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import "BusLocationModel.h"

@implementation BusLocationModel


-(void)setBusLocation:(NSString *)busLocation{
    _busLocation = busLocation;
    if ([busLocation containsString:@","]) {
        NSArray *locaionArray = [busLocation componentsSeparatedByString:@","];
        NSString *latitudeString = [locaionArray firstObject];
        NSString *longitudeString = [locaionArray lastObject];
        
        if ([latitudeString doubleValue] && [longitudeString doubleValue]) {
            _coordinate2D.latitude = [latitudeString doubleValue];
            _coordinate2D.longitude = [longitudeString doubleValue];
        }
    }
}

@end
