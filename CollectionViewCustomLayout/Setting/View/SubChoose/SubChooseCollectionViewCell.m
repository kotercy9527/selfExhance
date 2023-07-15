//
//  SubChooseCollectionViewCell.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/15.
//

#import "SubChooseCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface SubChooseViewGapView : UIView

@end

@implementation SubChooseViewGapView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextStrokePath(context);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
@interface SubChooseCollectionViewCell ()

@property (nonatomic, strong)SubChooseViewGapView *gapView;

@end

@implementation SubChooseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configInterface];
    }
    return self;
}

#pragma mark - Setter & Getter

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.textColor = [UIColor redColor];
    }
    return _contentLabel;
}

- (SubChooseViewGapView *)gapView {
    if (!_gapView) {
        _gapView = [[SubChooseViewGapView alloc] initWithFrame:CGRectZero];
    }
    return _gapView;
}

#pragma mark - Private Methods

- (void)configInterface {
    [self.contentView addSubview:self.gapView];
    [self.contentView addSubview:self.contentLabel];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    [self.gapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(self.contentView);
        make.width.equalTo(@5);
        make.height.equalTo(@12);
    }];
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.gapView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
    }];
}
#pragma mark - Public Methods

- (void)updateContent:(NSString *)contentString needHighlight:(BOOL)highlightFlag hasSeperate:(BOOL)seperateFlag{
    if (highlightFlag) {
        self.contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17];
    } else {
        self.contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    }
    
    self.contentLabel.text = contentString;
    self.gapView.hidden = !seperateFlag;
}

@end
