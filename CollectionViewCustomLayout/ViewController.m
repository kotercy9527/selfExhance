//
//  ViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/9.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "MyCollectionViewCell.h"
#import "MyCollectionViewLayout.h"
#import "NSString+Width.h"


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,MyColletionViewLayoutDataSource>

@property (nonatomic, strong) UICollectionView *colletionView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) MyCollectionViewLayout *customLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configInterface];
    [self prepareData];
    
}

- (void)prepareData {
    self.dataArray = @[@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"this",@"is",@"a",@"test",@"对不起，我这个就比较长了",@"哈哈，我总比你长吧，谦虚一点儿，ok"];
//    self.dataArray = @[@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk"];
}

- (void)configInterface {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(buttonClicked_switchLayout) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@40);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_top).offset(100);
    }];
    
    MyCollectionViewLayout *layout = [[MyCollectionViewLayout alloc] initWithRowHeight:50 rowGap:10 inset:UIEdgeInsetsMake(0, 10, 0, 10)];
    layout.dataSource = self;
    self.customLayout = layout;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout = flowLayout;
    self.colletionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.colletionView];
    [self.colletionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.right.bottom.equalTo(self.view);
    }];
    self.colletionView.delegate = self;
    self.colletionView.dataSource = self;
    [self.colletionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)buttonClicked_switchLayout {
    if ([self.colletionView.collectionViewLayout isEqual:self.customLayout]) {
        self.colletionView.collectionViewLayout =  self.flowLayout;
    } else {
        self.colletionView.collectionViewLayout =  self.customLayout;
    }
}

#pragma mark - UICollectionViewDatasources

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell updateContent:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
    
}

#pragma mark - MyColletionViewLayoutDataSource

- (CGFloat)widthAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = [self.dataArray objectAtIndex:indexPath.row];
    return [string contentWith:[UIFont systemFontOfSize:14] gap:3];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = [self.dataArray objectAtIndex:indexPath.row];
    return CGSizeMake([string contentWith:[UIFont systemFontOfSize:14] gap:3], 50);
}

@end
