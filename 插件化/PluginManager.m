//
//  PluginManager.m
//  插件化
//
//  Created by tuhaisheng on 2021/9/5.
//  Copyright © 2021年 tuhaisheng. All rights reserved.
//

#import "PluginManager.h"
#import "BaseControllerProtocol.h"
#import <objc/runtime.h>

@interface PluginManager ()



@end
@implementation PluginManager

+ (instancetype)shareInstance{
    static PluginManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PluginManager alloc] init];
    });
    return manager;
}

- (void)initialization{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Plugin" ofType:@"plist"];

    //newsTest.plist文件
    NSMutableArray *PluginArray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];

    
    [PluginArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dictionary = (NSDictionary *)obj;
        
        NSString *clsStr = [dictionary objectForKey:@"plugin"];
        NSString *protocol = [dictionary objectForKey:@"protocol"];
        id cls = [[NSClassFromString(clsStr) alloc] init];
        id<BaseControllerProtocol>plugin = nil;
        SEL pluginSel = @selector(pluginWithProtocol:);
        
        if ([cls respondsToSelector:pluginSel]) {
            //可以做事
            plugin = [cls performSelector:pluginSel withObject:protocol];
            plugin.tmpController = self.tmpController;            
            [plugin pluginDidInstall];
        
            [plugin addRegister];
        }
    }];
    
}



#pragma mark layze


@end
