//
//  ViewController.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/7.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "ViewController.h"
#import "WJUser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    @weakify(self)
    [RACObserve([WJUser currentUser], userName) subscribeNext:^(id x) {
        @strongify(self)
        NSLog(@"userName = %@",x);
    }];
}
- (IBAction)change:(id)sender {
    int xx = arc4random() % 100;
    [WJUser currentUser].userName = [NSString stringWithFormat:@"username + %d",xx];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
