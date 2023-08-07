//
//  TextChangeAnimateViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/8/3.
//

#import "TextChangeAnimateViewController.h"
#import <Masonry/Masonry.h>

@interface TextChangeAnimateViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger value;
@end

@implementation TextChangeAnimateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.value = 0;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    self.label.textColor = [UIColor greenColor];
    self.label.text = @(self.value).stringValue;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"changValue" forState:UIControlStateNormal];
    [btn  addTarget:self action:@selector(buttonClicked_plusValue) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(20);
        make.centerX.equalTo(self);
    }];
}

- (void)buttonClicked_plusValue {
    self.value += 33;
    [UIView transitionWithView:self.label duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.label.text = @(self.value).stringValue;
    } completion:nil];
}
@end
