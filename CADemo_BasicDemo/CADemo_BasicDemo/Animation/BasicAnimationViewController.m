//
//  BasicAnimationViewController.m
//  CADemo_BasicDemo
//
//  Created by 杨俊鹏 on 16/5/19.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "BasicAnimationViewController.h"
#import "Macro.h"

@interface BasicAnimationViewController ()
@property (nonatomic, strong) CABasicAnimation *animation;
@end

@implementation BasicAnimationViewController
{
    UIView *redView;
    UIButton *playBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.title = @"BasicAnimation";
    self.view.backgroundColor = [UIColor whiteColor];
    redView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 100 , 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];

    playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake((SCREENWIDTH - 100)/2, SCREENHEIGHT - 80, 100, 40);
    [playBtn setTitle:@"play" forState:UIControlStateNormal];
    [playBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Selector Methods
- (void)play:(id)sender {
    redView.frame = CGRectMake(0, 200, 100, 100);
    //如无此句，动画结束时，redview会回到起点
    //也可以在anmition中添加一下代码:
    
    self.animation.fillMode = kCAFillModeForwards;
    self.animation.removedOnCompletion = NO;

    [redView.layer addAnimation:self.animation forKey:@"basic"];
    //建议下面这种写法，以确保模型层和表现层的同步
    //但是不知道为什么这里会出问题，坐标系？
//    redView.layer.position = CGPointMake(210, 200);
}
#pragma mark -- getter && setter
- (CABasicAnimation *)animation {
    if (!_animation) {
        _animation = [[CABasicAnimation alloc] init];
        _animation.keyPath = @"position.x";
        _animation.byValue = @(200);      //以所要执行动画的view的原点为起点，200是移动的值
        //也可以用from和to来表示起点和终点
//        _animation.fromValue = @(0);
//        _animation.toValue = @(0);
        _animation.duration = 1;
    }
    return _animation;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
