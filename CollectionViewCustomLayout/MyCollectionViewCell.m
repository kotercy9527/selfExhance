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
        [self.contentView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        self.label.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)updateContent:(NSString *)text {
    self.label.text = text;
}


@end
