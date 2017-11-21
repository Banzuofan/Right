//
//  OCLabelViews.m
//  JDStock
//
//  Created by YXLONG on 16/7/15.
//  Copyright © 2016年 jdjr. All rights reserved.
//

#import "OCLabelViews.h"

//static inline CGSize __sizeOfText(NSString *text, UIFont *font, CGSize constraintSize){
//    NSDictionary *attrs = @{NSFontAttributeName:font};
//    CGSize aSize = [text boundingRectWithSize:constraintSize
//                                      options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
//                                   attributes:attrs
//                                      context:nil].size;
//    return CGSizeMake(ceilf(aSize.width), ceilf(aSize.height));
//}


@interface OCLabelView()
- (BOOL)isSelfSizingImage;
@end

@implementation OCLabelView
@synthesize imageView;
@synthesize titleLabel;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
        [self prepareViews];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self commonInit];
    [self prepareViews];
}

- (void)commonInit
{
    self.userInteractionEnabled = NO;
    _font = [UIFont systemFontOfSize:15.0f];
    _textColor = [UIColor blackColor];
    _showMark = NO;
    
    _itemSpace = 4;
    _contentInsets = UIEdgeInsetsZero;
    _constraints = @[].mutableCopy;
}

- (void)prepareViews
{
    imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = self.mark;
    [self addSubview:imageView];
    imageView.hidden = !self.showMark;
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.numberOfLines = 1;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:titleLabel];
    
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Default is self-sizing for imageView.
    [imageView setContentHuggingPriority:999 forAxis:UILayoutConstraintAxisHorizontal];
    [imageView setContentHuggingPriority:999 forAxis:UILayoutConstraintAxisVertical];
    
    [titleLabel setContentHuggingPriority:999 forAxis:UILayoutConstraintAxisHorizontal];
    [titleLabel setContentHuggingPriority:999 forAxis:UILayoutConstraintAxisVertical];
}

- (BOOL)isSelfSizingImage
{
    return CGSizeEqualToSize(self.fixedImageSize, CGSizeZero);
}

- (void)setNeedsUpdateConstraints
{
    if(_constraints.count>0){
        [NSLayoutConstraint deactivateConstraints:_constraints];
    }
    [_constraints removeAllObjects];
    [super setNeedsUpdateConstraints];
}

#pragma Mark-- Setters

- (void)setText:(NSString *)text
{
    _text = text;
    titleLabel.text = text;
    [self invalidateIntrinsicContentSize];
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    titleLabel.textColor = textColor;
}

- (void)setShowMark:(BOOL)showMark
{
    _showMark = showMark;
    imageView.hidden = !_showMark;
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsUpdateConstraints];
}

- (void)setMark:(UIImage *)mark
{
    _mark = mark;
    imageView.image = mark;
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsUpdateConstraints];
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    titleLabel.font = font;
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsUpdateConstraints];
}

- (void)setItemSpace:(CGFloat)itemSpace
{
    _itemSpace = itemSpace;
    [self invalidateIntrinsicContentSize];
    [self setNeedsUpdateConstraints];
}

- (void)setFixedImageSize:(CGSize)fixedImageSize
{
    if(CGSizeEqualToSize(fixedImageSize, CGSizeZero)){
        [imageView setContentHuggingPriority:751 forAxis:UILayoutConstraintAxisHorizontal];
        [imageView setContentHuggingPriority:751 forAxis:UILayoutConstraintAxisVertical];
        
        [imageView setContentCompressionResistancePriority:250 forAxis:UILayoutConstraintAxisHorizontal];
        [imageView setContentCompressionResistancePriority:250 forAxis:UILayoutConstraintAxisVertical];
    }
    else{
        [imageView setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisHorizontal];
        [imageView setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisVertical];
        
        [imageView setContentCompressionResistancePriority:751 forAxis:UILayoutConstraintAxisHorizontal];
        [imageView setContentCompressionResistancePriority:751 forAxis:UILayoutConstraintAxisVertical];
    }
    
    _fixedImageSize = fixedImageSize;
    [self invalidateIntrinsicContentSize];
    [self setNeedsUpdateConstraints];
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
    _contentInsets = contentInsets;
    [self invalidateIntrinsicContentSize];
    [self setNeedsUpdateConstraints];
}


/**
 - (CGSize)fittingLayoutSize
 {
 CGFloat totalWidth = 0;
 CGFloat maxHeight = 0;
 
 if(self.showMark){
 if(self.isSelfSizingImage){
 totalWidth += imageView.image? imageView.image.size.width:0;
 maxHeight = imageView.image? imageView.image.size.height:0;
 }
 else{
 totalWidth += imageView.image? self.fixedImageSize.width:0;
 maxHeight = imageView.image? self.fixedImageSize.height:0;
 }
 
 if(imageView.image && titleLabel.text.length>0){
 totalWidth += self.itemSpace;
 }
 }
 
 if(titleLabel.text.length>0){
 CGSize aSize = __sizeOfText(titleLabel.text, titleLabel.font, CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX));
 totalWidth += aSize.width;
 
 if(maxHeight<aSize.height){
 maxHeight = aSize.height;
 }
 }
 
 if(totalWidth>0){
 totalWidth += self.contentInsets.left+self.contentInsets.right;
 }
 if(maxHeight>0){
 maxHeight += self.contentInsets.top+self.contentInsets.bottom;
 }
 return CGSizeMake(totalWidth, maxHeight);
 }
 */

