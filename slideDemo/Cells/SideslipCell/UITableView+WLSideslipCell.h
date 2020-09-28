//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//
//
 
#import <UIKit/UIKit.h>
@class WLSideslipCellProxy;
@class WLSideslipCell;

@interface UITableView (WLSideslipCell)

#pragma mark- 给 tableView 扩展的属性
@property (nonatomic) WLSideslipCellProxy *sideslipCellProxy;
@property (nonatomic) BOOL sideslip;

/**
  隐藏所有cell的侧滑按钮
 */
- (void)hiddenAllSideslip;
- (void)hiddenOtherSideslip:(WLSideslipCell *)cell;
@end
 
