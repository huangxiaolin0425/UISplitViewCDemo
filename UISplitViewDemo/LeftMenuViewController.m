//
//  LeftMenuViewController.m
//  UISplitViewDemo
//
//  Created by Cocav on 2018/5/3.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "DetailViewController.h"
#import "MainNavigationController.h"
@interface LeftMenuViewController ()

@property(nonatomic,strong)NSMutableArray *titleArr;
@end

@implementation LeftMenuViewController
-(NSMutableArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = [NSMutableArray array];
    }
    return _titleArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Menu";
    
    [self configSplitVc];
    
    [self initData];
}
-(void)configSplitVc
{
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self splitViewController:self.splitViewController willChangeToDisplayMode:UISplitViewControllerDisplayModePrimaryHidden];
}
-(void)initData
{
    NSArray *titles = @[@"1", @"2", @"3", @"4", @"5"];
    self.titleArr = [NSMutableArray arrayWithArray:titles];
   
}
- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}
#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UINavigationController *leftNav = self.navigationController;
    UISplitViewController *splitVc = self.splitViewController;
    if (indexPath.row == 0) {
        MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:self.detailViewController];
        splitVc.viewControllers = @[leftNav,nav];
    }else{
        UIViewController *secondVc = [[UIViewController alloc] init];
        
        secondVc.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        secondVc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
        MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:secondVc];

        splitVc.viewControllers = @[leftNav,nav];
    }
//    [self hideMenu];
    
}
-(void)hideMenu
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    }];
}
#pragma mark uisplitVc delegate

-(void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode
{
    NSLog(@"mode == %zd",displayMode);
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        UINavigationController *rightVC = (UINavigationController*)[svc.viewControllers lastObject];
        UIViewController *vc = [rightVC.viewControllers objectAtIndex:0];
            
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        vc.navigationItem.leftBarButtonItem = barItem;
    }
}
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
//    UINavigationController *rightVC = (UINavigationController*)[svc.viewControllers lastObject];
//    UIViewController *vc = [rightVC.viewControllers objectAtIndex:0];
    
}
-(void)showMenu
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    }];
}
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation{
    
    return UIInterfaceOrientationIsPortrait(orientation);
    
}

@end

