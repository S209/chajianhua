//
//  ViewController.m
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import "ViewController.h"
#import "BaseControllerProtocol.h"
#import "PluginManager.h"
@interface ViewController ()<BaseControllerProtocol>

@property (nonatomic, strong) PluginManager *pluginManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pluginManager.tmpController = self;
    
    self.pluginManager.containView = self.view;
    [self.pluginManager initialization];
    
}

- (void)changeColor{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark layze
- (PluginManager *)pluginManager{
    if (!_pluginManager) {
        _pluginManager = [PluginManager shareInstance];
    }
    return _pluginManager;
}

@end
