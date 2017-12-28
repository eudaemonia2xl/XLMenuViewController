//
//  XLMenuViewController.h
//  supplier
//
//  Created by 郑雪利 on 2017/12/28.
//  Copyright © 2017年 Jingzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XLMenuViewControllerDelegate <NSObject>

- (void)menuViewControllerDidSelectedItems:(NSInteger)index;

@end

@interface XLMenuViewController : UIViewController

@property (nonatomic,weak) id<XLMenuViewControllerDelegate> delegate;

- (instancetype)initWithTitles:(NSString *)title items:(NSArray *)items;

@end
