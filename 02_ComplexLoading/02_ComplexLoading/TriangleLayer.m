//
//  TriangleLayer.m
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/28.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "TriangleLayer.h"

@interface TriangleLayer ()

@property (nonatomic, strong) UIBezierPath *smallPath;
@property (nonatomic, strong) UIBezierPath *leftExtensionPath;
@property (nonatomic, strong) UIBezierPath *rightExtensionPath;
@property (nonatomic, strong) UIBezierPath *topExtensionPath;
@property (nonatomic, assign) CGFloat innerPadding;

@end

@implementation TriangleLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self p_commonInit];
    }
    return self;
}

#pragma mark - Private
- (void)p_commonInit {
    self.fillColor = [UIColor redColor].CGColor;
    self.strokeColor = [UIColor redColor].CGColor;
    self.lineJoin = kCALineJoinRound;
    self.lineCap = kCALineCapRound;
    self.lineWidth = 7.;
    _innerPadding = 35.;
    
    self.path = self.smallPath.CGPath;
}

#pragma mark - Public
- (void)animate {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    animation.values = @[(id)self.smallPath.CGPath,
                         (id)self.leftExtensionPath.CGPath,
                         (id)self.rightExtensionPath.CGPath,
                         (id)self.topExtensionPath.CGPath
                         ];
    animation.keyTimes = @[@(0.),
                           @(0.333),
                           @(0.666),
                           @(1.)
                           ];
    animation.duration = 0.3 * 3;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self addAnimation:animation forKey:nil];
}

#pragma mark - Custom Accessors
- (UIBezierPath *)smallPath {
    if (!_smallPath) {
        _smallPath = [UIBezierPath bezierPath];
        [_smallPath moveToPoint:CGPointMake(5. + _innerPadding, 95.)];
        [_smallPath addLineToPoint:CGPointMake(50., 12.5 + _innerPadding)];
        [_smallPath addLineToPoint:CGPointMake(95. - _innerPadding, 95.)];
        [_smallPath closePath];
    }
    return _smallPath;
}

- (UIBezierPath *)leftExtensionPath {
    if (!_leftExtensionPath) {
        _leftExtensionPath = [UIBezierPath bezierPath];
        [_leftExtensionPath moveToPoint:CGPointMake(5., 95.)];
        [_leftExtensionPath addLineToPoint:CGPointMake(50., 12.5 + _innerPadding)];
        [_leftExtensionPath addLineToPoint:CGPointMake(95. - _innerPadding, 95.)];
        [_leftExtensionPath closePath];
    }
    return _leftExtensionPath;
}

- (UIBezierPath *)rightExtensionPath {
    if (!_rightExtensionPath) {
        _rightExtensionPath = [UIBezierPath bezierPath];
        [_rightExtensionPath moveToPoint:CGPointMake(5., 95.)];
        [_rightExtensionPath addLineToPoint:CGPointMake(50., 12.5 + _innerPadding)];
        [_rightExtensionPath addLineToPoint:CGPointMake(95., 95.)];
        [_rightExtensionPath closePath];
    }
    return _rightExtensionPath;
}

- (UIBezierPath *)topExtensionPath {
    if (!_topExtensionPath) {
        _topExtensionPath = [UIBezierPath bezierPath];
        [_topExtensionPath moveToPoint:CGPointMake(5., 95.)];
        [_topExtensionPath addLineToPoint:CGPointMake(50., 12.5)];
        [_topExtensionPath addLineToPoint:CGPointMake(95., 95.)];
        [_topExtensionPath closePath];
    }
    return _topExtensionPath;
}

@end
