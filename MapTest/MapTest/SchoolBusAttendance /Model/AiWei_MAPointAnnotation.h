//
//  AiWei_MAPointAnnotation.h
//  MapTest
//
//  Created by hushuangfei on 16/11/2.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "BusLocationModel.h"
@interface AiWei_MAPointAnnotation : MAPointAnnotation
@property(nonatomic,strong)BusLocationModel *locationModel;
@end
