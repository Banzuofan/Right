//
//  InsetsLabelView.m
//  Right
//
//  Created by YXLONG on 2017/11/21.
//  Copyright © 2017年 Right. All rights reserved.
//

#import "InsetsLabelView.h"

@implementation InsetsLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.numberOfLines = 0;
        [self addSubview:_label];
        
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        
        [_label setContentHuggingPriority:751 forAxis:0];
        [_label setContentHuggingPriority:751 forAxis:1];
        
        NSArray *arr = @[[NSLayoutConstraint constraintWithItem:_label
                                                      attribute:NSLayoutAttributeCenterX
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeCenterX
                                                     multiplier:1
                                                       constant:0],
                         [NSLayoutConstraint constraintWithItem:_label
                                                      attribute:NSLayoutAttributeCenterY
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                      attribute:NSLayoutAttributeCenterY
                                                     multiplier:1
                                                       constant:0]];
        
        [self addConstraints:arr];
    }
    return self;
}

- (CGSize)intrinsicContentSize
{
    if(_label.text){
        return CGSizeMake(_label.intrinsicContentSize.width+_contentInsets.left+_contentInsets.right, _label.intrinsicContentSize.height+_contentInsets.top+_contentInsets.bottom);
    }
    return CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
    _contentInsets = contentInsets;
    
    _label.preferredMaxLayoutWidth = _preferredMaxLayoutWidth-_contentInsets.left-_contentInsets.right;
    
    [self invalidateIntrinsicContentSize];
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
    _preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    _label.preferredMaxLayoutWidth = _preferredMaxLayoutWidth-_contentInsets.left-_contentInsets.right;
}

- (void)setText:(NSString *)text
{
    _text = text;
    _label.text = text;
    [self invalidateIntrinsicContentSize];
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    _label.font = font;
    [self invalidateIntrinsicContentSize];
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    _label.textColor = textColor;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _textAlignment = textAlignment;
    _label.textAlignment = _textAlignment;
}

@end
