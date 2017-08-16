//
//  KeyChianViewController.m
//  HXYStudyDemo
//
//  Created by tzsoft on 2017/8/16.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "KeyChianViewController.h"
#import "KeyChianWrapper.h"

@interface KeyChianViewController ()

@end

@implementation KeyChianViewController
- (instancetype)init{

    if (self = [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    NSString * const KEY_USERNAME_PASSWORD = @"app.username.password";
    NSString * const KEY_USERNAME = @"app.username";
    NSString * const KEY_PASSWORD = @"app.password";
    
    NSMutableDictionary *userNamePasswordKVPairs = [NSMutableDictionary dictionary];
    [userNamePasswordKVPairs setObject:@"userName：123" forKey:KEY_USERNAME];
    [userNamePasswordKVPairs setObject:@"password：321" forKey:KEY_PASSWORD];
    
    // A、将用户名和密码写入keychain
    [KeyChianWrapper save:KEY_USERNAME_PASSWORD data:userNamePasswordKVPairs];
    // B、从keychain中读取用户名和密码
    NSMutableDictionary *readUsernamePassword = (NSMutableDictionary *)[KeyChianWrapper load:KEY_USERNAME_PASSWORD];
    NSString *userName = [readUsernamePassword objectForKey:KEY_USERNAME];
    NSString *password = [readUsernamePassword objectForKey:KEY_PASSWORD];
    NSLog(@"username = %@", userName);
    NSLog(@"password = %@", password);
    
    // C、将用户名和密码从keychain中删除
    [KeyChianWrapper delete:KEY_USERNAME_PASSWORD];
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

@end
