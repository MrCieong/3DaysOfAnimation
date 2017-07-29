//
//  HolderView.m
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/28.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "HolderView.h"
#import "OvalLayer.h"
#import "TriangleLayer.h"
#import "RectangleLayer.h"
#import "ArcLayer.h"

@interface HolderView ()

@property (nonatomic, strong) OvalLayer *ovalLayer;
@property (nonatomic, strong) TriangleLayer *triangleLayer;
@property (nonatomic, strong) RectangleLayer *redRectangleLayer;
@property (nonatomic, strong) RectangleLayer *blueRectangleLayer;
@property (nonatomic, strong) ArcLayer *arcLayer;

@end

@implementation HolderView

#pragma mark - Lifecycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_commonInit];
    }
    return self;
}

#pragma mark - Public
- (void)start {
    [self.layer addSublayer:_ovalLayer];
    [self.ovalLayer expand];
    
    [NSTimer scheduledTimerWithTimeInterval:0.3
                                     target:self
                                   selector:@selector(p_wobbleOval)
                                   userInfo:nil repeats:NO];
}

#pragma mark - Private
- (void)p_commonInit {
    self.backgroundColor = [UIColor clearColor];
    _ovalLayer = [OvalLayer new];
    _triangleLayer = [TriangleLayer new];
    _redRectangleLayer = [[RectangleLayer alloc] initWithColor:[UIColor redColor]];
    _blueRectangleLayer = [[RectangleLayer alloc] initWithColor:[UIColor blueColor]];
    _arcLayer = [ArcLayer new];
}

- (void)p_wobbleOval {
    [self.layer addSublayer:self.triangleLayer];
    [self.ovalLayer wobble];
    
    [NSTimer scheduledTimerWithTimeInterval:0.9
                                     target:self
                                   selector:@selector(p_drawAnimatedTriangle)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)p_drawAnimatedTriangle {
    [self.triangleLayer animate];
    
    [NSTimer scheduledTimerWithTimeInterval:0.9
                                     target:self
                                   selector:@selector(p_spinAndTransfrom)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)p_spinAndTransfrom {
    [self p_rotation];
    [self.ovalLayer contract];
    
    [NSTimer scheduledTimerWithTimeInterval:0.45
                                     target:self
                                   selector:@selector(p_drawRedTriangleLayer)
                                   userInfo:nil
                                    repeats:NO];
    
    [NSTimer scheduledTimerWithTimeInterval:0.65
                                     target:self
                                   selector:@selector(p_drawBlueTriangleLayer)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)p_rotation {
    self.layer.anchorPoint = CGPointMake(0.5, 0.6);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(M_PI * 2.);
    animation.duration = 0.45;
    [self.layer addAnimation:animation forKey:nil];
}

- (void)p_drawRedTriangleLayer {
    [self.layer addSublayer:self.redRectangleLayer];
    
    [self.redRectangleLayer animate];
}

- (void)p_drawBlueTriangleLayer {
    [self.layer addSublayer:self.blueRectangleLayer];
    
    [self.blueRectangleLayer animate];
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(p_drawArc)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)p_drawArc {
    [self.layer addSublayer:self.arcLayer];
    
    [self.arcLayer animate];
    [NSTimer scheduledTimerWithTimeInterval:0.75
                                     target:self
                                   selector:@selector(p_expandView)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)p_expandView {
    self.backgroundColor = [UIColor blueColor];
    self.layer.sublayers = nil;
    CGFloat lineWidth = self.blueRectangleLayer.lineWidth;
    self.frame = CGRectMake(self.frame.origin.x - lineWidth, self.frame.origin.y - lineWidth, self.frame.size.width + lineWidth * 2, self.frame.size.height + lineWidth * 2);
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = self.parentFrame;
    } completion:^(BOOL finished) {
        [self p_addLabel];
    }];
}

- (void)p_addLabel {
    if ([self.delegate respondsToSelector:@selector(animateLabel)]) {
        [self.delegate animateLabel];
    }
}

@end
