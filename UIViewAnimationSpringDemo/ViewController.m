//
//  ViewController.m
//  UIViewAnimationSpringDemo
//
//  Created by JackWong on 15/8/12.
//  Copyright (c) 2015年 JackWong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableArray *_buttonArray;
    
    BOOL _isShow;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createButtons];
    
}

- (void)createButtons {
    
    UIButton *touchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    touchButton.frame = CGRectMake(200, 50, 100, 50);
    
    [touchButton setTitle:@"Touch" forState:UIControlStateNormal];
    
    [touchButton setBackgroundColor:[UIColor grayColor]];
    
    [touchButton addTarget:self action:@selector(tocuhAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:touchButton];
    
    NSArray *titleArray = @[@"tabbar_compose_camera", @"tabbar_compose_idea", @"tabbar_compose_lbs", @"tabbar_compose_more", @"tabbar_compose_photo", @"tabbar_compose_review"];
    
    CGFloat buttonWidth = 71.f;
    CGFloat buttonHeight = 71.f;
    
    CGFloat margin = (CGRectGetWidth(self.view.frame)- buttonWidth*3)/4.0;
    
    NSInteger i = 0;
    
    NSInteger row = 1;
    
    _buttonArray = [NSMutableArray array];
    
    CGFloat screenHeight = CGRectGetHeight(self.view.frame);
    
    for (NSString *title in titleArray) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        row = i / 3;
        
        button.frame = CGRectMake((i%3+1)*margin +i%3*buttonWidth, screenHeight +i/3*(buttonHeight + 20), buttonWidth, buttonHeight);
        
        //        button.frame = CGRectMake((i+1)%3 == 0 ? 3:(i+1)%3*margin + buttonWidth*i, 100 + i/3*buttonHeight, buttonWidth, buttonHeight);
        
        //        NSLog(@"%@",NSStringFromCGRect(button.frame));
        [button setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
        
        [_buttonArray addObject:button];
        
        [self.view addSubview:button];
        i++;
        
    }
    
    
}

- (void)tocuhAction:(UIButton *)button {
    if (!_isShow) {
        int i = 0;
        for (UIButton *button in _buttonArray) {
            [UIView animateWithDuration:0.7 delay:0.01*(i++) usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
                CGRect rect = button.frame;
                rect.origin.y -= 400;
                button.frame = rect;
            } completion:^(BOOL finished) {
                
            }];
        }
        _isShow = !_isShow;
    }else {
        int k = 0;
        
        int totalsBtn = (int)_buttonArray.count;
        for (int i = totalsBtn; i > 0; i--) {
            UIButton *btn = (UIButton *)_buttonArray[i-1];
            [UIView animateWithDuration:0.7 delay:0.01*(k++)  usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
                CGRect rect = btn.frame;
                rect.origin.y += 400;
                btn.frame = rect;
                
            } completion:^(BOOL finished) {
                
            }];
        }
        _isShow = !_isShow;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
