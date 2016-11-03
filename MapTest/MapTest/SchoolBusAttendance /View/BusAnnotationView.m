//
//  BusAnnotationView.m
//  MapTest
//
//  Created by hushuangfei on 16/10/31.
//  Copyright © 2016年 胡双飞. All rights reserved.
//

#import "BusAnnotationView.h"
#import "BusCalloutView.h"
#import "BusLocationModel.h"
//#import "UIApplication.h"
#define kWidth  30.f
#define kHeight 30.f

#define kHoriMargin 5.f
#define kVertMargin 5.f

#define kPortraitWidth  50.f
#define kPortraitHeight 50.f

#define kCalloutWidth   200.0
#define kCalloutHeight  100.0

@interface BusAnnotationView ()

/**
 图片
 */
@property (nonatomic, strong) UIImageView *portraitImageView;

///**
// 标记名
// */
//@property (nonatomic, strong) UILabel *nameLabel;

/**
 标题名
 */
@property(nonatomic,strong)NSArray *titleArray;

/**
 内容名
 */
@property(nonatomic,strong)NSMutableArray *contentArrayM;
@end

@implementation BusAnnotationView


#pragma mark - Handle Action
-(void)callTelephone{
    if ([self canCall]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.busLocationModel.teacherPhone]];
    }
  
}

-(BOOL)canCall{
    NSString *callString = [NSString stringWithFormat:@"telprompt://%@",self.busLocationModel.teacherPhone];
   return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:callString]];
}

#pragma mark - Override getter和setter

//- (NSString *)name
//{
//    return self.nameLabel.text;
//}
//
//- (void)setName:(NSString *)name
//{
//    self.nameLabel.text = name;
//}
-(NSMutableArray *)contentArrayM{
    if (!_contentArrayM) {
        _contentArrayM = [NSMutableArray array];
    }
    return _contentArrayM;
}

-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"车牌号:",@"随车老师:",@"老师电话:",@"上次更新:"];
    }
    return _titleArray;
}

- (UIImage *)portrait
{
    return self.portraitImageView.image;
}

- (void)setPortrait:(UIImage *)portrait
{
    self.portraitImageView.image = portrait;
}

-(void)setBusLocationModel:(BusLocationModel *)busLocationModel{
    _busLocationModel = busLocationModel;
    
    //增加内容
    [self.contentArrayM addObject:busLocationModel.busName.length > 0 ? busLocationModel.busName : @""];
    [_contentArrayM addObject:busLocationModel.teacherName.length > 0 ? busLocationModel.teacherName : @""];
    [_contentArrayM addObject:busLocationModel.teacherPhone.length > 0 ? busLocationModel.teacherPhone : @""];
    [_contentArrayM addObject:busLocationModel.lastUpdateTime.lastPathComponent > 0 ? busLocationModel.lastUpdateTime : @""];
    
}

- (void)setSelected:(BOOL)selected
{
    [self setSelected:selected animated:NO];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        if (self.calloutView == nil)
        {
            /* 自定义BusCalloutView */
            self.calloutView = [[BusCalloutView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                  -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
            
           
            [self setupSubCalloutView:self.calloutView];
        }
        
        [self addSubview:self.calloutView];
    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL inside = [super pointInside:point withEvent:event];

    if (!inside && self.selected)
    {
        inside = [self.calloutView pointInside:[self convertPoint:point toView:self.calloutView] withEvent:event];
    }
    
    return inside;
}

-(void)setupSubCalloutView:(UIView *)callOutView{
    CGFloat leftWidth = 80;
    CGFloat rightWidth = callOutView.bounds.size.width - leftWidth;
    CGFloat rightX = 5 + leftWidth;
  
    if (self.titleArray.count > 0) {
     //标题
        for (NSInteger i = 0; i < self.titleArray.count; i++) {
            
             CGRect labelRect = CGRectMake(0, i * 24, leftWidth, 24);
           UILabel *titleLabel =   [self lableframe:labelRect title:self.titleArray[i] titleColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentRight];
            [callOutView addSubview:titleLabel];
        }
    }
    
   
    if (self.contentArrayM.count > 0) {
        //内容
        for (NSInteger i = 0; i < self.contentArrayM.count; i++) {
            
            CGRect labelRect = CGRectMake(rightX, i * 24, rightWidth, 24);
            if (i == 2) {
                if ([self isNumText:self.contentArrayM[i]]) {
                    UIButton *btn = [self btnframe:labelRect title:self.contentArrayM[i] titleColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft];
                    [callOutView addSubview:btn];
                }
                
            }else{
            UILabel *contentLabel =   [self lableframe:labelRect title:self.contentArrayM[i] titleColor:[UIColor lightGrayColor] textAlignment:NSTextAlignmentLeft];
                [callOutView addSubview:contentLabel];
            }
        }
    }
    
    
    
}
//创建label
-(UILabel *)lableframe:(CGRect)frame
                 title:(NSString *)titleText
            titleColor:(UIColor *)titleColor
         textAlignment:(NSTextAlignment)textAlignment
{
        UIFont *font = [UIFont systemFontOfSize:14];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)];
        titleLabel.textAlignment = textAlignment;
        titleLabel.text = titleText;
        titleLabel.font = font;
        titleLabel.textColor = titleColor;
  
    return titleLabel;
}
//创建btn
-(UIButton *)btnframe:(CGRect)frame
                title:(NSString *)titleText
           titleColor:(UIColor *)titleColor
        textAlignment:(NSTextAlignment)textAlignment
{
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = frame;
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [btn setAttributedTitle:[self btnTitle:titleText] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(callTelephone) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

//设置下划线
- (NSMutableAttributedString *)btnTitle:(NSString *)btntitle{
    NSMutableAttributedString *btntitleA = [[NSMutableAttributedString alloc]initWithString:btntitle];
    //按钮文本大小
    [btntitleA addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, btntitleA.length)];
    //按钮文本颜色
    [btntitleA addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, btntitleA.length)];
    //按钮文本下划线
    [btntitleA addAttribute:NSUnderlineStyleAttributeName value:
     [NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, btntitleA.length)]; // 下划线类型
    //按钮下划线颜色
    [btntitleA addAttribute:NSUnderlineColorAttributeName value:
     [UIColor blueColor] range:NSMakeRange(0, btntitleA.length)];
    
    return btntitleA;
}


/**
 判断是否是纯数字

 @param str 字符串

 @return YES -> 是纯数字  NO ->不是纯数字
 */
- (BOOL)isNumText:(NSString *)str{
    NSString * regex        = @"[0-9]*";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch            = [pred evaluateWithObject:str];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark - Life Cycle

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.bounds = CGRectMake(0.f, 0.f, kWidth, kHeight);

        CGFloat imageViewX = (kWidth - kPortraitWidth) * 0.5;
        CGFloat imageViewY = (kHeight - kPortraitHeight) * 0.5;
        self.portraitImageView = [[UIImageView alloc] initWithFrame:CGRectMake( imageViewX,imageViewY, kPortraitWidth, kPortraitHeight)];
        [self addSubview:self.portraitImageView];
        
    }
    
    return self;
}


@end
