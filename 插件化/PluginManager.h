//
//  PluginManager.h
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseControllerProtocol.h"
@class UIView;
@interface PluginManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, weak) UIView * containView;

@property (nonatomic, weak) id<BaseControllerProtocol>tmpController;

- (void)initialization;

@end
