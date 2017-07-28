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
    self.backgroundColor = [UIColor redColor].CGColor;
    _smallPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50., 50., 0., 0.)];
    _largePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(2.5, 17.5, 95., 95.)];
    _squishVerticalPath = 
}

@end
