//
//  ViewController.m
//  UIAlertController的使用
//
//  Created by 向伟 on 15/10/27.
//  Copyright © 2015年 WeiXiang. All rights reserved.
// 添加到Github上

#import "ViewController.h"

@interface ViewController ()
- (IBAction)btnclick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnclick:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"天气转凉，请预防感冒，勤加衣服" preferredStyle:UIAlertControllerStyleAlert];
    //添加文本框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder = @"login";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"password";
        textField.secureTextEntry = YES;
    }];
    
    //按钮的方法
    /*
     UIAlertActionStyleDefault = 0, 默认的白色按钮
     UIAlertActionStyleCancel,  取消按钮
     UIAlertActionStyleDestructive  强调 红色按钮
     */
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        UITextField *login = alert.textFields.firstObject;
        UITextField *password = alert.textFields.lastObject;
        NSLog(@"login = %@    password = %@",login.text,password.text);
    }];
    
    //添加观察者
//    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(alertTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
//    }];
    
    
    //移除观察者
//    [action addObserver:self forKeyPath:@"OK" options:NSKeyValueObservingOptionNew context:nil];
//    [action removeObserver:self forKeyPath:@"OK" context:nil];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)alertTextFieldDidChange:(NSNotification *)fication{
    
    UIAlertController *alert = (UIAlertController *)self.presentedViewController;
    if (alert) {
        UITextField *login = alert.textFields.firstObject;
        UITextField *password = alert.textFields.lastObject;
        NSLog(@"login = %@    password = %@",login.text,password.text);
    }
}

@end
