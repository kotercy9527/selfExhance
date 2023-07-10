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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configInterface];
    [self prepareData];
}

- (void)prepareData {
//    self.dataArray = @[@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"insert some world long long a go",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display",@"this",@"is",@"a",@"test",@"longlonglong",@"program to display"];
    self.dataArray = @[@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk",@"123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk123123sdfkhsdkfjhsdfk"];
}

- (void)configInterface {
    MyCollectionViewLayout *layout = [[MyCollectionViewLayout alloc] initWithRowHeight:50 rowGap:10 inset:UIEdgeInsetsZero];
    layout.dataSource = self;
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


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell updateContent:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
    
}

- (CGFloat)widthAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = [self.dataArray objectAtIndex:indexPath.row];
    return [string contentWith:[UIFont systemFontOfSize:14] gap:3];
}


@end
