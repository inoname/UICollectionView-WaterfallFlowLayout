//
//  ClothesCell.m
//  WaterfallFlow-Demo
//
//  Created by kouliang on 15/3/22.
//  Copyright (c) 2015年 kouliang. All rights reserved.
//

#import "ClothesCell.h"
#import "Clothes.h"
#import "UIImageView+WebCache.h"

@interface ClothesCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end


@implementation ClothesCell

- (void)setClothes:(Clothes *)clothes
{
    _clothes = clothes;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:clothes.img] placeholderImage:[UIImage imageNamed:@"loading"]];
    self.priceLabel.text = clothes.price;
}
@end
