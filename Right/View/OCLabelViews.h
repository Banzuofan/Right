//
//  OCLabelViews.h
//  JDStock
//
//  Created by YXLONG on 16/7/15.
//  Copyright © 2016年 jdjr. All rights reserved.
//
// Style1
// Class: OCImageLabelView
// Style: |----image-[space]-title---|
//
// Style2
// Class: OCLabelImageView
// Style: |----title-[space]-image---|
//
// Style3
// Class: OCVImageLabelView
// Style:
//---------------
//      |
//    image
//      |
//    label
//      |
//---------------

#import <UIKit/UIKit.h>

@interface OCLabelView : UIView
{
@protected
    UIImageView *imageView;
    UILabel *titleLabel;
    NSMutableArray *_constraints;
}
@property(nonatomic, strong, readonly) UIImageView *imageView;
@property(nonatomic, strong, readonly) UILabel *titleLabel;

@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic, assign) BOOL showMark;
@property(nonatomic, strong) UIImage *mark;
@property(nonatomic, assign) CGFloat itemSpace;
@property(nonatomic, assign) CGSize fixedImageSize;
@property(nonatomic, assign) UIEdgeInsets contentInsets;
@property(nonatomic, assign, readonly) CGSize fittingLayoutSize;
@end

@interface OCImageLabelView : OCLabelView
@end

@interface OCLabelImageView : OCLabelView
@end

@interface OCVImageLabelView : OCLabelView
@property(nonatomic, assign) CGFloat preferredMaxLayoutWidth;
@end


