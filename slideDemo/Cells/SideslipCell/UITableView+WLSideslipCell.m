//
//  WLSlideslipDefine.h
//  EUTv5
//
//  Created by edz on 2020/7/13.
//  CopWLight © 2020 Louis. All rights reserved.
//
//

#import "UITableView+WLSideslipCell.h"
#import "WLSideslipCellProxy.h"
#import "WLSideslipCell.h"

#import <objc/runtime.h>

 
@implementation UITableView (WLSideslipCell)
#pragma mark - 隐藏扩展按钮

- (void)hiddenOtherSideslip:(WLSideslipCell *)cell {
    self.sideslip = NO;
    for (WLSideslipCell *c in self.visibleCells) {
        if (c == cell) {
            self.sideslip = YES;
        }else if ([c isKindOfClass:WLSideslipCell.class] && c.sideslip ) {
            
            [c hiddenSideslip];
        }
    }
}

- (void)hiddenAllSideslip {
    self.sideslip = NO;
    for (WLSideslipCell *cell in self.visibleCells) {
        if ([cell isKindOfClass:WLSideslipCell.class] && cell.sideslip) {
            [cell hiddenSideslip];
        }
    }
}


-(void)setSideslipCellProxy:(WLSideslipCellProxy *)sideslipCellProxy{
    objc_setAssociatedObject(self, @selector(sideslipCellProxy), sideslipCellProxy, OBJC_ASSOCIATION_RETAIN);
}

-(WLSideslipCellProxy *)sideslipCellProxy{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSideslip:(BOOL)sideslip {
    objc_setAssociatedObject(self, @selector(sideslip), [NSNumber numberWithBool:sideslip], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)sideslip {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
@end
