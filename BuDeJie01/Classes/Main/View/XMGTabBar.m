//
//  XMGTabBar.m
//  BuDeJie01
//
//  Created by admin on 2017/11/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGTabBar.h"
#import "UIView+Frame.h"
@interface XMGTabBar ()

@property (nonatomic,weak)UIButton *plusButton;
@property(nonatomic,weak)UIControl *previoustabbarbtn;
@property(nonatomic,weak)UIColor *nexttabbarbtn;
@end

@implementation XMGTabBar

-(UIButton *)plusButton
{
    if(_plusButton == nil){
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        [self addSubview:btn];
        _plusButton=btn;
    }
    return _plusButton;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count=self.items.count;
    CGFloat btnw=self.xmg_width/(count+1);
    CGFloat btnh=self.xmg_height;
    CGFloat x=0;
    int i=0;
    for(UIControl *tabBarButton in self.subviews){
        if([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            if(i == 0 && self.previoustabbarbtn == nil){
                self.previoustabbarbtn=tabBarButton;
            }
            if(i == 2){
                i += 1;
            }

            x=i * btnw;
            tabBarButton.frame=CGRectMake(x, 0, btnw, btnh);
            i++;
            [tabBarButton addTarget:self action:@selector(clicktabbar:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    
    self.plusButton.center=CGPointMake(self.xmg_width/2, self.xmg_height/2);
}
-(void)clicktabbar:(UIControl *)tabbar
{
    if([self.previoustabbarbtn isEqual:tabbar]){
        XMGFunc;
        [[NSNotificationCenter defaultCenter]postNotificationName:XMGTabBarButtonDidRepeatClickNotification object:nil];
        
        return;
    }
    self.previoustabbarbtn=tabbar;
    
}

@end