- (CGSize)fittingLayoutSize
{
    CGFloat totalWidth = 0;
    CGFloat maxHeight = 0;
    
    if(self.showMark && imageView.image!=nil){
        if(self.isSelfSizingImage){
            totalWidth += imageView.intrinsicContentSize.width;
            maxHeight = imageView.intrinsicContentSize.height;
        }
        else{
            totalWidth += self.fixedImageSize.width;
            maxHeight = self.fixedImageSize.height;
        }
        
        if(titleLabel.text.length>0){
            totalWidth += self.itemSpace;
        }
    }
    
    totalWidth += titleLabel.intrinsicContentSize.width;
    
    if(maxHeight<titleLabel.intrinsicContentSize.height){
        maxHeight = titleLabel.intrinsicContentSize.height;
    }
    
    if(totalWidth>0){
        totalWidth += self.contentInsets.left+self.contentInsets.right;
    }
    if(maxHeight>0){
        maxHeight += self.contentInsets.top+self.contentInsets.bottom;
    }
    return CGSizeMake(totalWidth, maxHeight);
}

@end


@implementation OCImageLabelView

- (void)updateConstraints
{
    if (_constraints.count>0) {
        [super updateConstraints];
        return;
    }
    
    // imageView竖直居中显示
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:imageView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    // imageView左边距
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:imageView
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:self.contentInsets.left]];
    // imageView上下边距不超过superView
    [_constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:imageView
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:-self.contentInsets.bottom],
                                        [NSLayoutConstraint constraintWithItem:imageView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:self.contentInsets.top]]];
    
    // titleLabel竖直居中显示
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    // 右边距
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:-self.contentInsets.right]];
    
    // titleLabel上下边距不超过superView
    [_constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:titleLabel
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:-self.contentInsets.bottom],
                                        [NSLayoutConstraint constraintWithItem:titleLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:self.contentInsets.top]]];
    
    // 显示图片且图片存在
    if(self.showMark && imageView.image){
        
        // 固定尺寸
        if(!self.isSelfSizingImage){
            [_constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:imageView
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:self.fixedImageSize.width],
                                                [NSLayoutConstraint constraintWithItem:imageView
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:self.fixedImageSize.height]]];
        }
        
        // titleLabel左边距
        [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:imageView
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:self.itemSpace]];
    }
    else{
        // titleLabel左边距
        [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:self.contentInsets.left]];
    }
    
    
    [NSLayoutConstraint activateConstraints:_constraints];
    [super updateConstraints];
}

@end


@implementation OCLabelImageView

- (void)updateConstraints
{
    if (_constraints.count>0) {
        [super updateConstraints];
        return;
    }
    
    // titleLabel竖直居中显示
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    // 左边距
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1
                                                          constant:self.contentInsets.left]];
    
    // titleLabel上下边距不超过superView
    [_constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:titleLabel
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:-self.contentInsets.bottom],
                                        [NSLayoutConstraint constraintWithItem:titleLabel
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:self.contentInsets.top]]];
    
    // imageView竖直居中显示
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:imageView
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1
                                                          constant:0]];
    // imageView右边距
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:imageView
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1
                                                          constant:-self.contentInsets.right]];
    // imageView上下边距不超过superView
    [_constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:imageView
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationLessThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:-self.contentInsets.bottom],
                                        [NSLayoutConstraint constraintWithItem:imageView
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                        toItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:self.contentInsets.top]]];
    
    
    // 显示图片且图片可见
    if(self.showMark && imageView.image){
        
        // 固定尺寸
        if(!self.isSelfSizingImage){
            [_constraints addObjectsFromArray:@[[NSLayoutConstraint constraintWithItem:imageView
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:self.fixedImageSize.width],
                                                [NSLayoutConstraint constraintWithItem:imageView
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier:1
                                                                              constant:self.fixedImageSize.height]]];
        }
        
        // titleLabel右边距
        [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:imageView
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:-self.itemSpace]];
    }
    else{
        // titleLabel右边距
        [_constraints addObject:[NSLayoutConstraint constraintWithItem:titleLabel
                                                             attribute:NSLayoutAttributeRight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self
                                                             attribute:NSLayoutAttributeRight
                                                            multiplier:1
                                                              constant:-self.contentInsets.right]];
    }
    
    [NSLayoutConstraint activateConstraints:_constraints];
    [super updateConstraints];
}

@end


