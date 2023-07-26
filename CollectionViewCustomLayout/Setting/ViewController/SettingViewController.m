//
//  SettingViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/14.
//

#import "SettingViewController.h"
#import "ScrollInScrollViewController.h"
#import "PathAnimationViewController.h"
#import "CustomColletionViewLayoutViewController.h"
#import "UICollectionSupplementaryViewController.h"
#import "SubChooseView.h"
#import <Masonry/Masonry.h>

@interface SettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.titleArray = @[@"ScrollInScroll",@"pathAnimation",@"customLayout",@"supplementaryCollectionView"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = [self.titleArray objectAtIndex:indexPath.row];
    if ([title isEqualToString:@"ScrollInScroll"]) {
        ScrollInScrollViewController *vc = [[ScrollInScrollViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if ([title isEqualToString:@"pathAnimation"]) {
        PathAnimationViewController *path = [[PathAnimationViewController alloc] init];
        path.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:path animated:YES];
        
    } else if ([title isEqualToString:@"customLayout"]) {
        CustomColletionViewLayoutViewController *vc = [[CustomColletionViewLayoutViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([title isEqualToString:@"supplementaryCollectionView"]) {
        UICollectionSupplementaryViewController *vc = [[UICollectionSupplementaryViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
