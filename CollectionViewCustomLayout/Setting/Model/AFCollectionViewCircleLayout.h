//
//  AFCollectionViewFlowLayout.h
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class AFCollectionViewCircleLayout;
@protocol AFCollectionViewDelegateCircleLayout <NSObject>

-(CGFloat)rotationAngleForSupplmentaryViewInCircleLayout:(AFCollectionViewCircleLayout *)circleLayout;

@end
@interface AFCollectionViewCircleLayout : UICollectionViewLayout

@end

NS_ASSUME_NONNULL_END
