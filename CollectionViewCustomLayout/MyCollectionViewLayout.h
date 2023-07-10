//
//  MyCollectionViewLayout.h
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MyColletionViewLayoutDataSource <NSObject>

-(CGFloat)widthAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MyCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, strong) id <MyColletionViewLayoutDataSource> dataSource;


- (instancetype)initWithRowHeight:(CGFloat)rowHeight
                           rowGap:(CGFloat)rowGap
                        inset:(UIEdgeInsets)inset;
@end

NS_ASSUME_NONNULL_END
