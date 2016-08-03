//
//  ViewController.m
//  练习---转场动画
//
//  Created by 远洋 on 15/11/17.
//  Copyright © 2015年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,assign)int index;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.index = 1;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    self.index++;
    
    if (self.index == 6) {
        self.index =1;
    }
    
    NSString * imageName = [NSString stringWithFormat:@"%d.jpg",self.index];
    
    CATransition * anim = [[CATransition alloc]init];
    
    
//    fade
//交叉淡化过渡
//YES
//
//push
//新视图把旧视图推出去 
//YES
//
//moveIn
//新视图移到旧视图上面
//YES
//
//reveal
//将旧视图移开,显示下面的新视图 
//YES
//
//cube
//立方体翻滚效果
//
//
//oglFlip
//上下左右翻转效果
//
//
//suckEffect
//收缩效果，如一块布被抽走
//
//NO
//rippleEffect
//水滴效果
//
//NO
//pageCurl
//向上翻页效果
//
//
//pageUnCurl
//向下翻页效果
//
//
//cameraIrisHollowOpen
//相机镜头打开效果
//
//NO
//cameraIrisHollowClose
//相机镜头关闭效果
//
//NO

    //将旧视图移开,显示下面的新视图
    anim.type = @"reveal";
    //立方体翻滚效果
    anim.type = @"cube";
    //相机镜头关闭效果
    anim.type = @"cameraIrisHollowClose";
    //相机镜头打开效果
    anim.type = @"cameraIrisHollowOpen";
    //水滴效果
    anim.type = @"rippleEffect";
    //向下翻页效果
    anim.type = @"pageUnCurl";
    //向上翻页效果
    anim.type = @"pageUnCurl";
    //收缩效果，如一块布被抽走
    anim.type = @"suckEffect";
    //交叉淡化过渡
    anim.type = @"fade";
    //上下左右翻转效果
    anim.type = @"oglFlip";
    //新视图把旧视图推出去
    anim.type = @"push";
    anim.type = @"cube";
    
    //根据不同的手势 设置不同的动画方向
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        anim.subtype = kCATransitionFromRight;
    }else
    {
    anim.subtype = kCATransitionFromLeft;
    }
    
    [self.imageView.layer addAnimation:anim forKey:nil];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
