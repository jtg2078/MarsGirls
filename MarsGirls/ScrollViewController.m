//
//  ScrollViewController.m
//  MarsGirls
//
//  Created by jason on 10/15/13.
//  Copyright (c) 2013 jason. All rights reserved.
//

#import "ScrollViewController.h"
#import "ImageViewController.h"

@interface ScrollViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSArray *images;
@end

@implementation ScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - memeory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // -------------------- images --------------------
    
    self.images = @[[UIImage imageNamed:@"1.jpg"],
                    [UIImage imageNamed:@"2.jpg"],
                    [UIImage imageNamed:@"3.jpg"],
                    [UIImage imageNamed:@"4.jpg"],
                    [UIImage imageNamed:@"5.jpg"],
                    [UIImage imageNamed:@"6.jpg"],
                    [UIImage imageNamed:@"7.jpg"],
                    [UIImage imageNamed:@"8.jpg"]];
    
    // -------------------- page view controller --------------------
    
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageVC.dataSource = self;
    self.pageVC.delegate = self;
    
    self.pageVC.view.frame = self.view.bounds;
    self.pageVC.view.backgroundColor = [UIColor blackColor];
    
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC didMoveToParentViewController:self];
    
    // get the first image
    [self.pageVC setViewControllers:@[[self getImageViewController:0]]
                          direction:UIPageViewControllerNavigationDirectionForward
                           animated:NO
                         completion:nil];
}

#pragma mark - UIPageViewControllerDataSource

// create a view controller to show an img
- (UIViewController *)getImageViewController:(int)imageIndex
{
    ImageViewController *ivc = [[ImageViewController alloc] init];
    ivc.image = self.images[imageIndex];
    ivc.imageIndex = imageIndex;
    
    return ivc;
}

// handles showing next img (if exists)
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    ImageViewController *ivc = (ImageViewController *)viewController;
    
    int nextImageIndex = ivc.imageIndex + 1;
    
    if(nextImageIndex >= self.images.count)
        return nil;
    else
        return [self getImageViewController:nextImageIndex];
}

// handles showing previous img (if exists)
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    ImageViewController *ivc = (ImageViewController *)viewController;
    
    int prevImageIndex = ivc.imageIndex - 1;
    
    if(prevImageIndex < 0)
        return nil;
    else
        return [self getImageViewController:prevImageIndex];
}

#pragma mark - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    if(completed)
    {
        
    }
}

@end
