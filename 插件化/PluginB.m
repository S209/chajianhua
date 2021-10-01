//
//  PluginB.m
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import "PluginB.h"
#import "Event.h"
#import "RegisterAndDispatchEvent.h"
#import "BasePlugin.h"
#import "PluginBView.h"

@interface PluginB ()

@property (nonatomic, weak)UIView *containerView;

@property (nonatomic, strong) PluginBView *pluginBView;
@end

@implementation PluginB

- (void)pluginDidInstall{
    
    //容器
    UIView *containerView = self.containerView;
    [containerView addSubview:self.pluginBView];

    self.pluginBView.backgroundColor = [UIColor yellowColor];
    self.pluginBView.frame = CGRectMake(0, 160, 250, 250);

}

- (void)addRegister{
    
}

- (void)setTmpController:(id<BaseControllerProtocol>)tmpController{
    _tmpController = tmpController;
    UIViewController *controller = (UIViewController *)tmpController;
    self.containerView = controller.view;
    NSLog(@"PluginB");
    if ([tmpController respondsToSelector:@selector(changeColor)]) {
        [tmpController changeColor];
    }
}

- (instancetype)pluginWithProtocol:(id<BaseControllerProtocol>*)protocol{
    return  [[PluginB alloc] init];
}

#pragma mark layze
//pluginBView
- (PluginBView *)pluginBView{
    if (!_pluginBView) {
        _pluginBView = [[PluginBView alloc] init];
    }
    return _pluginBView;
}
@end
