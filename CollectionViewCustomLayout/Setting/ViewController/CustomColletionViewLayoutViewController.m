//
//  CustomColletionViewLayoutViewController.m
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/21.
//

#import "CustomColletionViewLayoutViewController.h"
#import "AFCollectionViewCircleLayout.h"
#import "AFCollectionViewFlowLayout.h"
#import "AFCollectionViewCell.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface CustomColletionViewLayoutViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,AFCollectionViewDelegateCircleLayout>

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, strong) AFCollectionViewCircleLayout *circleLayout;
@property (nonatomic, strong) AFCollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong)
UISegmentedControl *layoutChangeSegmentedControl;


@end

@implementation CustomColletionViewLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cellCount = 10;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self
                                                                                          action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self
                                                                                           action:@selector(deleteItem)];
    self.layoutChangeSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Circle", @"Flow"]];
    self.layoutChangeSegmentedControl.selectedSegmentIndex = 0; self.layoutChangeSegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [self.layoutChangeSegmentedControl addTarget:self action:@selector(layoutChangeSegmentedControlDidChangeValue:)
                                forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.layoutChangeSegmentedControl;
}

- (void)loadView {
    // Create instances of our layouts
    self.circleLayout = [[AFCollectionViewCircleLayout alloc] init];
    self.flowLayout = [[AFCollectionViewFlowLayout alloc] init];
    // Create a new collection view with our flow layout and set // ourself as delegate and data source.
    UICollectionView *collectionView = [[UICollectionView alloc]
    initWithFrame:CGRectZero
    collectionViewLayout:self.circleLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    // Register our classes so we can use our custom subclassed
    // cell and header
    [collectionView registerClass:[AFCollectionViewCell class]
    forCellWithReuseIdentifier:CellIdentifier];
    // Set up the collection view geometry to cover the whole screen
    // in any orientation and other view properties.
    collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
//     Finally, set our collectionView (since we are a collection // view controller, this also sets self.view)
    self.collectionView = collectionView;
}

-(void)layoutChangeSegmentedControlDidChangeValue:(id)sender
{
    // This just swaps the two values
    if (self.collectionView.collectionViewLayout == self.circleLayout) {
        [self.flowLayout invalidateLayout];
        [self.collectionView setCollectionViewLayout:self.flowLayout animated:YES];
    }
    else {
        [self.circleLayout invalidateLayout];
        [self.collectionView setCollectionViewLayout:self.circleLayout animated:YES];
    }
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return self.cellCount;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AFCollectionViewCell *cell = (AFCollectionViewCell *)
    [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setLabelString:[NSString stringWithFormat:@"%ld", indexPath.row]];
    return cell;
}

-(void)addItem {
    [self.collectionView performBatchUpdates:^{
        self.cellCount = self.cellCount + 1;
        [self.collectionView
         insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.cellCount-1 inSection:0]]];
    } completion:nil];
}

-(void)deleteItem {
// Always have at least once cell in our collection view if (self.cellCount == 1) return;
[self.collectionView performBatchUpdates:^{ self.cellCount = self.cellCount - 1; [self.collectionView
deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:self.cellCount inSection:0]]];
} completion:nil];
    
}

-(CGFloat)rotationAngleForSupplmentaryViewInCircleLayout:(AFCollectionViewCircleLayout *)circleLayout
{
    CGFloat timeRatio = 0.0f;
    NSDate *date = [NSDate date];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:date];
    timeRatio = (CGFloat)(components.minute) / 60.0f;
    return (2 * M_PI * timeRatio);
}

@end
