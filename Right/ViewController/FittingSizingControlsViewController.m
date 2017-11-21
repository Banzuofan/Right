//
//  FittingSizingControlsViewController.m
//  Right
//
//  Created by YXLONG on 2017/11/21.
//  Copyright © 2017年 Right. All rights reserved.
//

#import "FittingSizingControlsViewController.h"
#import "LabelLabelView.h"
#import "Masonry.h"
#import "UIColor+JKRandom.h"

#define fsc_WrapContentEnable

@interface FittingSizingControlsViewController ()
{
    LabelLabelView *lableView;
}
@end

@implementation FittingSizingControlsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    lableView = [[LabelLabelView alloc] initWithFrame:CGRectZero];
    lableView.backgroundColor = [[UIColor jk_randomColor] colorWithAlphaComponent:0.5];
    lableView.rearlabel.textColor = [UIColor redColor];
    lableView.frontlabel.textColor = [UIColor blueColor];
    lableView.frontlabel.text = @"Do any additional";
    lableView.rearlabel.text = @"additional";
    lableView.frontlabel.font = [UIFont systemFontOfSize:15];
    lableView.rearlabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:lableView];
    
    
#ifndef fsc_WrapContentEnable
    [lableView  setContentHuggingPriority:250 forAxis:0];
    [lableView  setContentHuggingPriority:250 forAxis:1];
    [lableView setContentCompressionResistancePriority:750 forAxis:0];
    [lableView setContentCompressionResistancePriority:750 forAxis:1];
#else
    [lableView  setContentHuggingPriority:750 forAxis:0];
    [lableView  setContentHuggingPriority:750 forAxis:1];
    [lableView setContentCompressionResistancePriority:250 forAxis:0];
    [lableView setContentCompressionResistancePriority:250 forAxis:1];
#endif
    
    [lableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
//        make.top.equalTo(self.view).with.offset(15);
//        make.centerX.equalTo(self.view);
        make.left.greaterThanOrEqualTo(self.view).with.offset(5);
        make.right.lessThanOrEqualTo(self.view).with.offset(-5);
    }];
    
    
    ///a
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        lableView.rearlabel.text = @"additional setup after";
        
        ///b
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            lableView.frontlabel.font = [UIFont boldSystemFontOfSize:18];
            lableView.frontlabel.text = @"Do";
            
            ///c
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                lableView.frontlabel.text = @"Do any additional";
                lableView.rearlabel.text = @"additional";
                
                ///d
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    lableView.frontlabel.font = [UIFont systemFontOfSize:12];
                    lableView.rearlabel.font = [UIFont boldSystemFontOfSize:30];
                    
                    ///e
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        lableView.rearlabel.text = @"Do";
                        lableView.rearlabel.font = [UIFont boldSystemFontOfSize:60];

                        ///f
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            lableView.frontlabel.font = [UIFont systemFontOfSize:15];
                            lableView.rearlabel.font = [UIFont boldSystemFontOfSize:10];
                            lableView.rearlabel.text = @"Dispose of any resources that can be recreated.";
                        });
                    });
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
