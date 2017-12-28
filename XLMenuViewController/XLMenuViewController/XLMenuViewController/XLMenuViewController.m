//
//  XLMenuViewController.m
//  supplier
//
//  Created by 郑雪利 on 2017/12/28.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import "XLMenuViewController.h"

@interface XLMenuViewController ()

/**  */
@property (nonatomic,strong)NSArray *items;
/**  */
@property (nonatomic,copy)NSString *titleStr;

@end

@implementation XLMenuViewController

- (instancetype)initWithTitles:(NSString *)title items:(NSArray *)items
{
    if (self == [super init]) {
        [self configMenuViewWithTitles:title items:items];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modalPresentationStyle = UIModalPresentationCustom;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissCurrentVC)];
    [self.view addGestureRecognizer:tap];
}

- (void)configMenuViewWithTitles:(NSString *)title items:(NSArray *)items
{
    self.view.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.5];
    
    CGFloat bgViewH = 48 + 42 * items.count;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 250) * 0.5, (self.view.frame.size.height - bgViewH) * 0.5, 250, bgViewH)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.clipsToBounds = YES;
    bgView.layer.cornerRadius = 10;
    [self.view addSubview:bgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bgView.frame.size.width, 48)];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor lightGrayColor];
    [bgView addSubview:titleLabel];
    
    for (int i = 0; i < items.count; i++) {
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 48 + 42 * i, bgView.frame.size.width, 0.5)];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [bgView addSubview:lineLabel];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 48 + 42 * i, bgView.frame.size.width, 42);
        [btn setTitle:items[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:68.0/255.0 green:102.0/255.0 blue:124.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [bgView addSubview:btn];
    }
}

- (void)itemBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(menuViewControllerDidSelectedItems:)]) {
        [self.delegate menuViewControllerDidSelectedItems:sender.tag];
    }
}

- (void)dismissCurrentVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
