//
//  FYNewGuidesView.h
//  FYNewGuideDemo
//
//  Created by 樊杨 on 2018/10/22.
//  Copyright © 2018年 樊杨. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FYNewGuidesView;

typedef enum : NSUInteger {
    GuidesButtonCircle,
    GuidesButtonRangle,
} GuidesButtonType;

@protocol FYNewGuidesViewDelegate <NSObject>

-(void)newGuidesButtonClick:(FYNewGuidesView *)view;

@end

@interface FYNewGuidesView : UIView

//圆形蒙版半径
@property(nonatomic,assign)CGFloat radius;

//引导文字
@property(nonatomic,copy)NSString * guidesText;

//按钮文字
@property(nonatomic,copy)NSString * buttonText;

//本地图片
@property(nonatomic,copy)NSString * guideImageStr;

@property(nonatomic,weak)id<FYNewGuidesViewDelegate> delegate;

-(void)createGuidesMask:(CGPoint)centerPoint withRaduis:(CGFloat)raduis withText:(NSString *)text withButtonText:(NSString *)buttonStr;

-(void)showGuidesView;

-(void)removeAllSubviews;

@end

NS_ASSUME_NONNULL_END
