//
//  SupplementaryLayout.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/25.
//

#import "SupplementaryLayout.h"

@implementation SupplementaryLayout

- (void)prepareLayout {
//    [super prepareLayout];
    NSLog(@"%s",__func__);
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    return nil;
//    return [super layoutAttributesForItemAtIndexPath:indexPath];
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSLog(@"%s",__func__);
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    return arr;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__func__);
    return [super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];
}

@end
