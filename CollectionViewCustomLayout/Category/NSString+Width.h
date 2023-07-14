//
//  NSString+Width.h
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Width)

- (CGFloat)contentWith:(UIFont *)font gap:(CGFloat) aGap;
+ (NSString *)stringFromIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
