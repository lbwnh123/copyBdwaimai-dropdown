//
//  MyHeaderView.m
//  learnTableviewHeader
//
//  Created by bowen.liu on 15/12/23.
//  Copyright © 2015年 easyDevice. All rights reserved.
//

#import "BWHeaderView.h"
#import "BWLable.h"

@interface BWHeaderView()
{
    BOOL flagDown ;
    
    int countTotation;
}

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) UIImageView * chaziView;

@property (nonatomic,strong) UIImageView * scrollView;

@property (nonatomic,strong) UILabel * scrollLable;


@end

@implementation BWHeaderView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        flagDown = 0 ;
        countTotation = 0 ;
        
        self.backgroundColor = [UIColor whiteColor];
        self.shapeLayer = [CAShapeLayer layer];
        self.shapeLayer.frame = self.bounds;
        [self.layer addSublayer:self.shapeLayer];
        
        self.chaziView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pull_fork"]];
        [self.chaziView sizeToFit];
        [self addSubview:self.chaziView];
        
        self.scrollLable = [[BWLable alloc] init];
        self.scrollLable.text = @"百度外卖";
        [self addSubview:self.scrollLable];
        
        self.scrollView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pull_progress"]];
        self.scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 5);
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    if (self.tableReflash == YES && rect.size.height == 5) {
        
        self.shapeLayer.fillColor = COLOR(255, 10, 10, 1.0).CGColor;
        UIBezierPath* aPath = [UIBezierPath bezierPathWithRect:rect];
        self.shapeLayer.path  = aPath.CGPath;
        [self addSubview:self.scrollView];
        [self animationForScrollview];
        return;
        
    }
    
    [self removeProgressViewandAnimal];
    self.shapeLayer.frame = self.bounds;
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    UIColor * color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgicon"]];
    [color set];  //设置线条颜色
    aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
    [aPath moveToPoint:CGPointMake(0.0, 0.0)];
    [aPath addQuadCurveToPoint:CGPointMake(self.frame.size.width , 0) controlPoint:CGPointMake(self.frame.size.width* 0.5 , self.frame.size.height*2-5)];
    [aPath closePath];
    [aPath fill];
    self.shapeLayer.fillColor = COLOR(255, 10, 10, 0.8).CGColor;
     self.shapeLayer.path  = aPath.CGPath;
    
    /**
     *  上面是设置曲线和北京颜色 下面是旋转小叉子
     */
    self.chaziView.center = CGPointMake(SCREEN_WIDTH * 0.5, self.bounds.size.height - 30);
    
    if (rect.size.height > 80) {
        if (flagDown == 0) {
            [self turnChazi];
            flagDown = 1 ;
        }
    }else {
        if (flagDown == 1) {
            [self turnChazi];
            flagDown = 0 ;
        }
    }
    
    self.scrollLable.center =CGPointMake(SCREEN_WIDTH * 0.5, self.bounds.size.height - 70);
}


//旋转小叉子
- (void) turnChazi
{
    [UIView animateWithDuration:0.2 animations:^{
        self.chaziView.transform =  CGAffineTransformRotate(self.chaziView.transform, M_PI);
    }];
}

//进度条前进
- (void) animationForScrollview
{
    
    CABasicAnimation * baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    baseAnimation.fromValue = @(0);
    baseAnimation.toValue = @(SCREEN_WIDTH);
    baseAnimation.repeatCount = MAXFLOAT;
    baseAnimation.duration = 2.0;
    [self.scrollView.layer addAnimation:baseAnimation forKey:nil];
    
}

- (void) removeProgressViewandAnimal
{
    [self.scrollView.layer removeAllAnimations];
    [self.scrollView removeFromSuperview];
}



@end
