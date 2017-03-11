//
//  RigisterViewController.m
//  DDZT
//
//  Created by ruanstao on 2017/3/10.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "RigisterViewController.h"
#import "LoginVM.h"
@interface RigisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField *verifcationTextField;

@end

@implementation RigisterViewController

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
- (IBAction)sendVerificationAction:(UIButton *)sender {
    [LoginVM getSMSWithPhone:self.accountTextField.text andType:GetSMSForRigiste completion:^(BOOL finish, RegisteModel *obj) {
        if (finish) {
            self.verifcationTextField.text = obj.data.captcha;
        }
    }];
}
- (IBAction)rigisterAction:(id)sender {
    if (![self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text]) {
        [RTUtil showHudProgeressInView:self.view andWiatString:@"密码不一致" autoHide:YES];
        return;
    }
    [LoginVM registerWithPhone:self.accountTextField.text captchaNumber:self.verifcationTextField.text passWord:self.passwordTextField.text completion:^(BOOL finish, RegisteModel *obj) {
        if (finish) {
            [RTUtil showHudProgeressInView:self.view andWiatString:@"注册成功" autoHide:YES];
//            self.verifcationTextField.text = obj.data.captcha;
        }else{
            if (obj.showType == 1) {
                [RTUtil showHudProgeressInView:self.view andWiatString:obj.errorMsg autoHide:YES];
            }
        }
    }];
}


@end
