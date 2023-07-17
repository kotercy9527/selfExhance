//
//  ScrollInScrollViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/17.
//

#import "ScrollInScrollViewController.h"
#import <Masonry/Masonry.h>
#import "HitTestView.h"

@interface ScrollInScrollViewController ()

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIScrollView *secondScrollView;

@end

@implementation ScrollInScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    self.view.backgroundColor = [UIColor whiteColor];
//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
//    [self.view addSubview:self.scrollView];
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(200);
//        make.left.right.equalTo(self.view);
//        make.height.equalTo(@200);
//    }];
//
//    UIView *contentView = [[UIView alloc]initWithFrame:CGRectZero];
//    [self.scrollView addSubview:contentView];
//    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.scrollView);
//        make.height.equalTo(self.scrollView);
//    }];
//
//    UIView *firstView = [[UIView alloc] initWithFrame:CGRectZero];
//    firstView.backgroundColor = [UIColor redColor];
//    [contentView addSubview:firstView];
//    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.equalTo(contentView);
//        make.width.equalTo(self.scrollView);
//    }];
//
//    UIView *secondView = [[UIView alloc] initWithFrame:CGRectZero];
//    secondView.backgroundColor = [UIColor greenColor];
//    [contentView addSubview:secondView];
//    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(firstView.mas_right);
//        make.top.bottom.right.equalTo(contentView);
//        make.width.equalTo(self.scrollView);
//    }];
//    self.scrollView.pagingEnabled = YES;
//
//
//    self.secondScrollView = [[UIScrollView alloc] init];
//
//    [firstView addSubview:self.secondScrollView];
//    [self.secondScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(firstView);
//        make.height.equalTo(firstView).multipliedBy(0.5);
//    }];
//
//    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectZero];
//    [self.secondScrollView addSubview:contentView2];
//    [contentView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.secondScrollView);
//        make.height.equalTo(self.secondScrollView);
//    }];
//
//
//    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectZero];
//    thirdView.backgroundColor = [UIColor blueColor];
//    [contentView2 addSubview:thirdView];
//    [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.equalTo(contentView2);
//        make.width.equalTo(self.scrollView);
//    }];
//
//
//    UIView *forthView = [[UIView alloc] initWithFrame:CGRectZero];
//    forthView.backgroundColor = [UIColor yellowColor];
//    [contentView2 addSubview:forthView];
//    [forthView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.right.equalTo(contentView2);
//        make.left.equalTo(thirdView.mas_right);
//        make.width.equalTo(self.scrollView);
//    }];
    
    HitTestView *testView = [[HitTestView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:testView];
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@200);
    }];

}


@end
