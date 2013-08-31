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

@interface ViewController ()
@end

@implementation ViewController
@synthesize collectionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    type = 1;
    self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 50, 320, 480)];
    self.collectionView.delegate = self; // This is for UIScrollViewDelegate
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.autoresizingMask = ~UIViewAutoresizingNone;
    
    // Specify number of columns for both iPhone and iPad
    self.collectionView.numColsPortrait = 2;
    self.collectionView.numColsLandscape = 4;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    [self.view addSubview:self.collectionView];
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
    return 100;
}

- (UIView *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    NSLog(@"see the reuse cell");
    if (type == 1) {
        MCCollectionViewCell *cell = (MCCollectionViewCell *)[self.collectionView dequeueReusableViewForClass:[MCCollectionViewCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MCCollectionViewCell" owner:self options:nil];
            cell = (MCCollectionViewCell *)[nib objectAtIndex:0];
        }
        return cell;
    }else if (type == 2){
        MyClosetCell *cell = (MyClosetCell *)[self.collectionView dequeueReusableViewForClass:[MyClosetCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyClosetCell" owner:self options:nil];
            cell = (MyClosetCell *)[nib objectAtIndex:0];
        }
        return cell;
    }
    return nil;
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    if (type == 1) {
        return 170;
    }else if (type == 2){
        return 90;
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
    self.collectionView.numColsPortrait = 2;
    [self.collectionView reloadData];
}

- (IBAction)switchType2:(id)sender {
    type = 2;
    self.collectionView.numColsPortrait = 1;
    [self.collectionView reloadData];
}
@end
