//
//  SubChooseView.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/15.
//

#import "SubChooseView.h"
#import <Masonry/Masonry.h>
#import "SubChooseCollectionViewCell.h"

@interface SubChooseView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation SubChooseView

#pragma mark - Init Method

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configInterface];
    }
    return self;
}

#pragma mark - Setter & Getter

- (void)setDataSources:(id<SubChooseViewDataSources>)dataSources {
    _dataSources = dataSources;
    [self.collectionView reloadData];
}

#pragma mark - Private Methods

- (void)configInterface {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.collectionView registerClass:[SubChooseCollectionViewCell class] forCellWithReuseIdentifier:@"SubChooseCollectionViewCell"];
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDatasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if ([self.dataSources respondsToSelector:@selector(numberOfSectionsInChooseView:)]) {
        return [self.dataSources numberOfSectionsInChooseView:self];;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.dataSources respondsToSelector:@selector(chooseView:numberOfItemsInSection:)]) {
        return [self.dataSources chooseView:self numberOfItemsInSection:section];
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SubChooseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SubChooseCollectionViewCell" forIndexPath:indexPath];
    BOOL needHighlight = NO;
    NSString *titleString = @"";
    if ([self.dataSources respondsToSelector:@selector(chooseView:titleInIndexpath:)]) {
        titleString = [self.dataSources chooseView:self titleInIndexpath:indexPath];
    }
    
    if ([self.dataSources respondsToSelector:@selector(chooseView:needHighlightInIndexpath:)]) {
        needHighlight = [self.dataSources chooseView:self needHighlightInIndexpath:indexPath];
    }
    [cell updateContent:titleString needHighlight:needHighlight hasSeperate:indexPath.row != 0];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(10, 40);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(chooseView:didSelectAtIndexPath:)]) {
        [self.delegate chooseView:self didSelectAtIndexPath:indexPath];
    }
}

- (void)reloadData {
    [self.collectionView reloadData];
}

@end
