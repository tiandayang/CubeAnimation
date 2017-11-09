//
//  ViewController.m
//  CubeAnimation
//
//  Created by 田向阳 on 2017/11/8.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic)  UIImageView *redView;
@property (strong, nonatomic)  UIImageView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.greenView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 150, 150, 150)];
    self.greenView.image = [UIImage imageNamed:@"green"];
    
    CATransform3D greenRotation = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0); // 旋转
    CATransform3D greenTranslation = CATransform3DMakeTranslation(150/2, 0, 0);// 平移
    
    self.greenView.layer.transform = CATransform3DConcat(greenRotation, greenTranslation);
    [self.view addSubview:self.greenView];
    self.redView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 150, 150, 150)];
    self.redView.image = [UIImage imageNamed:@"red"];
    [self.view addSubview:self.redView];
}
- (IBAction)start:(id)sender {

    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        CATransform3D redRotation = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
        CATransform3D redTranslation = CATransform3DMakeTranslation(-150/2, 0, 0);
        self.redView.layer.transform = CATransform3DConcat(redRotation, redTranslation);
        self.greenView.layer.transform = CATransform3DIdentity;
    } completion:nil];
}
- (IBAction)back:(id)sender {
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.redView.layer.transform = CATransform3DIdentity;
        CATransform3D greenRotation = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
        CATransform3D greenTranslation = CATransform3DMakeTranslation(150/2, 0, 0);
        self.greenView.layer.transform = CATransform3DConcat(greenRotation, greenTranslation);
    } completion:nil];
}

@end
