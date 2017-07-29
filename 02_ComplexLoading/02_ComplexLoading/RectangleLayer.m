//
//  RectangleLayer.m
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/28.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "RectangleLayer.h"

@implementation RectangleLayer

#pragma mark - Lifecycle
- (instancetype)init {
    return [self initWithColor:[UIColor redColor]];
}

- (instancetype)initWithColor:(UIColor *)color {
    self = [super init];
    if (self) {
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = color.CGColor;
        self.lineWidth = 5.;
        self.path = [self createBezierPath].CGPath;
    }
    return self;
}

#pragma mark - Private
- (UIBezierPath *)createBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0., 100.)];
    [path addLineToPoint:CGPointMake(0., -self.lineWidth)];
    [path addLineToPoint:CGPointMake(100., -self.lineWidth)];
    [path addLineToPoint:CGPointMake(100., 100.)];
    [path addLineToPoint:CGPointMake(-self.lineWidth / 2.0, 100.)];
    return path;
}

#pragma mark - Public
- (void)animate {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.);
    animation.toValue = @(1.);
    animation.duration = 1.;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self addAnimation:animation forKey:nil];
}

@end
