//
//  AFCollectionViewFlowLayout.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/22.
//

#import "AFCollectionViewCircleLayout.h"
#import "AFDecorationView.h"
static int kItemDimension = 50;
static NSString *AFCollectionViewFlowDecoration = @"AFCollectionViewFlowDecoration";
static NSString *decorationViewKind = @"decorationViewKind";
@interface AFCollectionViewCircleLayout ()

@property (nonatomic, strong) NSMutableSet *insertedRowSet;
@property (nonatomic, strong) NSMutableSet *deletedRowSet;

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;

@end

@implementation AFCollectionViewCircleLayout


-(void)prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.bounds.size;
    self.cellCount = [[self collectionView] numberOfItemsInSection:0];
    self.center = CGPointMake(size.width / 2.0, size.height / 2.0);
    self.radius = MIN(size.width, size.height) / 2.5;
    
    self.insertedRowSet = [NSMutableSet set];
    self.deletedRowSet = [NSMutableSet set];
    
    [self registerClass:[AFDecorationView class] forDecorationViewOfKind:AFCollectionViewFlowDecoration];
}
-(CGSize)collectionViewContentSize
{
    CGRect bounds = [[self collectionView] bounds];
    return bounds.size; }

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes =
    [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    attributes.size = CGSizeMake(kItemDimension, kItemDimension); attributes.center =
    CGPointMake(self.center.x + self.radius * cosf(2 * path.item * M_PI / self.cellCount - M_PI_2), self.center.y + self.radius *
                sinf(2 * path.item * M_PI / self.cellCount - M_PI_2));
    attributes.transform3D = CATransform3DMakeRotation(
                                                       (2 * M_PI * path.item / self.cellCount), 0, 0, 1);
    return attributes;
    
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i = 0 ; i < self.cellCount; i++){
        NSIndexPath* indexPath = [NSIndexPath
                                  indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        
    }
    
    if (CGRectContainsPoint(rect, self.center)){
    [attributes addObject:[self
    layoutAttributesForDecorationViewOfKind: AFCollectionViewFlowDecoration
    atIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]]];
    }
    return attributes;
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes =
    [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind: elementKind withIndexPath:indexPath];
    if ([elementKind isEqualToString:AFCollectionViewFlowDecoration]) {
        CGFloat rotationAngle = 0.0f;
        if ([self.collectionView.delegate conformsToProtocol:
             @protocol(AFCollectionViewDelegateCircleLayout)]){
            rotationAngle = [(id<AFCollectionViewDelegateCircleLayout>) self.collectionView.delegate
                             rotationAngleForSupplmentaryViewInCircleLayout:self];
        }
        layoutAttributes.size = CGSizeMake(20, 200);
        layoutAttributes.center = self.center;
        layoutAttributes.transform3D = CATransform3DMakeRotation(rotationAngle, 0, 0, 1);
        // Place the decoration view behind all the cells
        layoutAttributes.zIndex = -1;
    }
    return layoutAttributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath: itemIndexPath];
    if ([self.insertedRowSet
    containsObject:@(itemIndexPath.item)]){
    attributes = [self
    layoutAttributesForItemAtIndexPath:itemIndexPath]; attributes.alpha = 0.0;
    attributes.center = self.center;
     
    return attributes;
        
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    UICollectionViewLayoutAttributes *attributes = [super
    finalLayoutAttributesForDisappearingItemAtIndexPath: itemIndexPath];
    if ([self.deletedRowSet containsObject:@(itemIndexPath.item)])
    {
    attributes = [self
    layoutAttributesForItemAtIndexPath:itemIndexPath]; attributes.alpha = 0.0;
    attributes.center = self.center;
    attributes.transform3D =
    CATransform3DConcat( CATransform3DMakeScale(0.1, 0.1, 1.0), CATransform3DMakeRotation(
    (2 * M_PI * itemIndexPath.item / (self.cellCount + 1)),
    0, 0, 1));
    return attributes; }
    return attributes;
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
@end
