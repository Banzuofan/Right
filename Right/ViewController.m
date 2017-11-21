//
//  ViewController.m
//  Right
//
//  Created by YXLONG on 2017/10/25.
//  Copyright © 2017年 Right. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UINavigationBar+Awesome.h"
#import "UIImage+JKColor.h"
#import "CustomNavigationBar.h"

#define IS_IPHONE_X (([[UIScreen mainScreen] bounds].size.height == 812.f)?1:0)
#define NAV_BAR_DIFF (IS_IPHONE_X?24:0)

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UINavigationBar *navBar;
    UITableView *_tableView;
    NSArray * _dataSourceArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//
//    navBar = [[CustomNavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
//    navBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
//    [self.view addSubview:navBar];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage jk_imageWithColor:[UIColor colorWithWhite:0.25 alpha:1]]
                                                  forBarMetrics:UIBarMetricsDefault];
//
//    UINavigationItem * navigationBarTitle = [[UINavigationItem alloc] initWithTitle:@"Right"];
//    [navBar setItems:[NSArray arrayWithObject:navigationBarTitle]];
//
//
//    [navBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.right.equalTo(self.view);
//        make.top.equalTo(self.view).with.offset(20+NAV_BAR_DIFF);
//        make.height.mas_equalTo(44);
//    }];
    
    self.navigationItem.title = @"Right";
    
    
     _dataSourceArr = @[@"LabelLabelViewController",
                        @"SelfSizingCellViewController",
                        @"SelfSizingControlsViewController",
                        @"FittingSizingControlsViewController"];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reusedCell"];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.and.top.equalTo(self.view);
//        make.top.equalTo(self.view).with.offset(64+NAV_BAR_DIFF);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusedCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _dataSourceArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = _dataSourceArr[indexPath.row];
    Class cls = NSClassFromString(className);
    if(cls){
        id obj = [[cls alloc] init];
        UIViewController *vc = (UIViewController *)obj;
        vc.title = className;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
