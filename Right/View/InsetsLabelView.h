//
//  InsetsLabelView.h
//  Right
//
//  Created by YXLONG on 2017/11/21.
//  Copyright © 2017年 Right. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsetsLabelView : UIView
{
@private
    UILabel *_label;
}
@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) UIFont *font;
@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, assign) UIEdgeInsets contentInsets;
@property(nonatomic) NSTextAlignment textAlignment;
@property(nonatomic) CGFloat preferredMaxLayoutWidth;
@end
