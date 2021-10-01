//
//  PluginB.h
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import "BasePlugin.h"
#import "PluginBProtocol.h"
#import "BaseControllerProtocol.h"

@interface PluginB : BasePlugin<PluginBProtocol>


@property (nonatomic, weak) id<BaseControllerProtocol>tmpController;
- (void)pluginDidInstall;

- (void)dispatchEvent;

- (void)addRegister;


@end
