//
//  MyCollectionViewLayout.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import "MyCollectionViewLayout.h"
#import "MyCollectionViewLayoutAttributes.h"
#import "NSString+Width.h"

@interface MyCollectionViewLayout ()

@property (nonatomic, strong) NSMutableDictionary *layoutsDictionary;
@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, assign) CGFloat fixRowHeight;
@property (nonatomic, assign)CGFloat rowGap;
@property (nonatomic, assign) NSInteger totalRows;
@property (nonatomic, assign) CGFloat maxWidth;

@end
@implementation MyCollectionViewLayout

#pragma mark - Super Methods
- (void)prepareLayout {
    [super prepareLayout];
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [self customAttributeAtIndexPath:indexPath];
    }
    
}

- (UICollectionViewLayoutAttributes *)customAttributeAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *storedAttribute = [self.layoutsDictionary valueForKey:[NSString stringFromIndexPath:indexPath]];
    if (storedAttribute) {
        return storedAttribute;
    }

    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGRect frame = attributes.frame;
    frame.size.width = [self.dataSource widthAtIndexPath:indexPath];
    if (frame.size.width > self.maxWidth - self.insets.left - self.insets.right) {
        frame.size.width = self.maxWidth ;
    }
    frame.size.height = self.fixRowHeight;
    attributes.frame = frame;
    
    if (indexPath.row == 0) {
        attributes.frame = CGRectMake(self.insets.left, 0, frame.size.width, self.fixRowHeight);
    } else {
        NSIndexPath *preIndexPath = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
        UICollectionViewLayoutAttributes *preAttribute = [self customAttributeAtIndexPath:preIndexPath];
        
        if (CGRectGetMaxX(preAttribute.frame) + attributes.frame.size.width + self.rowGap + self.insets.right > self.maxWidth) {
            CGRect frame = attributes.frame;
            frame.origin.x = self.insets.left;
            frame.origin.y = CGRectGetMaxY(preAttribute.frame) + self.rowGap;
            attributes.frame = frame;
        } else {
            attributes.frame = CGRectMake(CGRectGetMaxX(preAttribute.frame) + self.rowGap, CGRectGetMinY(preAttribute.frame), [self.dataSource widthAtIndexPath:indexPath], self.fixRowHeight);
        }
    }
    [self.layoutsDictionary setValue:attributes forKey:[NSString stringFromIndexPath:indexPath]];
    return attributes;
}

- (CGSize)collectionViewContentSize {
    NSIndexPath *maxIndexPath = [NSIndexPath indexPathForRow:[self.collectionView numberOfItemsInSection:0] - 1 inSection:0];
    if ([self.layoutsDictionary.allKeys containsObject:[NSString stringFromIndexPath:maxIndexPath]]) {
        UICollectionViewLayoutAttributes *attribute = [self.layoutsDictionary valueForKey:[NSString stringFromIndexPath:maxIndexPath]];
        return CGSizeMake(MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), CGRectGetMaxY(attribute.frame));
    } else {
        return self.collectionView.frame.size;
    }
}

- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    CGFloat minHeight = CGRectGetMinY(rect);
    CGFloat maxHeight = CGRectGetMaxY(rect);
    NSArray *layoutArray = self.layoutsDictionary.allValues;
    NSMutableArray * rtArr = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *tmpAttribute in layoutArray) {
        if (CGRectGetMinY(tmpAttribute.frame) >= minHeight && CGRectGetMaxY(tmpAttribute.frame) <= maxHeight) {
            [rtArr addObject:tmpAttribute];
            
        }
    }
    return rtArr;
    
}
    
#pragma mark - Init Methods

- (instancetype)initWithRowHeight:(CGFloat)rowHeight rowGap:(CGFloat)rowGap inset:(UIEdgeInsets)inset {
    if (self = [super init]) {
        self.fixRowHeight = rowHeight;
        self.rowGap = rowGap;
        self.insets = inset;
        self.layoutsDictionary = [NSMutableDictionary dictionary];
        self.maxWidth = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    }
    return self;
}

@end
