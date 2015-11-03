//
//  ViewController.m
//  UIAlertController的使用
//
//  Created by 向伟 on 15/10/27.
//  Copyright © 2015年 WeiXiang. All rights reserved.
// 添加到Github上

#import "ViewController.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,strong)UIImagePickerController *imagepicker;

@property(nonatomic,strong)UIImageView *imageView;
- (IBAction)btnclick:(id)sender;
- (IBAction)sheetclick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, self.view.frame.size.height/2)];
    [self.view addSubview:_imageView];
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

- (IBAction)sheetclick:(id)sender {
    
    //初始化一个图片控制器
    _imagepicker = [[UIImagePickerController alloc]init];
    
    //添加下拉列表
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //添加拍照按钮
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        _imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagepicker.delegate = self;
        _imagepicker.allowsEditing = YES;//设置图片可编辑
        [self presentViewController:_imagepicker animated:YES completion:nil];
        
    }];
    //添加进入系统相册按钮
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        _imagepicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _imagepicker.delegate = self;
        _imagepicker.allowsEditing = YES;//设置图片可编辑
        [self presentViewController:_imagepicker animated:YES completion:nil];
        
        
    }];
    //添加取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    //将按钮加入下拉列表
    [alertController addAction:cameraAction];
    [alertController addAction:albumAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//选取图片的方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[picker parentViewController]dismissViewControllerAnimated:YES completion:^{
        //
    }];
//    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    //找到选中的修改后那张照片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    _imageView.image = image;
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
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
