//
//  SelfSizingCellViewController.m
//  Right
//
//  Created by YXLONG on 2017/11/17.
//  Copyright © 2017年 Right. All rights reserved.
//

#import "SelfSizingCellViewController.h"


@interface SelfSizingCell : UITableViewCell
@property(nonatomic, strong) UILabel *contentLabel;
@end

@implementation SelfSizingCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        _contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _contentLabel.preferredMaxLayoutWidth = CGRectGetWidth([UIScreen mainScreen].bounds)-30;
        
        [_contentLabel setContentHuggingPriority:751 forAxis:0];
        [_contentLabel setContentHuggingPriority:751 forAxis:1];
        
        [_contentLabel setContentCompressionResistancePriority:250 forAxis:0];
        [_contentLabel setContentCompressionResistancePriority:250 forAxis:1];
        
        
        NSArray *_constraints = @[[NSLayoutConstraint constraintWithItem:_contentLabel
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.contentView
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1
                                                                constant:15],
                                  [NSLayoutConstraint constraintWithItem:_contentLabel
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationLessThanOrEqual
                                                                  toItem:self.contentView
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1
                                                                constant:-15],
                                  [NSLayoutConstraint constraintWithItem:_contentLabel
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.contentView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:10],
                                  [NSLayoutConstraint constraintWithItem:_contentLabel
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.contentView
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1
                                                                constant:-10]];
        [NSLayoutConstraint activateConstraints:_constraints];
    }
    return self;
}
@end


static NSString * const ReusedCellId = @"ReusedCellId";

@interface SelfSizingCellViewController ()
{
    NSArray *titles;
    id observer;
}
@end

@implementation SelfSizingCellViewController

- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    if(observer){
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    titles = @[@"ncomment the following line to preserve selection between presentations.",
               @"ncomment the following line to preserve selection between presentations.ncomment the following line to preserve selection between presentations.",
               @"ncomment the following line to preserve selection between presentations.ncomment the following line to preserve selection between presentations.ncomment the following line to preserve selection between presentations.",
               @"Dispose of any resources that can be recreated.",
               @"Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.Dispose of any resources that can be recreated."];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
    
    [self.tableView registerClass:[SelfSizingCell class] forCellReuseIdentifier:ReusedCellId];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(contentSizeCategoryDidChange)
//                                                 name:UIContentSizeCategoryDidChangeNotification
//                                               object:nil];
    
    observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIContentSizeCategoryDidChangeNotification object:[UIApplication sharedApplication] queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [self contentSizeCategoryDidChange];
    }];
}

- (void)contentSizeCategoryDidChange
{
    [self.tableView invalidateIntrinsicContentSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return titles.count;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewAutomaticDimension;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SelfSizingCell *cell = (SelfSizingCell *) [tableView dequeueReusableCellWithIdentifier:ReusedCellId forIndexPath:indexPath];
    
    cell.contentLabel.text = titles[indexPath.row];
    return cell;
}

@end
