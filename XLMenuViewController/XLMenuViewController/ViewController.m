//
//  ViewController.m
//  XLMenuViewController
//
//  Created by 郑雪利 on 2017/12/28.
//  Copyright © 2017年 郑雪利. All rights reserved.
//

#import "ViewController.h"
#import "XLMenuViewController.h"

@interface ViewController () <XLMenuViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)modalBtnClick:(UIButton *)sender {
    XLMenuViewController *menuVc = [[XLMenuViewController alloc] initWithTitles:@"商品添加" items:@[@"批量", @"扫码", @"单个"]];
    menuVc.delegate = self;
    [self presentViewController:menuVc animated:YES completion:nil];
}

- (void)menuViewControllerDidSelectedItems:(NSInteger)index
{
    NSLog(@"%zd",index);
}

@end
