//
//  BaseControllerProtocol.h
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIView,UIViewController;
@protocol BaseControllerProtocol <NSObject>

@property (nonatomic, weak) id<BaseControllerProtocol>tmpController;
@optional

- (instancetype)pluginWithProtocol:(id<BaseControllerProtocol> *)protocol;

- (void)addRegister;

- (void)pluginDidInstall;

- (void)changeColor;


@end
