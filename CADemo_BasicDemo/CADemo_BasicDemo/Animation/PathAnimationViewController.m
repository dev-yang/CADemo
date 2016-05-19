//
//  PathAnimationViewController.m
//  CADemo_BasicDemo
//
//  Created by 杨俊鹏 on 16/5/19.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "PathAnimationViewController.h"

@interface PathAnimationViewController ()

@end

@implementation PathAnimationViewController

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
    self.title = @"Path Animation";
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    label.center = self.view.center;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 100;
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"太阳";
    [self.view addSubview:label];
    
    UILabel *earthView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    earthView.backgroundColor = [UIColor blueColor];
    earthView.text = @"地";
    earthView.textAlignment = NSTextAlignmentCenter;
    earthView.layer.masksToBounds = YES;
    earthView.layer.cornerRadius = 25;
    [self.view addSubview:earthView];
    CGPoint point = label.frame.origin;
    CGRect boundingRect =  CGRectMake(point.x - 50, point.y - 50, 250, 250);
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    animation.duration = 4;
    animation.additive = YES;
    animation.repeatCount = HUGE_VALF;
    animation.calculationMode = kCAAnimationPaced;
    animation.rotationMode = kCAAnimationRotateAuto;
    [earthView.layer addAnimation:animation forKey:@"path"];
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
