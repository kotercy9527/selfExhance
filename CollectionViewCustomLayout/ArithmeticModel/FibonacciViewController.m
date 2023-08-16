//
//  FibonacciViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/8/16.
//

#import "FibonacciViewController.h"

@interface FibonacciViewController ()

@end

@implementation FibonacciViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%ld",[self fibnacciAtIndex:5]);
}

- (NSInteger)fibnacciAtIndex:(NSInteger)index {
    if (index < 0 || index > 100) {
        return 0;
    }
    
    
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger pre = 0;
    NSInteger ppre = 0;
    for (NSInteger i = 0; i < index; i++) {
        if (i == 0) {
            pre = 1;
        } else {
            NSInteger tmp = pre;
            pre = pre + ppre;
            ppre = tmp;
        }
        NSLog(@"当前是第%ld项，pre-:%ld-ppre:%ld",i,pre,ppre);
    }
    return pre + ppre;
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
