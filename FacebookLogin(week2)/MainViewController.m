//
//  MainViewController.m
//  FacebookLogin(week2)
//
//  Created by taabi on 6/28/14.
//  Copyright (c) 2014 taabi. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *formView;
- (IBAction)EditChanged:(id)sender;
- (IBAction)onEdit:(id)sender;
- (IBAction)LoginAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
-(void) moveForm;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
-(void) checkText;
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
    if([self.emailField.text isEqual: loginID] && [self.passwordField.text isEqual:loginPassword]){
        
        NSLog(@"PERFECT");
    
    }else{
        NSLog(@"Bad Login");
    }
    
}

-(void) moveForm{
    NSLog(@"runnnn");
    if( checkMove == FALSE){
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.15];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
     self.formView.frame = CGRectMake(self.formView.frame.origin.x,self.formView.frame.origin.y - 50, self.formView.frame.size.width, self.formView.frame.size.height);
    
    self.logoView.frame = CGRectMake(self.logoView.frame.origin.x,self.logoView.frame.origin.y - 20, self.logoView.frame.size.width, self.logoView.frame.size.height);
    
     self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x,self.loginButton.frame.origin.y - 50, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
    
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

@end
