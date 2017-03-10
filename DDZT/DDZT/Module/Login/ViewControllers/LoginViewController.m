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

@property (nonatomic,strong) KeysModel *model;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    密码 —> sha1 —> rsa —> base64 —> string
    [LoginVM loginWithPhone:@"13632889390" completion:^(BOOL finish, RSAKeyModel *model) {
        if (finish) {
            self.model = model.data;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)encry:(id)sender {
    NSString *sha1 = [RTUtil sha1:self.textF.text];
    NSString *rsa = [RTUtil encrypString:sha1 withPubKey:self.model.publicKey];
    NSString *base64 = [RTUtil base64EncodeString:rsa];
    NSLog(@"text: %@",self.textF.text);
    NSLog(@"sha1: %@",sha1);
    NSLog(@"rsa: %@",rsa);
    NSLog(@"base64: %@",base64);
    self.publabel.text = base64;
}

- (IBAction)decry:(id)sender {

//    self.prilabel.text = [RTUtil decrypString:self.publabel.text withPriKey:RSA_Privite_key /*self.model.privateKey*/];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
