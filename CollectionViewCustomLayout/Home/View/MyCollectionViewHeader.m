//
//  MyCollectionViewHeader.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/24.
//

#import "MyCollectionViewHeader.h"
#import <Masonry/Masonry.h>

@interface MyCollectionViewHeader ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation MyCollectionViewHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.numberOfLines = 0;
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setText:(NSString *)text {
    self.label.text = text;
}
@end
