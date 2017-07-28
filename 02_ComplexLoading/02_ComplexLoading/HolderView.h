//
//  HolderView.h
//  02_ComplexLoading
//
//  Created by zhangjing on 2017/7/28.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HolderViewDelegate <NSObject>

- (void)animateLabel;

@end

@interface HolderView : UIView

@property (nonatomic, weak) id<HolderViewDelegate> delegate;
@property (nonatomic, assign) CGRect parentFrame;

- (void)start;

@end
