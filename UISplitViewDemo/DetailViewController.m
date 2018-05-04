//
//  DetailViewController.m
//  UISplitViewDemo
//
//  Created by Cocav on 2018/5/3.
//  Copyright © 2018年 Cocav. All rights reserved.
//
#import "DetailViewController.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSplitVc];
    [self.view addSubview:self.tableView];
   
}
- (UITableView *)tableView{
    if(!_tableView){
        _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell=@"cell";
    UITableViewCell *cells=[tableView dequeueReusableCellWithIdentifier:cell];
    if(!cells)
    {
        cells=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell];
    }
    cells.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
 
    return cells;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *thirdVc = [[UIViewController alloc] init];
    thirdVc.view.backgroundColor = [UIColor orangeColor];
    thirdVc.navigationItem.title=[NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:thirdVc animated:YES];
}
-(void)configSplitVc
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(showMenu) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
-(void)showMenu
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
