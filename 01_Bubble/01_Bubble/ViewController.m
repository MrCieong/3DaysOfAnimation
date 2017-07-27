//
//  ViewController.m
//  01_Bubble
//
//  Created by zhangjing on 2017/7/27.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *fishImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.fishImageView];
    [self animateFish];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(createBubble)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)createBubble {
    
    CGFloat originX = self.fishImageView.layer.presentationLayer.frame.origin.x;
    CGFloat originY = self.fishImageView.layer.presentationLayer.frame.origin.y + 100;
    CGPoint originPoint = CGPointMake(originX, originY);
    
    CGFloat distance = [self randomFloatBetweenMin:50 max:200];
    
    CGFloat destinationX = originX;
    CGFloat destinationY = originY - distance;
    CGPoint destinationPoint = CGPointMake(destinationX, destinationY);
    CGFloat offset = [self randomFloatBetweenMin:25 max:50];
    CGPoint controlPoint1 = CGPointMake(originX - offset, originY - distance / 2.0);
    CGPoint controlPoint2 = CGPointMake(originX + offset, originY - distance / 2.0);
    
    if ((arc4random() % 2) == 1) {
        CGPoint tmp = controlPoint1;
        controlPoint1 = controlPoint2;
        controlPoint2 = tmp;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:originPoint];
    [path addCurveToPoint:destinationPoint
            controlPoint1:controlPoint1
            controlPoint2:controlPoint2];
    
    CGFloat width = [self randomFloatBetweenMin:5 max:20];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    imageView.center = originPoint;
    imageView.image = [UIImage imageNamed:@"bubble"];
    imageView.alpha = [self randomFloatBetweenMin:0.5 max:1.0];
    [self.view addSubview:imageView];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.calculationMode = kCAAnimationPaced;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3, 1.3, 1)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 3.0;
    group.fillMode = kCAFillModeBoth;
    group.removedOnCompletion = NO;
    group.animations = @[animation, scaleAnimation];
    group.delegate = self;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [group setValue:imageView forKey:@"imageView"];
    
    [imageView.layer addAnimation:group forKey:nil];
    
}

- (CGFloat)randomFloatBetweenMin:(CGFloat)min
                             max:(CGFloat)max {
    
    CGFloat diff = max - min;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + min;
}

- (void)animateFish {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(CGRectGetWidth(self.view.bounds) + CGRectGetWidth(self.fishImageView.bounds), 0, 0)];
    animation.duration = 5.;
    animation.repeatCount = HUGE;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.fishImageView.layer addAnimation:animation forKey:@""];
    
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    id imageView = [anim valueForKey:@"imageView"];
    if ([imageView isKindOfClass:[UIImageView class]]) {
        [imageView removeFromSuperview];
    }
}

#pragma mark - Custom Accessors
- (UIImageView *)fishImageView {
    if (!_fishImageView) {
        _fishImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-200, 200, 200, 200)];
        _fishImageView.image = [UIImage imageNamed:@"fish"];
    }
    return _fishImageView;
}


@end
