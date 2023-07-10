//
//  MyCollectionViewLayoutAttributes.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import "MyCollectionViewLayoutAttributes.h"

@interface MyCollectionViewLayoutAttributes ()

@property (nonatomic) NSArray *children;

@end

@implementation MyCollectionViewLayoutAttributes

-(BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    MyCollectionViewLayoutAttributes *otherAttributes = (MyCollectionViewLayoutAttributes *)object;
    if ([self.children isEqualToArray:otherAttributes.children]) {
        return [super isEqual:object];
    }
    return NO;
}



@end
