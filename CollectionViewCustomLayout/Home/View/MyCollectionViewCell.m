//
//  MyCollectionViewCell.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import "MyCollectionViewCell.h"
#import <Masonry/Masonry.h>


@interface MyCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation MyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.centerX.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(3);
        }];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)updateContent:(NSString *)text {
    self.label.text = text;
}


@end
