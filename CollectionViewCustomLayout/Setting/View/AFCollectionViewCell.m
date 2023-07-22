//
//  AFCollectionViewCell.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/22.
//

#import "AFCollectionViewCell.h"

@interface AFCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation AFCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) return nil;
    self.backgroundColor = [UIColor orangeColor];
    self.label = [[UILabel alloc] initWithFrame: CGRectMake(0, 0,
                                                            CGRectGetWidth(frame),
                                                            CGRectGetHeight(frame))];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont boldSystemFontOfSize:24];
    [self.contentView addSubview:self.label];
    return self;
    
}

-(void)prepareForReuse
{
[super prepareForReuse];
[self setLabelString:@""];
}

-(void)setLabelString:(NSString *)labelString
{
self.label.text = labelString;
}
-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    self.label.center = CGPointMake( CGRectGetWidth(self.contentView.bounds) / 2.0f, CGRectGetHeight(self.contentView.bounds) / 2.0f);
}
@end
