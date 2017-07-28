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

@interface HolderView ()

@property (nonatomic, strong) OvalLayer *ovalLayer;
@property (nonatomic, strong) TriangleLayer *triangleLayer;
@property (nonatomic, strong) RectangleLayer *rectangleLayer;

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
    
}

#pragma mark - Private
- (void)p_commonInit {
    self.backgroundColor = [UIColor clearColor];
    _ovalLayer = [OvalLayer new];
    _triangleLayer = [TriangleLayer new];
    _rectangleLayer = [RectangleLayer new];
}


@end
