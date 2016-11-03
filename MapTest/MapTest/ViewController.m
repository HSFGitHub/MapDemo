//
//  ViewController.m
//  MapTest
//
//  Created by hushuangfei on 16/10/31.
//  Copyright © 2016年 胡双飞. All rights reserved.
//
#import "BusLocationModel.h"
#import "ViewController.h"
#import "BusAnnotationView.h"
#import "AiWei_MAPointAnnotation.h"
#import "AiWei_MaMapViewController.h"
@interface ViewController ()
//存放多个标记点
@property (nonatomic, strong) NSMutableArray *annotations;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}
//模拟轮训时移动坐标
- (IBAction)MovingAcion:(id)sender {
    
    [self.navigationController pushViewController:[[AiWei_MaMapViewController alloc]init] animated:YES];

}
//#pragma mark - 增加多个annotation
////模拟网络加载初始化
//- (void)initAnnotations
//{
//    self.annotations = [NSMutableArray array];
//    
//    NSArray *coordinates = @[@"39.992520, 116.336170",@"39.992520, 116.336170",@"39.998293, 116.352343",@"40.004087, 116.348904",@"40.001442, 116.353915",@"40.001442, 116.353915",@"39.989105, 116.353915",@"39.998439, 116.360201",@"39.979590, 116.324219",@"39.978234, 116.352792"];
//    
//    NSMutableArray *tempArray = [NSMutableArray array];
//    
//    for (int i = 0; i < 10; ++i){
//        BusLocationModel *model = [[BusLocationModel  alloc] init];
//        model.busLocation = coordinates[i];
//        model.busName = [NSString stringWithFormat:@"鲁A:lulu--%d",i];
//        model.teacherName = [NSString stringWithFormat:@"老师%d",i];
//        model.teacherPhone = [NSString stringWithFormat:@"%d",i];
//        model.lastUpdateTime = [NSString stringWithFormat:@"2016-01-10 15:30"];
//        [tempArray addObject:model];
//    }
//    
//    for (int i = 0; i < tempArray.count; ++i)
//    {
//        AiWei_MAPointAnnotation *a1 = [[AiWei_MAPointAnnotation alloc] init];
//        BusLocationModel *model = tempArray[i];
//        a1.locationModel = model;
//        [self.annotations addObject:a1];
//    }
//}

//
//#pragma mark - MAMapViewDelegate
////自定义大头针
//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[AiWei_MAPointAnnotation class]])
//    {
//        static NSString *customReuseIndetifier = @"customReuseIndetifier";
//        
//        BusAnnotationView *annotationView = (BusAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:customReuseIndetifier];
//        
//        if (annotationView == nil)
//        {
//            annotationView = [[BusAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:customReuseIndetifier];
//            //设置是否可以显示callout
//            annotationView.canShowCallout = NO;
//            //是否支持拖动
//            annotationView.draggable = YES;
//            //自定弹出提示View，偏移位置
//            annotationView.calloutOffset = CGPointMake(0, -10);
//        }
//        //统一设置汽车图标
//        annotationView.portrait = [UIImage imageNamed:@"icon_taxi"];
//        annotationView.busLocationModel =[(AiWei_MAPointAnnotation *)annotation locationModel];
//        return annotationView;
//    }
//    
//    return nil;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
