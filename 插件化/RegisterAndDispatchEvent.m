//
//  RegisterAndDispatchEvent.m
//  插件化
//
//  Created by tuhaisheng1 on 2021/9/30.
//  Copyright © 2021 tuhaisheng. All rights reserved.
//

#import "RegisterAndDispatchEvent.h"

@interface RegisterAndDispatchEvent ()

//@property (nonatomic, strong) NSMapTable<id, NSMutableSet<id > *> *_objectInfosMap;
@property (nonatomic, strong) NSMapTable *hashTable;

@end
@implementation RegisterAndDispatchEvent

+ (instancetype)shareInstance{
    static RegisterAndDispatchEvent *sharedInstance;
    static dispatch_once_t onceToken;   // typedef long dispatch_once_t;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//key 是插件 value 是字典  ，value 字典 中 key 是事件名字 value是动作
- (void)addRegisterEvent:(NSString *)eventName observer:(nonnull id)observer selector:(nonnull SEL)selector {
 
    NSMapTable *plugDict = [self.hashTable objectForKey:observer];
    if (![plugDict isKindOfClass:[NSMapTable class]]) {
        plugDict  = [NSMapTable weakToStrongObjectsMapTable];
    }

    NSMutableSet *valueArray = [plugDict objectForKey:eventName];
    if (!valueArray) {
        valueArray = [NSMutableSet set];
        [valueArray addObject:[NSValue valueWithPointer:selector]];
    }else{
        if (![valueArray containsObject:[NSValue valueWithPointer:selector]]) {
            [valueArray addObject:[NSValue valueWithPointer:selector]];
        }
    }
    [plugDict setObject:valueArray forKey:eventName];
    [self.hashTable setObject:plugDict forKey:observer];
}

- (void)dispatchEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    for (id object in self.hashTable) {
        NSMapTable *plugDict = [self.hashTable objectForKey:object];
        if ([plugDict isKindOfClass:[NSMapTable class]]) {
            NSMutableArray *valueArray = [plugDict objectForKey:eventName];
            if (valueArray.count == 0) {
                return;
            }
            [valueArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSValue *objValue = (NSValue *)obj;
                SEL selctor = [objValue pointerValue];
                if ([object respondsToSelector:selctor]) {
                    [object performSelector:selctor withObject:userInfo];
                }
            }];
        }
    }
}

#pragma mark layze


- (NSMapTable *)hashTable{
    BOOL retainObserved = YES;
    if (!_hashTable) {
        NSPointerFunctionsOptions keyOptions = retainObserved ? NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPointerPersonality : NSPointerFunctionsWeakMemory|NSPointerFunctionsObjectPointerPersonality;
        _hashTable = [[NSMapTable alloc] initWithKeyOptions:keyOptions valueOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPersonality capacity:0];
    }
    return _hashTable;
}

@end
