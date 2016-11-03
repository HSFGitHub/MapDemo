//
//  BusLocationModel.h
//  MapTest
//
//  Created by hushuangfei on 16/11/1.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface BusLocationModel : NSObject

/**
 校车名称
 */
@property(nonatomic,copy)NSString *busName;

/**
 司机名称
 */
@property(nonatomic,copy)NSString *driverName;
/**
 老师名字
 */
@property(nonatomic,copy)NSString *teacherName;

/**
 老师电话
 */
@property(nonatomic,copy)NSString *teacherPhone;


/**
 上次更新时间
 */
@property(nonatomic,copy)NSString *lastUpdateTime;

/**
 校车位置（经纬度，格式：经度,维度)
 */
@property(nonatomic,copy)NSString *busLocation;

/**
 经纬度(app使用)
 */
@property(nonatomic,assign)CLLocationCoordinate2D coordinate2D;


@end
