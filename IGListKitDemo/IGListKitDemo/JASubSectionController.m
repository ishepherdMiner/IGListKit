//
//  JASubSectionController.m
//  IGListKitDemo
//
//  Created by Jason on 14/02/2017.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "JASubSectionController.h"

@interface JASubSectionController ()

@property (nonatomic,copy) NSString *object;

@end

@implementation JASubSectionController

- (NSInteger)numberOfItems {
    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell = [self.collectionContext dequeueReusableCellOfClass:[UICollectionViewCell class]forSectionController:self atIndex:index];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (void)didUpdateToObject:(id)object {
    
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    
}

@end
