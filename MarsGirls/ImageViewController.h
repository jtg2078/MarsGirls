//
//  ImageViewController.h
//  MarsGirls
//
//  Created by jason on 10/15/13.
//  Copyright (c) 2013 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

@property (assign, nonatomic) NSInteger imageIndex;
@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
