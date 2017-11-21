//
//  LabelLabelViewController.m
//  Right
//
//  Created by YXLONG on 2017/10/26.
//  Copyright © 2017年 Right. All rights reserved.
//

#import "LabelLabelViewController.h"
#import "LabelLabelView.h"
#import "Masonry.h"
#import "OCLabelViews.h"
#import "UIImage+JKColor.h"
#import "UIImage+JKResize.h"
#import "UIColor+JKRandom.h"
#import "OCLabelViews.h"

#define OCLabelViews

@interface LabelLabelViewController ()
{
    LabelLabelView *lableView;
#ifndef OCLabelViews
    JDLabelImageView *labelImageView;
    JDImageLabelView *imageLabelView;
    JDVImageLabelView *vImageLabelView;
#else
    OCLabelImageView *labelImageView;
    OCImageLabelView *imageLabelView;
    OCVImageLabelView *vImageLabelView;
#endif
}
@end

@implementation LabelLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1];
    
    
    lableView = [[LabelLabelView alloc] initWithFrame:CGRectZero];
    lableView.backgroundColor = [[UIColor jk_randomColor] colorWithAlphaComponent:0.5];
    lableView.rearlabel.textColor = [UIColor redColor];
    lableView.frontlabel.textColor = [UIColor blueColor];
    lableView.frontlabel.text = @"Do any additional";
    lableView.rearlabel.text = @"additional";
    lableView.frontlabel.font = [UIFont systemFontOfSize:15];
    lableView.rearlabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:lableView];
    
    [lableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(15);
        make.centerX.equalTo(self.view);
        make.left.greaterThanOrEqualTo(self.view).with.offset(15);
        make.right.lessThanOrEqualTo(self.view).with.offset(-15);
    }];
    
#ifndef OCLabelViews
    labelImageView = [[JDLabelImageView alloc] initWithFrame:CGRectZero];
#else
    labelImageView = [[OCLabelImageView alloc] initWithFrame:CGRectZero];
#endif
    labelImageView.showMark = YES;
    labelImageView.titleLabel.text = @"JDLabelImageView";
    labelImageView.backgroundColor = [[UIColor jk_randomColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:labelImageView];
    
    [labelImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lableView.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.view);
        make.left.greaterThanOrEqualTo(self.view).with.offset(15).priority(999);
        make.right.lessThanOrEqualTo(self.view).with.offset(-2).priority(999);
    }];
    
#ifndef OCLabelViews
    imageLabelView = [[JDImageLabelView alloc] initWithFrame:CGRectZero];
#else
    imageLabelView = [[OCImageLabelView alloc] initWithFrame:CGRectZero];
#endif
    imageLabelView.showMark = YES;
    imageLabelView.titleLabel.text = @"JDImageLabelView";
    imageLabelView.backgroundColor = [[UIColor jk_randomColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:imageLabelView];
    
    [imageLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelImageView.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.view);
        make.left.greaterThanOrEqualTo(self.view).with.offset(15).priority(999);
        make.right.lessThanOrEqualTo(self.view).with.offset(-2).priority(999);
    }];
    
#ifndef OCLabelViews
    vImageLabelView = [[JDVImageLabelView alloc] initWithFrame:CGRectZero];
#else
    vImageLabelView = [[OCVImageLabelView alloc] initWithFrame:CGRectZero];
#endif
    vImageLabelView.showMark = YES;
    vImageLabelView.titleLabel.text = @"JDVImageLabelView";
    vImageLabelView.backgroundColor = [[UIColor jk_randomColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:vImageLabelView];
    
    vImageLabelView.preferredMaxLayoutWidth = 250;
    
    [vImageLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageLabelView.mas_bottom).with.offset(15);
        make.centerX.equalTo(self.view);
        make.left.greaterThanOrEqualTo(self.view).with.offset(15).priority(999);
        make.right.lessThanOrEqualTo(self.view).with.offset(-2).priority(999);
    }];
    
    
    ///a
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        lableView.rearlabel.text = @"additional setup after";
        
        UIImage *imgRed = [[UIImage jk_imageWithColor:[UIColor redColor]] jk_resizedImage:CGSizeMake(40, 16) interpolationQuality:kCGInterpolationMedium];
        
        UIImage *imgBlue = [[UIImage jk_imageWithColor:[UIColor blueColor]] jk_resizedImage:CGSizeMake(40, 16) interpolationQuality:kCGInterpolationMedium];
        
        UIImage *imgGreen = [[UIImage jk_imageWithColor:[UIColor greenColor]] jk_resizedImage:CGSizeMake(40, 40) interpolationQuality:kCGInterpolationMedium];
        
#ifndef OCLabelViews
        labelImageView.image = imgRed;
        imageLabelView.image = imgBlue;
        vImageLabelView.image = imgGreen;
#else
        labelImageView.mark = imgRed;
        imageLabelView.mark = imgBlue;
        vImageLabelView.mark = imgGreen;
#endif
        
        ///b
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            lableView.frontlabel.font = [UIFont boldSystemFontOfSize:18];
            lableView.frontlabel.text = @"Do";
            
            labelImageView.itemSpace = 15;
            
            imageLabelView.itemSpace = 20;
            
            vImageLabelView.itemSpace = 10;
            
            ///c
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                lableView.frontlabel.text = @"Do any additional";
                lableView.rearlabel.text = @"additional";
                
                vImageLabelView.titleLabel.text = @"Do any additional setup after loading the view.";
                
                labelImageView.titleLabel.font = [UIFont boldSystemFontOfSize:31];
                
                imageLabelView.titleLabel.font = [UIFont systemFontOfSize:27];
                
                ///d
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                    lableView.frontlabel.font = [UIFont systemFontOfSize:12];
                    lableView.rearlabel.font = [UIFont boldSystemFontOfSize:30];
                    
                    labelImageView.fixedImageSize = CGSizeMake(60, 60);
                    labelImageView.imageView.contentMode = UIViewContentModeScaleToFill;
                    
                    imageLabelView.fixedImageSize = CGSizeMake(40, 25);
                    
                    
                    vImageLabelView.titleLabel.text = @"Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.";
                    vImageLabelView.fixedImageSize = CGSizeMake(30, 30);
                    
                    ///e
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        labelImageView.titleLabel.text = @"Dispose of any resources that can be recreated.";
                        
                        imageLabelView.titleLabel.text = @"UIEdgeInsetsMake(25, 25, 25, 25)";
                        
                        lableView.rearlabel.font = [UIFont boldSystemFontOfSize:60];
                        
                        vImageLabelView.titleLabel.font = [UIFont systemFontOfSize:24];
                        
                        ///f
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            
                            lableView.rearlabel.text = @"Dispose of any resources that can be recreated.";
                            
                            labelImageView.contentInsets = UIEdgeInsetsMake(20, 25, 20, 25);
                            
                            imageLabelView.contentInsets = UIEdgeInsetsMake(25, 50, 0, 10);
                            
                            vImageLabelView.titleLabel.font = [UIFont boldSystemFontOfSize:14];
                            
                            ///g
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                lableView.rearlabel.backgroundColor = [UIColor greenColor];
                                labelImageView.contentInsets = UIEdgeInsetsZero;
                                
                                imageLabelView.contentInsets = UIEdgeInsetsZero;
                                
                                vImageLabelView.contentInsets = UIEdgeInsetsMake(5, 10, 5, 10);
                            });
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
