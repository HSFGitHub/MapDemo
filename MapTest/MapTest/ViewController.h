//
//  ViewController.h
//  MapTest
//
//  Created by hushuangfei on 16/10/31.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
@interface ViewController : UIViewController<MAMapViewDelegate,AMapSearchDelegate>

/**
 地图
 */
@property(nonatomic,strong)MAMapView *mapView;


@end

