//
//  MainSplitViewController.m
//  UISplitViewDemo
//
//  Created by Cocav on 2018/5/3.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "MainSplitViewController.h"
#import "LeftMenuViewController.h"
#import "DetailViewController.h"
#import "MainNavigationController.h"

@interface MainSplitViewController ()

@end

@implementation MainSplitViewController
-(instancetype)init
{
    return [self initWithNibName:nil bundle:nil];
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        LeftMenuViewController *masterVc = [[LeftMenuViewController alloc] init];
        MainNavigationController *navMst = [[MainNavigationController alloc] initWithRootViewController:masterVc];
        DetailViewController *detailVc = [[DetailViewController alloc] init];
        MainNavigationController *navDet = [[MainNavigationController alloc] initWithRootViewController:detailVc];
        self.viewControllers = @[navMst,navDet];
        
        self.delegate = masterVc;
        self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
