//
//  SubChooseView.h
//  CollectionViewCustomLayout
//
//  Created by zhipeng jiang on 2023/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SubChooseView;

@protocol SubChooseViewDataSources <NSObject>

- (NSInteger)numberOfSectionsInChooseView:(SubChooseView *)chooseView;
- (NSInteger)chooseView:(SubChooseView *)chooseView numberOfItemsInSection:(NSInteger)section;
- (NSString *)chooseView:(SubChooseView *)chooseView titleInIndexpath:(NSIndexPath *)indexPath;
- (BOOL)chooseView:(SubChooseView *)chooseView needHighlightInIndexpath:(NSIndexPath *)indexPath;

@end

@protocol SubChooseViewDelegate <NSObject>

- (void)chooseView:(SubChooseView *)chooseView didSelectAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface SubChooseView : UIView

@property (nonatomic, weak) id <SubChooseViewDataSources>dataSources;
@property (nonatomic, weak) id <SubChooseViewDelegate>delegate;
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
