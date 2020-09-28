//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
    代理累，负责拦截tableView与其代理者的事件。关键作用是在有动作时收起扩展按钮
 */
@interface WLSideslipCellProxy : NSProxy<UITableViewDelegate,UIScrollViewDelegate,NSObject>

@property (nonatomic,weak) UITableView *target;

// isKindOfClass 和 isMemberOfClass 在使用proxy 的时候必须实现
-(BOOL)isKindOfClass:(Class)aClass ;

-(BOOL)isMemberOfClass:(Class)aClass;

@end

NS_ASSUME_NONNULL_END
