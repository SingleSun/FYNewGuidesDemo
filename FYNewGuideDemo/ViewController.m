//
//  ViewController.m
//  FYNewGuideDemo
//
//  Created by 樊杨 on 2018/10/12.
//  Copyright © 2018年 樊杨. All rights reserved.
//

#import "ViewController.h"
#import "NewGuideView/FYNewGuidesView.h"

@interface ViewController ()<FYNewGuidesViewDelegate>

@property(nonatomic,strong)UILabel * acountlabel;

@property(nonatomic,strong) FYNewGuidesView * guideview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"新手引导";
    
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithTitle:@"全部" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonClick)];
    self.navigationItem.rightBarButtonItem = right;
    
    
    [self createNewGuides];
}

-(void)createNewGuides{
    FYNewGuidesView * view = [[FYNewGuidesView alloc]init];
    view.guideImageStr = @"guides_01";
    [view createGuidesMask:CGPointMake(kScreenWidth-34, 44) withRaduis:25 withText:@"点击查看全部信息" withButtonText:@"下一步"];
    view.delegate = self;
    _guideview = view;
    [view showGuidesView];
}

#pragma mark 实现代理
-(void)newGuidesButtonClick:(FYNewGuidesView *)view{
    [view removeAllSubviews];
    [view removeFromSuperview];
    FYNewGuidesView * view1 = [[FYNewGuidesView alloc]init];
    view1.guideImageStr = @"guides_01";
    [view1 createGuidesMask:CGPointMake(kScreenWidth-54, 44) withRaduis:25 withText:@"查看新的账户" withButtonText:@"知道了"];
    view1.delegate = self;
    _guideview = view1;
    [view1 showGuidesView];
}




-(void)rightBarButtonClick{
    
}



@end
