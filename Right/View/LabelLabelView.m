//
//  LabelLabelView.m
//  
//
//  Created by YXLONG on 2017/10/16.
//  Copyright © 2017年 yxlong. All rights reserved.
//

#import "LabelLabelView.h"

@implementation LabelLabelView
{
    NSMutableArray *_constraints;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _constraints = @[].mutableCopy;
        
        _frontlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _frontlabel.numberOfLines = 1;
        [self addSubview:_frontlabel];
        _frontlabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_frontlabel setContentHuggingPriority:999 forAxis:0];
        [_frontlabel setContentHuggingPriority:999 forAxis:1];
        
        
        _rearlabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rearlabel.numberOfLines = 1;
        [self addSubview:_rearlabel];
        _rearlabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_rearlabel setContentHuggingPriority:999 forAxis:0];
        [_rearlabel setContentHuggingPriority:999 forAxis:1];
    }
    return self;
}

- (void)setNeedsUpdateConstraints
{
    if(_constraints.count>0){
        [self removeConstraints:_constraints];
    }
    [_constraints removeAllObjects];
    [super setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
    if (_constraints.count>0) {
        [super updateConstraints];
        return;
    }
    
    NSArray *fl_constraints = @[[NSLayoutConstraint constraintWithItem:_frontlabel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:_frontlabel
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:_frontlabel
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1
                                                                     constant:0],
                                       [NSLayoutConstraint constraintWithItem:_frontlabel
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationLessThanOrEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1
                                                                     constant:0]];
    
    NSArray *rl_constraints = @[[NSLayoutConstraint constraintWithItem:_rearlabel
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_frontlabel
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1
                                                                    constant:0],
                                      [NSLayoutConstraint constraintWithItem:_rearlabel
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1
                                                                    constant:0],
                                      [NSLayoutConstraint constraintWithItem:_rearlabel
                                                                   attribute:NSLayoutAttributeRight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1
                                                                    constant:0],
                                      [NSLayoutConstraint constraintWithItem:_rearlabel
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1
                                                                    constant:0],
                                      [NSLayoutConstraint constraintWithItem:_rearlabel
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationLessThanOrEqual
                                                                      toItem:self
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1
                                                                    constant:0]];
    
    [_constraints addObjectsFromArray:fl_constraints];
    [_constraints addObjectsFromArray:rl_constraints];
    
    [self addConstraints:_constraints];
    
    [super updateConstraints];
}

@end
