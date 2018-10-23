//
//  FYNewGuidesView.m
//  FYNewGuideDemo
//
//  Created by 樊杨 on 2018/10/22.
//  Copyright © 2018年 樊杨. All rights reserved.
//

#import "FYNewGuidesView.h"

@interface FYNewGuidesView()

@property(nonatomic,strong)UIButton * sureButton;

@property(nonatomic,strong)UILabel * guideLabel;

@property(nonatomic,strong)UIImageView * guidesImageView;

@property(nonatomic,strong)CAShapeLayer * guidelayer;


@end

@implementation FYNewGuidesView


- (UIButton *)sureButton{
    
    if (_sureButton == nil) {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.layer.cornerRadius = 5.0;
        _sureButton.layer.masksToBounds = YES;
        _sureButton.layer.borderWidth = 2;
        _sureButton.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _sureButton;
}

-(UILabel *)guideLabel{
    if (_guideLabel == nil) {
        _guideLabel = [[UILabel alloc]init];
        _guideLabel.numberOfLines = 0;
        _guideLabel.textColor = [UIColor whiteColor];
        _guideLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _guideLabel;
}

-(CAShapeLayer *)guidelayer{
    if (_guidelayer == nil) {
        _guidelayer = [CAShapeLayer layer];
    }
    return _guidelayer;
}

-(UIImageView *)guidesImageView{
    if (_guidesImageView == nil) {
        _guidesImageView = [[UIImageView alloc]init];
    }
    return _guidesImageView;
}

#pragma mark 初始化背景图层
-(instancetype)init{
    if (self = [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return self;
}

#pragma mark 创建圆形蒙版
-(void)createGuidesMask:(CGPoint)centerPoint withRaduis:(CGFloat)raduis withText:(NSString *)text withButtonText:(NSString *)buttonStr{
    
    //在背景图层上绘制蒙版路径
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    //添加一个圆形路径
    [path appendPath: [UIBezierPath bezierPathWithArcCenter:centerPoint radius:raduis startAngle:0 endAngle:2*M_PI clockwise:NO]];
    self.guidelayer.path = path.CGPath;

    //添加箭头图片
    CGSize imageSize = [UIImage imageNamed:self.guideImageStr].size;
    self.guidesImageView.frame = CGRectMake(kScreenWidth-imageSize.width-10, centerPoint.y+raduis, imageSize.width, imageSize.height);
    self.guidesImageView.image = [UIImage imageNamed:self.guideImageStr];
    
    self.guideLabel.frame = CGRectMake(10, CGRectGetMaxY(self.guidesImageView.frame)+10, kScreenWidth-20, 50);
    self.guideLabel.text = text;
    
    self.sureButton.frame = CGRectMake(kScreenWidth/2.0-40, CGRectGetMaxY(self.guideLabel.frame)+10, 80, 40);
    [self.sureButton setTitle:buttonStr forState:UIControlStateNormal];
    [self.sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)showGuidesView{
    [self.layer setMask:_guidelayer];
   
    //设置蒙版
    [self addSubview:_guidesImageView];
    [self addSubview:_guideLabel];
    [self addSubview:_sureButton];
    
    //将背景图层加到window上
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

#pragma mark 按钮点击操作
-(void)sureButtonClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(newGuidesButtonClick:)]) {
        [self.delegate newGuidesButtonClick:self];
    }
}

#pragma mark 移除所有子视图
-(void)removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
