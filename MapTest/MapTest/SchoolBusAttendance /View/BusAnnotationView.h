//
//  BusAnnotationView.h
//  MapTest
//
//  Created by hushuangfei on 16/10/31.
//  Copyright © 2016年 胡双飞. All rights reserved.
//  绘制点显示

#import <MAMapKit/MAMapKit.h>
@class BusLocationModel;
@interface BusAnnotationView : MAAnnotationView

/**
 标记图片
 */
@property (nonatomic, strong) UIImage *portrait;

/**
 调出来显示的View
 */
@property (nonatomic, strong) UIView *calloutView;

/**
 汽车定位信息Model
 */
@property(nonatomic,strong)BusLocationModel *busLocationModel;


@end
