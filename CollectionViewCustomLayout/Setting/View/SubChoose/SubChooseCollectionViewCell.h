//
//  SubChooseCollectionViewCell.h
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubChooseCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *contentLabel;//内容标签

- (void)updateContent:(NSString *)contentString needHighlight:(BOOL)highlightFlag hasSeperate:(BOOL)seperateFlag;

@end

NS_ASSUME_NONNULL_END
