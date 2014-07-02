//
//  MainViewController.m
//  FacebookLogin(week2)
//
//  Created by taabi on 6/28/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "MainViewController.h"
#import "FeedViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *formView;
- (IBAction)EditChanged:(id)sender;
- (IBAction)onEdit:(id)sender;
- (IBAction)LoginAction:(id)sender;
- (IBAction)onTap:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
-(void) moveForm;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
-(void) checkText;
-(void) closeForm;
-(void) loginCheck;
@end

NSString *loginID = @"tabish";
NSString *loginPassword = @"logmein";
BOOL checkMove = FALSE;

@implementation MainViewController

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
    //white status bar
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can lobe recreated.
}
- (IBAction)EditChanged:(id)sender {
    [self checkText];
}

- (IBAction)onEdit:(id)sender {
    [self moveForm];
    
}

- (IBAction)LoginAction:(id)sender {
    [self.loader startAnimating];
    [self.loginButton setSelected:YES];
    [self.view endEditing:YES];
    [self performSelector:@selector(loginCheck) withObject:nil afterDelay:1];
    
    
}

-(void) loginCheck{
    [self.loader stopAnimating];
    [self.loginButton setSelected:NO];
    if([self.emailField.text isEqual: loginID] && [self.passwordField.text isEqual:loginPassword]){
        
        NSLog(@"PERFECT");
        FeedViewController *fv = [[FeedViewController alloc] init];
        UINavigationController *fvn = [[UINavigationController alloc] initWithRootViewController:fv];
        fvn.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        // making navigation bar transparent PostViewController
        
        [fvn.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        fvn.navigationBar.shadowImage = [UIImage new];
        fvn.navigationBar.translucent = YES;
        
        // setting navbar title style PostViewController
        
        NSDictionary *PostTextAttributes =
        @{
          NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
          NSForegroundColorAttributeName : [UIColor colorWithRed:1 green:1 blue:1 alpha:1],
          };
        
        fvn.navigationBar.titleTextAttributes = PostTextAttributes;

        
        [self presentViewController:fvn animated:YES completion:nil];
        
        
        
        
    }else{
        NSLog(@"Bad Login");
        [self closeForm];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"Invalid Username or Password." delegate:self  cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
        [alertView show];
        
    }

}

- (IBAction)onTap:(id)sender {
    NSLog(@"SUCCESS TAP");
    
    [self.view endEditing:YES];
    [self closeForm];
}

-(void) moveForm{
    
    if( checkMove == FALSE){
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
     self.formView.frame = CGRectMake(self.formView.frame.origin.x,self.formView.frame.origin.y - 50, self.formView.frame.size.width, self.formView.frame.size.height);
    
    self.logoView.frame = CGRectMake(self.logoView.frame.origin.x,self.logoView.frame.origin.y - 20, self.logoView.frame.size.width, self.logoView.frame.size.height);
    
    self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x,self.loginButton.frame.origin.y - 50, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
    
        self.loader.frame = CGRectMake(self.loader.frame.origin.x,self.loader.frame.origin.y - 50, self.loader.frame.size.width, self.loader.frame.size.height);
        
    self.signupButton.frame = CGRectMake(self.signupButton.frame.origin.x,self.signupButton.frame.origin.y - 170, self.signupButton.frame.size.width, self.signupButton.frame.size.height);
    
    [UIView commitAnimations];
        
        
    
    [self checkText];
    checkMove = TRUE;
    
        
    }
   
    
}




-(void) checkText{
    
    if([self.emailField.text  isEqual: @""]){
        self.loginButton.enabled = NO;
    }else{
        self.loginButton.enabled=YES;
    }
}
-(void) closeForm{
    if( checkMove == TRUE){
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.15];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        self.formView.frame = CGRectMake(self.formView.frame.origin.x,self.formView.frame.origin.y + 50, self.formView.frame.size.width, self.formView.frame.size.height);
        
        self.logoView.frame = CGRectMake(self.logoView.frame.origin.x,self.logoView.frame.origin.y + 20, self.logoView.frame.size.width, self.logoView.frame.size.height);
        
        self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x,self.loginButton.frame.origin.y + 50, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
        
        self.signupButton.frame = CGRectMake(self.signupButton.frame.origin.x,self.signupButton.frame.origin.y + 170, self.signupButton.frame.size.width, self.signupButton.frame.size.height);
        
        [UIView commitAnimations];
        
        
        
        [self checkText];
        checkMove = FALSE;
        
        
    }

}

@end
