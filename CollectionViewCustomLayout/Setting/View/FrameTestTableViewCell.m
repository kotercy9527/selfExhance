//
//  FrameTestTableViewCell.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/9/1.
//

#import "FrameTestTableViewCell.h"
#import <Masonry/Masonry.h>

@interface FrameTestTableViewCell ()

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation FrameTestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configInterface];
    }
    return self;
}

- (void)configInterface {
    [self.contentView addSubview:self.topView];
    [self.contentView addSubview:self.bottomView];
    [self.contentView addSubview:self.contentLabel];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.height.equalTo(@10);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.topView.mas_bottom);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentLabel.mas_bottom);
        make.height.equalTo(@10);
        make.bottom.equalTo(self.contentView);
    }];
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectZero];
        _topView.backgroundColor = [UIColor redColor];
    }
    return _topView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomView.backgroundColor = [UIColor greenColor];
    }
    return _bottomView;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (void)updateContent:(NSString *)str {
    self.contentLabel.text = str;
}

@end
