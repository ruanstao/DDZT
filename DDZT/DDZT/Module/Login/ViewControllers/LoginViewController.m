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
@property (weak, nonatomic) IBOutlet UITextField *acoundTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (nonatomic,strong) KeysModel *model;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    密码 —> sha1 —> rsa —> base64 —> string
    [LoginVM getKeyPairWithPhone:@"13632889390" completion:^(BOOL finish, RSAKeyModel *model) {
        if (finish) {
            self.model = model.data;
        }
    }];
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
- (IBAction)login:(id)sender {
    
}
- (IBAction)rigister:(id)sender {
    
}
- (IBAction)forgetPwd:(id)sender {
    
}

@end
