//
//  PluginBView.m
//  插件化
//
//  Created by tuhaisheng1 on 2021/9/30.
//  Copyright © 2021 tuhaisheng. All rights reserved.
//

#import "PluginBView.h"
#import "Event.h"
#import "RegisterAndDispatchEvent.h"

@implementation PluginBView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn];
    btn.frame = CGRectMake(0, 10,150, 150);
    [btn setTitle:@"改变颜色" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont fontWithName:@"Pacifico-Regular" size:15];
    btn.backgroundColor = [UIColor blackColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    NSLog(@"事件回调");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    NSLog(@"事件传递");
    return view;
}

- (void)clickBtn{
    NSLog(@"点击");
    
    [[RegisterAndDispatchEvent shareInstance] dispatchEvent:KPluginARegisterEventClickChangeColor userInfo:nil];
}

@end
