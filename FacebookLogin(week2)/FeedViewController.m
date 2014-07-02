//
//  FeedViewController.m
//  FacebookLogin(week2)
//
//  Created by taabi on 6/29/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "FeedViewController.h"



@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *feedView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@property (weak, nonatomic) IBOutlet UIImageView *feedImage;

- (void) onLeftButton;

- (void) onRightButton;
- (void) showfeed;



@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.feedImage.frame = CGRectMake(self.feedImage.frame.origin.x,self.feedImage.frame.origin.y +500, self.feedImage.frame.size.width, self.feedImage.frame.size.height);
    
    self.navigationItem.title = @"News Feed";
    // Do any additional setup after loading the view from its nib.
    
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"more_tab_img"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.feedView.contentSize = CGSizeMake(320, 765);
    
    [self.loader startAnimating];
    [self performSelector:@selector(showfeed) withObject:nil afterDelay:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onLeftButton{
    
}

- (void) onRightButton{
    
}
-(void) showfeed{
    NSLog(@"show feed");
    [self.loader stopAnimating];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.50];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    self.feedImage.frame = CGRectMake(self.feedImage.frame.origin.x,self.feedImage.frame.origin.y -500, self.feedImage.frame.size.width, self.feedImage.frame.size.height);

    
    [UIView commitAnimations];

    
}

@end
