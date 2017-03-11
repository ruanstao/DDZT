//
//  ForgetPwdViewController.m
//  DDZT
//
//  Created by ruanstao on 2017/3/10.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "ForgetPwdViewController.h"
#import "LoginVM.h"

@interface ForgetPwdViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPwdTextField;
@property (strong, nonatomic) IBOutlet UITextField *verifcationTextField;

@end

@implementation ForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)isShowBackButton
{
    return YES;
}
- (IBAction)sendVerificationCode:(id)sender {
    [LoginVM getSMSWithPhone:self.accountTextField.text andType:GetSMSForFindPwd completion:^(BOOL finish, id obj) {
        
    }];
    
}

- (IBAction)changePwd:(id)sender {
    if (![self.passwordTextField.text isEqualToString:self.confirmPwdTextField.text]) {
        [RTUtil showHudProgeressInView:self.view andWiatString:@"密码不一致" autoHide:YES];
        return;
    }

}

@end
