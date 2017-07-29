//
//  ViewController.m
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/28.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "ViewController.h"
#import "HolderView.h"

@interface ViewController () <HolderViewDelegate>

@property (nonatomic, strong) HolderView *holderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self addHolderView];
}

- (void)addHolderView {
    [self.view addSubview:self.holderView];
    [self.holderView start];
}

#pragma mark - HolderViewDelegate
- (void)animateLabel {
    [self.holderView removeFromSuperview];
    self.view.backgroundColor = [UIColor blueColor];
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"B";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:170];
    [self.view addSubview:label];
    label.transform = CGAffineTransformMakeScale(0.4, 0.4);
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        label.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self addButton];
    }];
}

- (void)addButton {
    UIButton *button = [[UIButton alloc] initWithFrame:self.view.bounds];
    [button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)tap {
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.holderView = nil;
    [self addHolderView];
}

#pragma mark - Custom Accessors
- (HolderView *)holderView {
    if (!_holderView) {
        CGFloat width = 100;
        _holderView = [[HolderView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2.0 - width / 2.0, self.view.bounds.size.height / 2.0 - width / 2.0, width, width)];
        _holderView.parentFrame = self.view.bounds;
        _holderView.delegate = self;
    }
    return _holderView;
}

@end
