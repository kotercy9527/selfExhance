//
//  SettingViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/14.
//

#import "SettingViewController.h"
#import "SubChooseView.h"
#import <Masonry/Masonry.h>

@interface SettingViewController ()<SubChooseViewDataSources, SubChooseViewDelegate>

@property (nonatomic, strong)SubChooseView *chooseView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSString *currentTitle;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArray = @[@"2010",@"2011",@"2012", @"2013",@"2014",@"2015",@"2016",@"2017",@"2018",@"2019",@"2020"];
    self.currentTitle = [self.titleArray objectAtIndex:1];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Setting";
//    self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.chooseView = [[SubChooseView alloc] initWithFrame:CGRectZero];
    self.chooseView.backgroundColor = [UIColor redColor];
    self.chooseView.delegate = self;
    self.chooseView.dataSources = self;
    [self.view addSubview:self.chooseView];
    [self.chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.equalTo(@40);
        make.top.equalTo(self.view).offset(200);
    }];
}

- (NSInteger)numberOfSectionsInChooseView:(SubChooseView *)chooseView {
    return 1;
}

- (NSInteger)chooseView:(SubChooseView *)chooseView numberOfItemsInSection:(NSInteger)section {
    return self.titleArray.count;
}



- (BOOL)chooseView:(SubChooseView *)chooseView needHighlightInIndexpath:(NSIndexPath *)indexPath {
    NSString *title = [self.titleArray objectAtIndex:indexPath.row];
    return [title isEqual:self.currentTitle];
}

-(void)chooseView:(SubChooseView *)chooseView didSelectAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = [self.titleArray objectAtIndex:indexPath.row];
    if ([title isEqualToString:self.currentTitle]) {
        return;
    }
    self.currentTitle = title;
    [chooseView reloadData];
    
}

- (NSString *)chooseView:(SubChooseView *)chooseView titleInIndexpath:(NSIndexPath *)indexPath {
    return [self.titleArray objectAtIndex:indexPath.row];
}
@end
