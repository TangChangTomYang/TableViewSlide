//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//
//

#import "WLSideslipCellProxy.h"
#import "WLSideslipCell.h"
#import "UITableView+WLSideslipCell.h"

 
 

@interface WLSideslipCellProxy()
@property (nonatomic,weak) id<UIScrollViewDelegate,UITableViewDelegate> tbDelegate;
@property (nonatomic,weak) id<UITableViewDataSource> tbDataSource;
@end

@implementation WLSideslipCellProxy



- (BOOL)isKindOfClass:(Class)aClass {
    return [NSStringFromClass(aClass) isEqualToString:@"WLSideslipCellProxy"];
}

-(BOOL)isMemberOfClass:(Class)aClass{
    return  [NSStringFromClass(aClass) isEqualToString:@"WLSideslipCellProxy"];
}
 

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (self.target.sideslip) {
        [self.target hiddenAllSideslip];
    }
    
    if ([self.tbDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [self.tbDelegate scrollViewWillBeginDragging:scrollView];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.target.sideslip) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [self.target hiddenAllSideslip];
        return;
    }
    
    if ([self.tbDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.tbDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}



- (BOOL)respondsToSelector:(SEL)aSelector {
    if (aSelector == @selector(scrollViewWillBeginDragging:) ||
        aSelector == @selector(tableView:didSelectRowAtIndexPath:)) {
        return YES;
    }
    BOOL res = [self.tbDelegate respondsToSelector:aSelector] ||[self.tbDataSource respondsToSelector:aSelector];
    return res ;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
 
    if ([self.tbDelegate respondsToSelector:aSelector]) {
        return  self.tbDelegate;
    }
    else if ([self.tbDataSource respondsToSelector:aSelector]) {
        return  self.tbDataSource;
    }
    return self.target;
}

 


- (void)setTarget:(UITableView *)target {
    @synchronized ([self class]) {
        _target = target;
        target.sideslipCellProxy = self; //这里需要让tableView强引用proxy防止释放
        self.tbDelegate = target.delegate; //保存tableView原本的delegate，进行转发
        self.tbDataSource = target.dataSource;//保存tableView原本的dataSource，进行转发
        target.delegate = self; //修改tableView.delegate拦截事件
    }
}

@end
