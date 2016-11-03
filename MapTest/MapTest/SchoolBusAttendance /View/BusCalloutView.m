//
//  BusCalloutView.m
//  MapTest
//
//  Created by hushuangfei on 16/10/31.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import "BusCalloutView.h"
#import <QuartzCore/QuartzCore.h>
@implementation BusCalloutView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

#pragma mark - draw rect
-(void)drawRect:(CGRect)rect{
    
    [self drawInContext:UIGraphicsGetCurrentContext()];

    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 1.0;
    self.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    
}

- (void)drawInContext:(CGContextRef)context
{
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8].CGColor);
    [self getDrawPath:context];
    CGContextFillPath(context);
    
}

- (void)getDrawPath:(CGContextRef)context
{
    
    if (_kArrorHeight <= 0) {
        _kArrorHeight = 5;
    }
    
    CGRect rrect = self.bounds;
    CGFloat radius = 6.0;
    CGFloat minx = CGRectGetMinX(rrect),
    midx = CGRectGetMidX(rrect),
    maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect),
    maxy = CGRectGetMaxY(rrect)-_kArrorHeight;
    
    CGContextMoveToPoint(context, midx+_kArrorHeight, maxy);
    CGContextAddLineToPoint(context,midx, maxy+_kArrorHeight);
    CGContextAddLineToPoint(context,midx-_kArrorHeight, maxy);
    
    CGContextAddArcToPoint(context, minx, maxy, minx, miny, radius);
    CGContextAddArcToPoint(context, minx, minx, maxx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, maxx, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextClosePath(context);
}


@end
