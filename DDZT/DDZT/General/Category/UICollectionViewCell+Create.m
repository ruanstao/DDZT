//
//  UICollectionViewCell+Create.m
//  JJSOA
//
//  Created by ruanstao on 2017/1/5.
//  Copyright © 2017年 JJSHome. All rights reserved.
//

#import "UICollectionViewCell+Create.h"

@implementation UICollectionViewCell (Create)

+ (instancetype)cellForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    NSString *identify = NSStringFromClass(self.class);
    [collectionView registerNib:[UINib nibWithNibName:identify bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:identify];
    
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    if (nil == cell) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    }
    return cell;
}

@end
