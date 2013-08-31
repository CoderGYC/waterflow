//
//  ViewController.h
//  pubuliu
//
//  Created by Hilen on 7/13/13.
//  Copyright (c) 2013 KZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionView.h"
@interface ViewController : UIViewController<UIScrollViewDelegate,PSCollectionViewDataSource,PSCollectionViewDelegate>{
    int type;
}

@property (strong,nonatomic) PSCollectionView *collectionView;

- (IBAction)switchType1:(id)sender;
- (IBAction)switchType2:(id)sender;
@end
