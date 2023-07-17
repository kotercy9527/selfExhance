//
//  HitTestView.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/18.
//

#import "HitTestView.h"
#import <Masonry/Masonry.h>

@interface HitTestView ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIScrollView *secondScrollView;
@end
@implementation HitTestView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configInterface];
    }
    return self;
}

- (void)configInterface {
    self.backgroundColor = [UIColor whiteColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.right.equalTo(self);
        make.height.equalTo(@200);
    }];

    UIView *contentView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectZero];
    firstView.backgroundColor = [UIColor redColor];
    [contentView addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(contentView);
        make.width.equalTo(self.scrollView);
    }];

    UIView *secondView = [[UIView alloc] initWithFrame:CGRectZero];
    secondView.backgroundColor = [UIColor greenColor];
    [contentView addSubview:secondView];
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(firstView.mas_right);
        make.top.bottom.right.equalTo(contentView);
        make.width.equalTo(self.scrollView);
    }];
    self.scrollView.pagingEnabled = YES;

    
    self.secondScrollView = [[UIScrollView alloc] init];
    
    [firstView addSubview:self.secondScrollView];
    [self.secondScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(firstView);
        make.height.equalTo(firstView).multipliedBy(0.5);
    }];
    
    UIView *contentView2 = [[UIView alloc] initWithFrame:CGRectZero];
    [self.secondScrollView addSubview:contentView2];
    [contentView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.secondScrollView);
        make.height.equalTo(self.secondScrollView);
    }];

    
    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectZero];
    thirdView.backgroundColor = [UIColor blueColor];
    [contentView2 addSubview:thirdView];
    [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(contentView2);
        make.width.equalTo(self.scrollView);
    }];
    
    
    UIView *forthView = [[UIView alloc] initWithFrame:CGRectZero];
    forthView.backgroundColor = [UIColor yellowColor];
    [contentView2 addSubview:forthView];
    [forthView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(contentView2);
        make.left.equalTo(thirdView.mas_right);
        make.width.equalTo(self.scrollView);
    }];
    
    self.secondScrollView.delegate = self;

}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
   UIView *v =  [super hitTest:point withEvent:event];
    NSLog(@"%@",v);
    return v;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.secondScrollView) {
        CGFloat contentOffsetX = scrollView.contentOffset.x;
        CGFloat contentWidth = scrollView.contentSize.width;
        CGFloat frameWidth = scrollView.frame.size.width;

        if (contentOffsetX >= contentWidth - frameWidth) {
//            scrollView.scrollEnabled = NO;
            CGPoint offset = scrollView.contentOffset;
            offset.x = frameWidth;
            scrollView.contentOffset = offset;
            self.scrollView.scrollEnabled = NO;
        } else {
            self.scrollView.scrollEnabled = YES;
//            scrollView.scrollEnabled = YES;
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}

@end
