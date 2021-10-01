//
//  PluginA.h
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import "BasePlugin.h"
#import "BaseControllerProtocol.h"
#import "PluginAProtocol.h"

@interface PluginA : BasePlugin<PluginAProtocol>


@property (nonatomic, weak) id<BaseControllerProtocol>tmpController;
- (void)pluginDidInstall;

- (void)addRegister;



@end

