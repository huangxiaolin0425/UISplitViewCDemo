//
//  LeftMenuViewController.h
//  UISplitViewDemo
//
//  Created by Cocav on 2018/5/3.
//  Copyright © 2018年 Cocav. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface LeftMenuViewController : UITableViewController<UISplitViewControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