@implementation OCVImageLabelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _preferredMaxLayoutWidth = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
    _preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    titleLabel.preferredMaxLayoutWidth = preferredMaxLayoutWidth;
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
    if (_constraints.count>0) {
        [super updateConstraints];
        return;
    }
    
    NSMutableArray *_constraintsWithHighPriority = [[NSMutableArray alloc] init];
    if(self.showMark && imageView.image){
        if (![self isSelfSizingImage]) {
            
            NSArray *tmpArr = @[[NSLayoutConstraint constraintWithItem:imageView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:self.fixedImageSize.width],
                                [NSLayoutConstraint constraintWithItem:imageView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:nil
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                            multiplier:1
                                                              constant:self.fixedImageSize.height]];
            [_constraintsWithHighPriority addObjectsFromArray:tmpArr];
        }
        
        NSLayoutConstraint *titleLabelTopConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
                                                                                   attribute:NSLayoutAttributeTop
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:imageView
                                                                                   attribute:NSLayoutAttributeBottom
                                                                                  multiplier:1
                                                                                    constant:self.itemSpace];
        [_constraintsWithHighPriority addObject:titleLabelTopConstraint];
    }
    else{
        NSLayoutConstraint *titleLabelTopConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
                                                                                   attribute:NSLayoutAttributeTop
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self
                                                                                   attribute:NSLayoutAttributeTop
                                                                                  multiplier:1
                                                                                    constant:self.contentInsets.top];
        [_constraintsWithHighPriority addObject:titleLabelTopConstraint];
    }
    
    
    NSLayoutConstraint *imageViewTopConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1
                                                                               constant:self.contentInsets.top];
    NSLayoutConstraint *imageViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                                                  attribute:NSLayoutAttributeCenterX
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeCenterX
                                                                                 multiplier:1
                                                                                   constant:0];
    NSLayoutConstraint *titleLabelBottomConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self
                                                                                  attribute:NSLayoutAttributeBottom
                                                                                 multiplier:1
                                                                                   constant:-self.contentInsets.bottom];
    NSLayoutConstraint *titleLabelCenterXConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
                                                                                   attribute:NSLayoutAttributeCenterX
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:self
                                                                                   attribute:NSLayoutAttributeCenterX
                                                                                  multiplier:1
                                                                                    constant:0];
    [_constraintsWithHighPriority addObjectsFromArray:@[imageViewTopConstraint,
                                                        imageViewCenterXConstraint,
                                                        titleLabelBottomConstraint,
                                                        titleLabelCenterXConstraint]];
    
    for(NSLayoutConstraint *elem in _constraintsWithHighPriority){
        elem.priority = 999;
    }
    [_constraints addObjectsFromArray:_constraintsWithHighPriority];
    
    //!------
    // The following are constraints with lower priority.
    // imageView adds constraints on the left and right.
    
    NSArray *_constraintsWithLowerPriority = @[// imageViewLeftConstraint
                                               [NSLayoutConstraint constraintWithItem:imageView
                                                                            attribute:NSLayoutAttributeLeft
                                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeLeft
                                                                           multiplier:1
                                                                             constant:self.contentInsets.left],
                                               // imageViewRightConstraint
                                               [NSLayoutConstraint constraintWithItem:imageView
                                                                            attribute:NSLayoutAttributeRight
                                                                            relatedBy:NSLayoutRelationLessThanOrEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeRight
                                                                           multiplier:1
                                                                             constant:-self.contentInsets.right],
                                               // titleLabelLeftConstraint
                                               [NSLayoutConstraint constraintWithItem:titleLabel
                                                                            attribute:NSLayoutAttributeLeft
                                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeLeft
                                                                           multiplier:1
                                                                             constant:self.contentInsets.left],
                                               // titleLabelRightConstraint
                                               [NSLayoutConstraint constraintWithItem:titleLabel
                                                                            attribute:NSLayoutAttributeRight
                                                                            relatedBy:NSLayoutRelationLessThanOrEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeRight
                                                                           multiplier:1
                                                                             constant:-self.contentInsets.right]
                                               ];
    
    for(NSLayoutConstraint *elem in _constraintsWithLowerPriority){
        elem.priority = 750;
    }
    [_constraints addObjectsFromArray:_constraintsWithLowerPriority];
    
    [self addConstraints:_constraints];
    [super updateConstraints];
}


- (CGSize)fittingLayoutSize
{
    CGFloat totalHeight = 0;
    CGFloat maxWidth = 0;
    
    if(self.showMark && imageView.image!=nil){
        if(self.isSelfSizingImage){
            totalHeight += imageView.image.size.height;
            maxWidth = imageView.image.size.width;
        }
        else{
            totalHeight += self.fixedImageSize.height;
            maxWidth = self.fixedImageSize.width;
        }
        
        if(titleLabel.text.length>0){
            totalHeight += self.itemSpace;
        }
    }
    
    totalHeight += titleLabel.intrinsicContentSize.height;
    
    if(maxWidth<titleLabel.intrinsicContentSize.width){
        maxWidth = titleLabel.intrinsicContentSize.width;
    }
    
    if(totalHeight>0){
        totalHeight += self.contentInsets.top+self.contentInsets.bottom;
    }
    if(maxWidth>0){
        maxWidth += self.contentInsets.left+self.contentInsets.right;
    }
    return CGSizeMake(maxWidth, totalHeight);
}

@end

