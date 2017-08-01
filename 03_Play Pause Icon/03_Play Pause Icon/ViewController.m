//
//  ViewController.m
//  03_Play Pause Icon
//
//  Created by zhangjing on 2017/8/1.
//  Copyright © 2017年 MrCieong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tap:(UIButton *)sender {
    sender.selected = !sender.selected;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
