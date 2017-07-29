//
//  OvalLayer.m
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/28.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "OvalLayer.h"

@interface OvalLayer ()

@property (nonatomic, strong) UIBezierPath *smallPath;
@property (nonatomic, strong) UIBezierPath *largePath;
@property (nonatomic, strong) UIBezierPath *squishVerticalPath;
@property (nonatomic, strong) UIBezierPath *squishHorizontalPath;
@property (nonatomic, assign) NSTimeInterval animationDuration;

@end

@implementation OvalLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_commontInit];
    }
    return self;
}

- (void)p_commontInit {
    self.fillColor = [UIColor redColor].CGColor;
    _smallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50., 50., 0., 0.)];
    _largePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 17.5, 95., 95.)];
    _squishVerticalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 20., 95., 90.)];
    _squishHorizontalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5., 20., 90., 90.)];
    _animationDuration = 0.3;
    self.path = _smallPath.CGPath;
}

#pragma mark - Public
- (void)expand {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];

    animation.fromValue = (id)(_smallPath.CGPath);
    animation.toValue = (id)(_largePath.CGPath);
    animation.duration = _animationDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self addAnimation:animation forKey:nil];
}

- (void)wobble {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    animation.values = @[(id)_largePath.CGPath, (id)_squishVerticalPath.CGPath, (id)_squishHorizontalPath.CGPath, (id)_squishVerticalPath.CGPath, (id)_largePath.CGPath];
    animation.keyTimes = @[@(0.),
                           @(0.25),
                           @(0.5),
                           @(0.75),
                           @(1.),];
    
    animation.duration = 4 * _animationDuration;
    animation.repeatCount = 2;
    
    [self addAnimation:animation forKey:nil];
}

- (void)contract {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (id)_largePath.CGPath;
    animation.toValue = (id)_smallPath.CGPath;
    animation.duration = 0.3;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self addAnimation:animation forKey:nil];
}





@end
