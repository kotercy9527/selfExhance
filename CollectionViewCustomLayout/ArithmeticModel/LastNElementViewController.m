//
//  LastNElementViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/9/16.
// 主要的思路是双指针移动

#import "LastNElementViewController.h"


// 定义链表节点
@interface ListNode : NSObject

@property (nonatomic, assign) int value;
@property (nonatomic, strong) ListNode *next;

- (instancetype)initWithValue:(int)value;

@end

@implementation ListNode

- (instancetype)initWithValue:(int)value {
    self = [super init];
    if (self) {
        _value = value;
        _next = nil;
    }
    return self;
}

@end

// 定义链表
@interface LinkedList : NSObject

@property (nonatomic, strong) ListNode *head;

- (void)append:(int)value;
- (void)printNthFromEnd:(int)n;

@end

@implementation LinkedList

- (void)append:(int)value {
    ListNode *newNode = [[ListNode alloc] initWithValue:value];
    if (!self.head) {
        self.head = newNode;
    } else {
        ListNode *current = self.head;
        while (current.next) {
            current = current.next;
        }
        current.next = newNode;
    }
}

- (void)printNthFromEnd:(int)n {
    if (n <= 0 || !self.head) {
        return;
    }

    ListNode *firstPointer = self.head;
    ListNode *secondPointer = self.head;

    // 移动第一个指针n个节点
    for (int i = 0; i < n; i++) {
        if (firstPointer) {
            firstPointer = firstPointer.next;
        } else {
            return; // 如果链表长度小于n，直接返回
        }
    }

    // 同时移动两个指针，直到第一个指针到达末尾
    while (firstPointer) {
        firstPointer = firstPointer.next;
        secondPointer = secondPointer.next;
    }

    NSLog(@"倒数第%d个元素是: %d", n, secondPointer.value);
}
@end

@interface LastNElementViewController ()

@end

@implementation LastNElementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    LinkedList *myList = [[LinkedList alloc] init];
    [myList append:1];
    [myList append:2];
    [myList append:3];
    [myList append:4];
    [myList append:5];

    int n = 2;
    [myList printNthFromEnd:n];
}

@end
