//
//  ArithmeticMainViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/8/8.
//

#import "ArithmeticMainViewController.h"
#import <Masonry/Masonry.h>

@interface ArithmeticModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *viewControllerName;

@end

@implementation ArithmeticModel

@end

@interface ArithmeticMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *models;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ArithmeticMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareData];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)prepareData {
    self.models = [NSMutableArray array];
    ArithmeticModel *model = [[ArithmeticModel alloc] init];
    model.title = @"字符串连续最长子串";
    model.viewControllerName = @"LongestSubStringViewController";
    [self.models addObject:model];
}

-  (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ArithmeticModel *model = [self.models objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ArithmeticModel *model = [self.models objectAtIndex:indexPath.row];
    UIViewController *vc = [[NSClassFromString(model.viewControllerName) alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
