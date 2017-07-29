//
//  ArcLayer.m
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/29.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "ArcLayer.h"

@interface ArcLayer ()

@property (nonatomic, strong) UIBezierPath *startingPath;
@property (nonatomic, strong) UIBezierPath *perPath;
@property (nonatomic, strong) UIBezierPath *lowPath;
@property (nonatomic, strong) UIBezierPath *midPath;
@property (nonatomic, strong) UIBezierPath *highPath;
@property (nonatomic, strong) UIBezierPath *completePath;

@end

@implementation ArcLayer

#pragma mark - Lifecycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = [UIColor blueColor].CGColor;
        self.path = self.startingPath.CGPath;
    }
    return self;
}

#pragma mark - Public
- (void)animate {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    animation.values = @[
                         (id)self.perPath.CGPath,
                         (id)self.startingPath.CGPath,
                         (id)self.lowPath.CGPath,
                         (id)self.midPath.CGPath,
                         (id)self.highPath.CGPath,
                         (id)self.completePath.CGPath
                         ];
    
    animation.keyTimes = @[
                           @(0.),
                           @(0.2),
                           @(0.4),
                           @(0.6),
                           @(0.8),
                           @(1.)
                           ];
    
    animation.duration = 5 * 0.25;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self addAnimation:animation forKey:nil];
}

#pragma mark - Custom Accessors
- (UIBezierPath *)perPath {
    if (!_perPath) {
        _perPath = [UIBezierPath bezierPath];
        [_perPath moveToPoint:CGPointMake(0., 99.)];
        [_perPath addLineToPoint:CGPointMake(0., 99.)];
        [_perPath addLineToPoint:CGPointMake(100., 100.)];
        [_perPath addLineToPoint:CGPointMake(100., 100.)];
        [_perPath closePath];
    }
    return _perPath;
}

- (UIBezierPath *)startingPath {
    if (!_startingPath) {
        _startingPath = [UIBezierPath bezierPath];
        [_startingPath moveToPoint:CGPointMake(0., 100.)];
        [_startingPath addLineToPoint:CGPointMake(0., 80.)];
        [_startingPath addCurveToPoint:CGPointMake(100., 80.) controlPoint1:CGPointMake(30., 70.) controlPoint2:CGPointMake(40., 90.)];
        [_startingPath addLineToPoint:CGPointMake(100., 100.)];
        [_startingPath closePath];
    }
    return _startingPath;
}

- (UIBezierPath *)lowPath {
    if (!_lowPath) {
        _lowPath = [UIBezierPath bezierPath];
        [_lowPath moveToPoint:CGPointMake(0., 100.)];
        [_lowPath addLineToPoint:CGPointMake(0., 60.)];
        [_lowPath addCurveToPoint:CGPointMake(100., 60.) controlPoint1:CGPointMake(30., 65) controlPoint2:CGPointMake(40., 50.)];
        [_lowPath addLineToPoint:CGPointMake(100., 100.)];
        [_lowPath closePath];
    }
    return _lowPath;
}

- (UIBezierPath *)midPath {
    if (!_midPath) {
        _midPath = [UIBezierPath bezierPath];
        [_midPath moveToPoint:CGPointMake(0., 100.)];
        [_midPath addLineToPoint:CGPointMake(0., 40.)];
        [_midPath addCurveToPoint:CGPointMake(100., 40.) controlPoint1:CGPointMake(30., 30.) controlPoint2:CGPointMake(40., 50.)];
        [_midPath addLineToPoint:CGPointMake(100., 100.)];
        [_midPath closePath];
    }
    return _midPath;
}

- (UIBezierPath *)highPath {
    if (!_highPath) {
        _highPath = [UIBezierPath bezierPath];
        [_highPath moveToPoint:CGPointMake(0., 100.)];
        [_highPath addLineToPoint:CGPointMake(0., 20.)];
        [_highPath addCurveToPoint:CGPointMake(100., 20.) controlPoint1:CGPointMake(30., 25.) controlPoint2:CGPointMake(40., 10.)];
        [_highPath addLineToPoint:CGPointMake(100., 100.)];
        [_highPath closePath];
    }
    return _highPath;
}

- (UIBezierPath *)completePath {
    if (!_completePath) {
        _completePath = [UIBezierPath bezierPath];
        [_completePath moveToPoint:CGPointMake(0., 100.)];
        [_completePath addLineToPoint:CGPointMake(0., -5.)];
        [_completePath addLineToPoint:CGPointMake(100., -5.)];
        [_completePath addLineToPoint:CGPointMake(100., 100.)];
        [_completePath closePath];
    }
    return _completePath;
}

@end
