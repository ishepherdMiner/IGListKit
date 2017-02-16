/**
 * Copyright (c) 2016-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "IGListCollectionView.h"

@implementation IGListCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        
        UIColor *backgroundAppearanceColor = (UIColor *) [[[self class] appearance] backgroundColor];
        if (!backgroundAppearanceColor) {
            self.backgroundColor = [UIColor whiteColor];
        }
        
        /*
         * iOS10上可用
         * Denotes whether cell and data prefetching are enabled.
        When YES, the collection view requests cells in advance of when they will be displayed, spreading the rendering over multiple layout passes. When NO, the cells are requested as they are needed for display, often with multiple cells being requested in the same render loop. Setting this property to NO also disables data prefetching. The default value of this property is YES.
         * prefetching 预取
         * Google翻译
         * 当为YES时，收集视图会先请求单元格在它们将要显示的时间之前，在多个布局遍历上展开渲染。当否时，请求单元，因为它们是显示所需要的，通常在同一渲染循环中请求多个单元。将此属性设置为NO也会禁用数据预取。此属性的默认值为YES。
         */
        if ([self respondsToSelector:@selector(setPrefetchingEnabled:)]) {
            self.prefetchingEnabled = NO;
        }
        
        self.alwaysBounceVertical = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        if ([self respondsToSelector:@selector(setPrefetchingEnabled:)]) {
            self.prefetchingEnabled = NO;
        }
    }
    return self;
}

- (void)layoutSubviews {
    /**
     UICollectionView will sometimes lay its cells out with an animation. This is especially noticeable on older devices
     while scrolling quickly. The simplest fix is to just disable animations for -layoutSubviews, which is where cells
     and other views inside the UICollectionView are laid out.
     */
    [UIView performWithoutAnimation:^{
        [super layoutSubviews];
    }];
}

@end
