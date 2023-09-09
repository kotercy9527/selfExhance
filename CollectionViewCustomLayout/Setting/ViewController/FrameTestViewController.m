//
//  FrameTestViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/9/1.
//

#import "FrameTestViewController.h"
#import "FrameTestTableViewCell.h"
#import <Masonry/Masonry.h>


@interface FrameTestViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation FrameTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    self.arr = [NSMutableArray array];
    NSString *baseString = @"";
    NSString *rawString = @"this is a test string";
    
    for (NSInteger i = 0; i < 100; i++) {
         baseString = [baseString stringByAppendingString:rawString];
        [self.arr addObject:baseString];
    }
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.tableView registerClass:[FrameTestTableViewCell class] forCellReuseIdentifier:@"FrameTestTableViewCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FrameTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FrameTestTableViewCell" forIndexPath:indexPath];
    [cell updateContent:[self.arr objectAtIndex:indexPath.row]];
    return cell;
}

@end
