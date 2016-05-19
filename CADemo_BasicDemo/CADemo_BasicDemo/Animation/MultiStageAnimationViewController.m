//
//  MultiStageAnimationViewController.m
//  CADemo_BasicDemo
//
//  Created by 杨俊鹏 on 16/5/19.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "MultiStageAnimationViewController.h"
#import "Macro.h"

@interface MultiStageAnimationViewController ()
@property (nonatomic, strong) CAKeyframeAnimation *animation;
@end

@implementation MultiStageAnimationViewController
{
    UIView *redView;
    UIButton *playBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setupViews {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Multi-StageAnimation";
    redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake((SCREENWIDTH - 100)/2, SCREENHEIGHT - 80, 100, 40);
    [playBtn setTitle:@"play" forState:UIControlStateNormal];
    [playBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBtn];

}

- (void)play:(id)sender {
    [redView.layer addAnimation:self.animation forKey:@"shake"];
}
- (CAKeyframeAnimation *)animation {
    if (!_animation) {
        _animation = [[CAKeyframeAnimation alloc]init];
        _animation.keyPath = @"position.x";
        _animation.values = @[@0, @20, @(-20), @(20), @(-20), @0];
        _animation.keyTimes = @[@0, @(1/6.0f), @(2/6.0f), @(3/6.0f), @(4/6.0f), @1];
        _animation.duration = 1;
        _animation.additive = YES;
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
