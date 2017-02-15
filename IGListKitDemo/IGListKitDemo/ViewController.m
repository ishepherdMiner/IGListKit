//
//  ViewController.m
//  IGListKitDemo
//
//  Created by Jason on 14/02/2017.
//  Copyright © 2017 Jason. All rights reserved.
//

#import "ViewController.h"
#import "JASubSectionController.h"

@interface ViewController () <IGListAdapterDataSource>

@property (nonatomic,strong) JASubSectionController *sectionController;
@property (nonatomic,strong) IGListAdapter *adapter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
    IGListCollectionView *collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:layout];
    IGListAdapterUpdater *updater = [[IGListAdapterUpdater alloc] init];
    IGListAdapter *adapter = [[IGListAdapter alloc] initWithUpdater:updater viewController:self workingRangeSize:0];
    adapter.collectionView = collectionView;
    adapter.dataSource = self;
    self.adapter = adapter;
    
    collectionView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:collectionView];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return @[@"abc",@"def",@"ghi"];
}

- (IGListSectionController<IGListSectionType> *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [[JASubSectionController alloc] init];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
