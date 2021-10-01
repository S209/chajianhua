//
//  PluginA.m
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import "PluginA.h"
#import "BasePlugin.h"
#import "RegisterAndDispatchEvent.h"
#import "Event.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))



@interface PluginA ()

@property (nonatomic, strong) UIView *toolbar;

@property (nonatomic, weak) UIView *containerView;

@end
@implementation PluginA

- (void)pluginDidInstall{

    //容器
    UIView *containerView = self.containerView;
    
    UIView *toolbar = [[UIView alloc] init];
    self.toolbar = toolbar;
    toolbar.backgroundColor = [UIColor redColor];
    toolbar.frame = CGRectMake(0, 100, 50, 50);
    [containerView addSubview:toolbar];
}

- (void)addRegister{
    
    [[RegisterAndDispatchEvent shareInstance] addRegisterEvent:KPluginARegisterEventClickChangeColor observer:self selector:@selector(chatEnable:)];
}

- (void)dispatchEvent{
    
}

- (void)addContainer:(UIView *)view{
    self.containerView = view;
}

- (void)chatEnable:(NSDictionary *)dict{
    self.toolbar.backgroundColor = randomColor;
}


- (void)setTmpController:(id<BaseControllerProtocol>)tmpController{
    _tmpController = tmpController;
    UIViewController *controller = (UIViewController *)tmpController;
    self.containerView = controller.view;
    NSLog(@"PluginA");
}


- (instancetype)pluginWithProtocol:(id<BaseControllerProtocol>*)protocol{
    return  [[PluginA alloc] init];
}

@end
