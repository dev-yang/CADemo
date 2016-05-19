//
//  ViewController.m
//  CADemo_BasicDemo
//
//  Created by 杨俊鹏 on 16/5/19.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "ViewController.h"
#import "Macro.h"
#import "BasicAnimationViewController.h"
static NSString * const menuCellIdentifier = @"menuCell";
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray *menuLists;
@property (nonatomic, strong) UITableView *menuTableView;
@end

@implementation ViewController
#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setupViews];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initData {
    self.menuLists = @[@"BasicAnimation", @"Multi-StageAnimation"];
}

- (void)setupViews {
    self.title = @"首页";
    [self.view addSubview:self.menuTableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuCellIdentifier];
    }
    cell.textLabel.text = self.menuLists[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                BasicAnimationViewController *bvc = [[BasicAnimationViewController alloc] init];
                [self.navigationController pushViewController:bvc animated:YES];
            }
            break;
            
        default:
            break;
    }
}
#pragma mark -- getter && setter

- (UITableView *)menuTableView {
    if (!_menuTableView) {
        _menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 64) style:UITableViewStylePlain];
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
    }
    return _menuTableView;
}


@end
