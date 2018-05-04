//
//  MainNavigationController.m
//  UISplitViewDemo
//
//  Created by Cocav on 2018/5/3.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

+(void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};

    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:params forState:UIControlStateNormal];
//
    NSMutableDictionary *paramsDisabled = [NSMutableDictionary dictionary];
    paramsDisabled[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:paramsDisabled forState:UIControlStateDisabled];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //左侧边缘右滑返回
    self.interactivePopGestureRecognizer.delegate = nil;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
        if (self.viewControllers.count > 0) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"返回" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"backClick"] forState:UIControlStateHighlighted];
        [btn sizeToFit];

        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

    }
    [super pushViewController:viewController animated:animated];
    
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}




@end
