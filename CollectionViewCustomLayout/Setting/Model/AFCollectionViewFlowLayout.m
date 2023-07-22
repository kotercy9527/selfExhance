//
//  AFCollectionViewFlowLayout.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/22.
//

#import "AFCollectionViewFlowLayout.h"

@interface AFCollectionViewFlowLayout ()

@property (nonatomic, strong) NSMutableSet *insertedRowSet;
@property (nonatomic, strong) NSMutableSet *deletedRowSet;
@property (nonatomic, assign) CGPoint center;

@end

@implementation AFCollectionViewFlowLayout

-(id)init
{
    if (!(self = [super init])) return nil;
    self.itemSize = CGSizeMake(100, 100);
    self.sectionInset = UIEdgeInsetsMake(13.0f, 13.0f, 13.0f, 13.0f);
    self.minimumInteritemSpacing = 13.0f;
    self.minimumLineSpacing = 13.0f;
    self.center = CGPointMake(0, 0);
    self.insertedRowSet = [NSMutableSet set];
    self.deletedRowSet = [NSMutableSet set];
    return self;
    
}

-(void)prepareForCollectionViewUpdates:(NSArray *)updateItems
{
    [super prepareForCollectionViewUpdates:updateItems];
    [updateItems enumerateObjectsUsingBlock:^(UICollectionViewUpdateItem *updateItem,
                                              NSUInteger idx, BOOL *stop) {
        if (updateItem.updateAction == UICollectionUpdateActionInsert){
            [self.insertedRowSet addObject:@(updateItem.indexPathAfterUpdate.item)];
        } else if (updateItem.updateAction == UICollectionUpdateActionDelete) {
            [self.deletedRowSet
             addObject:@(updateItem.indexPathBeforeUpdate.item)];
        }
    }];
}

-(void)finalizeCollectionViewUpdates {
    
[super finalizeCollectionViewUpdates];
[self.insertedRowSet removeAllObjects];
[self.deletedRowSet removeAllObjects];
}

- (UICollectionViewLayoutAttributes *) initialLayoutAttributesForAppearingItemAtIndexPath:
(NSIndexPath *)itemIndexPath {
if ([self.insertedRowSet containsObject:@(itemIndexPath.item)]){
UICollectionViewLayoutAttributes *attributes = [self
layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
attributes.center = self.center;
return attributes;
    
}
return nil;
    
}
@end
