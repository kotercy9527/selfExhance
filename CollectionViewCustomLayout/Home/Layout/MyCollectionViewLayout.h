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



/// 构造方法
/// - Parameters:
///   - rowHeight: 高度，这里是写死的高度
///   - minrowGap: 最小行间距
///   - inset: 内容contentInset
- (instancetype)initWithRowHeight:(CGFloat)rowHeight
                           rowGap:(CGFloat)minrowGap
                        inset:(UIEdgeInsets)inset;
@end

NS_ASSUME_NONNULL_END
