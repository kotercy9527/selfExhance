//
//  LongestSubStringViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/8/8.
//

#import "LongestSubStringViewController.h"
#import <Masonry/Masonry.h>

@interface LongestSubStringViewController ()

@property (nonatomic, strong) UITextField *textfield;
@property (nonatomic, strong) UILabel *label;

@end

@implementation LongestSubStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textfield = [[UITextField alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.textfield];
    [self.textfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
    }];
    self.textfield.text = @"qwertyuiopqwer123sdfjaskdfjinsdmn jhdfjksdhfksdfklsdfjl";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label = label;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textfield.mas_bottom).offset(10);
        make.left.equalTo(self.textfield);
        make.centerX.equalTo(self.textfield);
        make.height.greaterThanOrEqualTo(@40);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"generate" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked_Generate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        
    }];
}

- (void)buttonClicked_Generate {
    NSString *raw = self.textfield.text;
    NSString *subString = [self rawString:raw];
    self.label.text = subString;
}


- (NSString *)rawString:(NSString *)str {
    
    NSString *rt = @"";
    for (NSInteger i = 0; i < str.length; i++) {
        NSInteger extenal = str.length - i;
        for (NSInteger j = 1; j <= extenal; j++) {
            NSString *subString = [str substringWithRange:NSMakeRange(i, j)];
            if ([self stringMeetCondition:subString]) {
                if (subString.length > rt.length) {
                    rt = subString;
                }
            } else {
                
            }
        }
    }
    
    return rt;
}

- (BOOL)stringMeetCondition:(NSString *)rawString {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i = 0; i< rawString.length; i++) {
        [arr addObject:[rawString substringWithRange:NSMakeRange(i, 1)]];
    }
    NSSet *set = [NSSet setWithArray:arr];
    if (set.count == rawString.length) {
        return YES;
    }
    return NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
