//
//  LoginViewController.m
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginVM.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (nonatomic,strong) KeysModel *model;
@end

@implementation LoginViewController

+ (instancetype)createByNibFile{
    
    return [[UIStoryboard storyboardWithName:@"Login" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    密码 —> sha1 —> rsa —> base64 —> string
//    [LoginVM getKeyPairWithPhone:@"13632889390" completion:^(BOOL finish, RSAKeyModel *model) {
//        if (finish) {
//            self.model = model.data;
//        }
//    }];
    NSString *base64 = [RTUtil base64EncodeString:@"I+EQzV3vi+m05Kzxev14962qrvDGZI5lPGkLsl4S/w8bWJ9Jon+/TIbeWuCzqikH/oSNuCG8GToAloaKfFjihJbB7r1xb9WiJhC3UxpDy+lmm3YoMqclbxxJpsgG8GiZlEU+Zi/yQAM51XfRLC0RK/tuV9flEBh/A0xhd2kGySE="];
    NSLog(@"%@",base64);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigationc

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)login:(id)sender {
    [LoginVM loginWithPhone:self.accountTextField.text passWord:self.passwordField.text completion:^(BOOL finish, UserModel *obj) {
        if (finish) {
            [CommonVM loginSuccess];
        }else{
            if (obj.showType == 1) {
                [RTUtil showHudProgeressInView:self.view andWiatString:obj.errorMsg autoHide:YES];
            }
        }
    }];
    
}
- (IBAction)rigister:(id)sender {
    
}

- (IBAction)forgetPwd:(id)sender {
    
}

@end
