//
//  ViewController.m
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/28.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "ViewController.h"
#import "HolderView.h"

@interface ViewController ()

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
}


#pragma mark - Custom Accessors
- (HolderView *)holderView {
    if (!_holderView) {
        CGFloat width = 100;
        _holderView = [[HolderView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2.0 - width / 2.0, self.view.bounds.size.width / 2.0 - width / 2.0, width, width)];
    }
    return _holderView;
}

@end
