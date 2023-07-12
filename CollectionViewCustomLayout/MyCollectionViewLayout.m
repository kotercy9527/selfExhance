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
@property (nonatomic, assign) CGFloat rowGap;
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

    CGFloat width = [self.dataSource widthAtIndexPath:indexPath];
    if (width < 50) {
        width  = 50;
    }
    width = MAX(width, 50);
    width = MIN(width, self.maxWidth - self.insets.left - self.insets.right);

    CGFloat height = self.fixRowHeight;
    
    CGFloat originX = frame.origin.x;
    CGFloat originY = frame.origin.y;
    
    if (indexPath.row == 0) {
        attributes.frame = CGRectMake(self.insets.left, 0, width, height);
    } else {
        NSIndexPath *preIndexPath = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
        UICollectionViewLayoutAttributes *preAttribute = [self customAttributeAtIndexPath:preIndexPath];
        
        if (CGRectGetMaxX(preAttribute.frame) + width + self.rowGap + self.insets.right > self.maxWidth) {
            //需要换行
            originX = self.insets.left;
            originY = CGRectGetMaxY(preAttribute.frame) + self.rowGap;
            attributes.frame = CGRectMake(originX, originY, width, height);
        } else {
            //不需要换行
            originX = CGRectGetMaxX(preAttribute.frame) + self.rowGap;
            originY = CGRectGetMinY(preAttribute.frame);
            attributes.frame = CGRectMake(originX, originY, width, height);
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

- (instancetype)initWithRowHeight:(CGFloat)rowHeight rowGap:(CGFloat)minrowGap inset:(UIEdgeInsets)inset {
    if (self = [super init]) {
        self.layoutsDictionary = [NSMutableDictionary dictionary];
        self.maxWidth = MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.fixRowHeight = rowHeight;
        self.insets = inset;
        
        //一行最大的个数
        NSInteger maxCount = (self.maxWidth - self.insets.left - self.insets.right + minrowGap)/(self.fixRowHeight + minrowGap);
        //cell所需要占用的最小宽度
        CGFloat cellMinWidth = self.insets.left + maxCount * self.fixRowHeight + self.insets.right;
        //计算可用的cell间距
        self.rowGap = (self.maxWidth - cellMinWidth)/(maxCount - 1);
    }
    return self;
}

@end
