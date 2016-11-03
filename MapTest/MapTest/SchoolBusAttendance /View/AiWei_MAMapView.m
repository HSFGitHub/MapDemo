//
//  AiWei_MAMapView.m
//  MapTest
//
//  Created by hushuangfei on 16/11/2.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import "AiWei_MAMapView.h"
static AiWei_MAMapView *aiWei_MAMapView;
@implementation AiWei_MAMapView

+ (AiWei_MAMapView *)shareAiWei_MAMapView{
    if (aiWei_MAMapView == nil) {
        aiWei_MAMapView = [[AiWei_MAMapView alloc] init];
        
    }
    return aiWei_MAMapView;
}

@end
