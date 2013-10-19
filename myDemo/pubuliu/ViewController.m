//
//  ViewController.m
//  pubuliu
//
//  Created by Hilen on 7/13/13.
//  Copyright (c) 2013 KZ. All rights reserved.
//

#import "ViewController.h"
#import "PSCollectionView.h"
#import "MCCollectionViewCell.h"
#import "MyClosetCell.h"

@interface ViewController (){
    NSMutableArray *countArray;
}
@end

@implementation ViewController
//@synthesize waterFLowView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    type = 1;
    self.waterFLowView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 50, 320, 480)];
    self.waterFLowView.delegate = self; // This is for UIScrollViewDelegate
    self.waterFLowView.collectionViewDelegate = self;
    self.waterFLowView.collectionViewDataSource = self;
    self.waterFLowView.backgroundColor = [UIColor clearColor];
    self.waterFLowView.autoresizingMask = ~UIViewAutoresizingNone;
    
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    header.backgroundColor = [UIColor yellowColor];
    self.waterFLowView.headerView = header;
    
    // Specify number of columns for both iPhone and iPad
    self.waterFLowView.numColsPortrait = 2;
    self.waterFLowView.numColsLandscape = 4;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view addSubview:self.waterFLowView];
    
    countArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i<100; i++) {
        [countArray addObject:[NSString stringWithFormat:@"%d",i+100]];
    }
}

- (Class)collectionView:(PSCollectionView *)collectionView cellClassForRowAtIndex:(NSInteger)index {
    if (type == 1) {
        return [MCCollectionViewCell class];
    }else if (type == 2){
        return [MyClosetCell class];
    }
    return nil;
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    NSLog(@"you select number:%d",index);
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return countArray.count;
}

- (UIView *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    NSLog(@"reuse cell");
    NSString *item = [countArray objectAtIndex:index];
    if (type == 1) {
        MCCollectionViewCell *cell = (MCCollectionViewCell *)[self.waterFLowView dequeueReusableViewForClass:[MCCollectionViewCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MCCollectionViewCell" owner:self options:nil];
            cell = (MCCollectionViewCell *)[nib objectAtIndex:0];
        }
        cell.name.text = item;
        [cell collectionView:_waterFLowView fillCellWithObject:item atIndex:index];
        return cell;
    }else if (type == 2){
        MyClosetCell *cell = (MyClosetCell *)[self.waterFLowView dequeueReusableViewForClass:[MyClosetCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyClosetCell" owner:self options:nil];
            cell = (MyClosetCell *)[nib objectAtIndex:0];
        }
        cell.name.text = item;
        [cell collectionView:_waterFLowView fillCellWithObject:item atIndex:index];
        return cell;
    }
    return nil;
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    NSString *item = [countArray objectAtIndex:index];
    if (type == 1) {
        return [MCCollectionViewCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }else if (type == 2){
        return [MyClosetCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    }
    return 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchType1:(id)sender {
    type = 1;
    self.waterFLowView.numColsPortrait = 2;
    [self.waterFLowView reloadData];
}

- (IBAction)switchType2:(id)sender {
    type = 2;
    self.waterFLowView.numColsPortrait = 1;
    [self.waterFLowView reloadData];
}
@end
