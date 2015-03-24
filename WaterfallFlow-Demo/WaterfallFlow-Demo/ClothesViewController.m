//
//  ClothesViewController.m
//  WaterfallFlow-Demo
//
//  Created by kouliang on 15/3/22.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "ClothesViewController.h"
#import "Clothes.h"
#import "ClothesCell.h"
#import "MJExtension.h"

#import "WaterfallFlowLayout.h"


@interface ClothesViewController ()<WaterfallFlowLayoutDelegate>
@property (nonatomic, strong) NSArray *clothesArray;
@end



@implementation ClothesViewController

-(NSArray *)clothesArray{
    if (!_clothesArray) {
        _clothesArray = [NSArray array];
        _clothesArray = [Clothes objectArrayWithFilename:@"clothes.plist"];
    }
    return _clothesArray;
}

static NSString * const reuseIdentifier = @"clothes";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WaterfallFlowLayout *layout = [[WaterfallFlowLayout alloc]init];
    layout.delegate = self;
    
    //切换布局
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor = [UIColor orangeColor];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.clothesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ClothesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.clothes = self.clothesArray[indexPath.item];
    
    return cell;
}


#pragma mark - WaterfallFlowLayoutDelegate

-(CGFloat)waterfallFlowLayout:(WaterfallFlowLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath withItemWidth:(CGFloat)width{
    Clothes *clothes = self.clothesArray[indexPath.item];
    return clothes.h * width / clothes.w;
}



- (CGFloat)rowMarginInWaterfallFlowLayout:(WaterfallFlowLayout *)layout{
    return 5;
}
- (CGFloat)columnMarginInWaterfallFlowLayout:(WaterfallFlowLayout *)layout{
    return 5;
}
- (NSUInteger)columnsCountInWaterfallFlowLayout:(WaterfallFlowLayout *)layout{
    return 2;
}

//- (UIEdgeInsets)insetsInWaterfallFlowLayout:(WaterfallFlowLayout *)layout{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}
@end
