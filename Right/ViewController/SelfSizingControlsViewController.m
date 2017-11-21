//
//  SelfSizingControlsViewController.m
//  Right
//
//  Created by YXLONG on 2017/11/21.
//  Copyright © 2017年 Right. All rights reserved.
//

#import "SelfSizingControlsViewController.h"
#import "InsetsLabelView.h"
#import "Masonry.h"

#define WrapContentEnable

@interface SelfSizingControlsViewController ()

@end

@implementation SelfSizingControlsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    InsetsLabelView *labelView = [[InsetsLabelView alloc] initWithFrame:CGRectZero];
    labelView.backgroundColor = [UIColor cyanColor];
    labelView.text = @"SelfSizingControls";
    labelView.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:labelView];
#ifndef WrapContentEnable
    [labelView setContentCompressionResistancePriority:751 forAxis:0];
    [labelView setContentCompressionResistancePriority:751 forAxis:1];
    [labelView setContentHuggingPriority:250 forAxis:0];
    [labelView setContentHuggingPriority:250 forAxis:1];
#else
    [labelView setContentCompressionResistancePriority:250 forAxis:0];
    [labelView setContentCompressionResistancePriority:250 forAxis:1];
    [labelView setContentHuggingPriority:750 forAxis:0];
    [labelView setContentHuggingPriority:750 forAxis:1];
#endif
    
    [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
#ifndef WrapContentEnable
        make.left.equalTo(self.view).with.offset(80);
        make.right.equalTo(self.view).with.offset(-80);
        make.height.mas_equalTo(120);
#endif
    }];
    
    CGFloat disptime = 1.5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(disptime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        labelView.font = [UIFont boldSystemFontOfSize:19.0];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(disptime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            labelView.contentInsets = UIEdgeInsetsMake(20, 15, 10, 15);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(disptime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                labelView.contentInsets = UIEdgeInsetsMake(5, 5, 5, 5);
                labelView.preferredMaxLayoutWidth = 250;
                labelView.text = @"In a storyboard-based application, you will often want to do a little preparation before navigation";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(disptime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    labelView.preferredMaxLayoutWidth = 240;
                    labelView.contentInsets = UIEdgeInsetsMake(15, 15, 15, 15);
                });
            });
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
