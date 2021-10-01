//
//  RegisterAndDispatchEvent.h
//  插件化
//
//  Created by tuhaisheng1 on 2021/9/30.
//  Copyright © 2021 tuhaisheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterAndDispatchEvent : NSObject

+ (instancetype)shareInstance;
- (void)addRegisterEvent:(NSString *)eventName observer:(nonnull id)observer selector:(nonnull SEL)selector;

- (void)dispatchEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;


@end

NS_ASSUME_NONNULL_END
