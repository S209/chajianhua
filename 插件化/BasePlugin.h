//
//  BasePlugin.h
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseControllerProtocol.h"

@interface BasePlugin : UIView


- (void)pluginDidInstall;

- (void)addRegister;

- (void)dispatchEvent;

@end
