//
//  AiWei_MAPointAnnotation.m
//  MapTest
//
//  Created by hushuangfei on 16/11/2.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import "AiWei_MAPointAnnotation.h"

@implementation AiWei_MAPointAnnotation

-(void)setLocationModel:(BusLocationModel *)locationModel{
    _locationModel = locationModel;
    self.coordinate = locationModel.coordinate2D;
}

@end
