//
//  NSString+Width.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import "NSString+Width.h"

@implementation NSString (Width)

- (CGFloat)contentWith:(UIFont *)font gap:(CGFloat) aGap {
    if (!font) {
        return 0;
    }
    CGFloat width = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
    return width + 2 * aGap + 5;
}

+ (NSString *)stringFromIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"%ld-%ld",indexPath.section,indexPath.row];
}
@end
