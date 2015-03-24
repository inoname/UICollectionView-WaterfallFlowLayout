//
//  WaterfallFlowLayout.h
//  WaterfallFlow-Demo
//
//  Created by kouliang on 15/3/22.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterfallFlowLayout;

@protocol WaterfallFlowLayoutDelegate <NSObject>
@required
/**
 * 返回indexPath位置cell的高度
 */
- (CGFloat)waterfallFlowLayout:(WaterfallFlowLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath withItemWidth:(CGFloat)width;

@optional
- (CGFloat)rowMarginInWaterfallFlowLayout:(WaterfallFlowLayout *)layout;
- (CGFloat)columnMarginInWaterfallFlowLayout:(WaterfallFlowLayout *)layout;
- (NSUInteger)columnsCountInWaterfallFlowLayout:(WaterfallFlowLayout *)layout;
- (UIEdgeInsets)insetsInWaterfallFlowLayout:(WaterfallFlowLayout *)layout;
@end


@interface WaterfallFlowLayout : UICollectionViewLayout
@property (nonatomic, weak) id<WaterfallFlowLayoutDelegate> delegate;
@end
