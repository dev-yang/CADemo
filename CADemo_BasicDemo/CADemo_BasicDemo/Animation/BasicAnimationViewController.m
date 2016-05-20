//
//  BasicAnimationViewController.m
//  CADemo_BasicDemo
//
//  Created by 杨俊鹏 on 16/5/19.
//  Copyright © 2016年 杨俊鹏. All rights reserved.
//

#import "BasicAnimationViewController.h"
#import "Macro.h"
@interface BasicAnimationViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) CABasicAnimation *animation;
@property (nonatomic, copy)   NSArray *dataArr;
@end

@implementation BasicAnimationViewController
{
    UIView *redView;
    UIView *greenView;
    UIPickerView *pickView;
    UIButton *playBtn;
    NSArray *timeFunctions;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self setupViews];
}
- (void)initData {
    self.dataArr = @[@"Default", @"Liner", @"EaseIn", @"EaseOut", @"EaseInOut"];
    timeFunctions = @[kCAMediaTimingFunctionDefault, kCAMediaTimingFunctionLinear, kCAMediaTimingFunctionEaseIn, kCAMediaTimingFunctionEaseOut, kCAMediaTimingFunctionEaseInEaseOut];
}
- (void)setupViews {
    self.title = @"BasicAnimation";
    self.view.backgroundColor = [UIColor whiteColor];
    redView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100 , 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 220, 100, 100)];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 330, SCREENWIDTH , 170)];
    pickView.dataSource = self;
    pickView.delegate = self;
    [self.view addSubview:pickView];
    
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
#pragma mark -- PickView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArr.count;
}

#pragma mark -- PickView Delegate {
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200 , 30)];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = self.dataArr[row];
    return textLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 35;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self playAnimation:redView];
    self.animation.timingFunction = [CAMediaTimingFunction functionWithName:timeFunctions[row]];
    [self playAnimation:greenView];
    
}
#pragma mark -- Selector Methods
- (void)play:(id)sender {
    [self playAnimation:redView];
    [self playAnimation:greenView];
}
#pragma mark -- Private Methods
- (void)playAnimation:(UIView *)view {
    view.frame = CGRectMake(0, view.frame.origin.y, 100, 100);
    //如无此句，动画结束时，redview会回到起点
    //也可以在anmition中添加一下代码:
    self.animation.fillMode = kCAFillModeForwards;
    self.animation.removedOnCompletion = NO;
    
    [view.layer addAnimation:self.animation forKey:@"basic"];
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
        _animation.duration = 2;
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
