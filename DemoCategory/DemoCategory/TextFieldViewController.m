//
//  TextFieldViewController.m
//  DemoCategory
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController () <UITextFieldDelegate>

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItemTitle = @"UITextField/UITextView";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(endClick)];
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)setUI
{
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(10.0, 10.0, self.view.width - 10.0 * 2, 40.0)];
    [self.view addSubview:textfield];
    [textfield layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield viewModeType:TextFieldViewModeTypeLeft];
    textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield.tag = 1000;
    textfield.delegate = self;
    // 限制输入长度 方法1-属性
//    textfield.limitMaxLength = @(10);
    // 限制输入长度 方法2-通知
//    [NSNotificationCenter receiveNotificationWithName:UITextFieldTextDidChangeNotification target:self sel:@selector(textEditChange:)];
    // 限制输入长度 方法3-代理方法中
    textfield.placeholder = @"限制输入：长度";
    
    UIView *currentView = textfield;
    
    UITextField *textfield2 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:textfield2];
    [textfield2 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield2 viewModeType:TextFieldViewModeTypeLeft];
    textfield2.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield2.tag = 2000;
    textfield2.delegate = self;
    textfield2.placeholder = @"限制输入：只能输入手机号码";
    
    currentView = textfield2;
    
    UITextField *textfield3 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:textfield3];
    [textfield3 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield3 viewModeType:TextFieldViewModeTypeLeft];
    textfield3.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield3.tag = 3000;
    textfield3.delegate = self;
    textfield3.placeholder = @"限制输入：输入数字";
    
    currentView = textfield3;
    
    UITextField *textfield4 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:textfield4];
    [textfield4 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield4 viewModeType:TextFieldViewModeTypeLeft];
    textfield4.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield4.tag = 4000;
    textfield4.delegate = self;
    textfield4.placeholder = @"限制输入：第N位限制指定字符";
    
    currentView = textfield4;
    
    UITextField *textfield5 = [[UITextField alloc] initWithFrame:CGRectMake(10.0, (currentView.bottom + 10.0), currentView.width, currentView.height)];
    [self.view addSubview:textfield5];
    [textfield5 layerWithRadius:5.0 borderColor:[UIColor colorRandom] borderWidth:0.5];
    [textfield5 viewModeType:TextFieldViewModeTypeLeft];
    textfield5.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfield5.tag = 5000;
    textfield5.delegate = self;
    textfield5.placeholder = @"限制输入：指定字符";
    // 限制输入指定字符 方法1-属性
    textfield5.limitText = @"1234567890";
    // 限制输入指定字符 方法2-代理方法中
    
}

- (void)endClick
{
    [self.view editingDone];
}

- (void)textEditChange:(NSNotification *)notification
{
    UITextField *textfield = (UITextField *)[self.view viewWithTag:1000];
    // 限制字符
//    [textfield limitTextFieldLength:10];
    // 限制中文
    [textfield limitTextFieldCNLength:10];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 1000)
    {
        // 限制输入长度
        BOOL isResult = [textField limitLength:5 shouldChangeCharactersInRange:range replacementString:string];
        return isResult;
    }
    else if (2000 == textField.tag)
    {
        // 限制只能输入手机号
        BOOL isResult = [textField limitMoblieShouldChangeCharactersInRange:range replacementString:string];
        return isResult;
    }
    else if (3000 == textField.tag)
    {
        // 限制输入数字
        BOOL isResult = [textField limitNumberShouldChangeCharactersInRange:range replacementString:string integer:10 greaterThanZero:YES decimalPoint:YES decimalDigits:2];
        return isResult;
    }
    else if (4000 == textField.tag)
    {
        // 限制第N位不能输入指定字符
        BOOL isResult = [textField limitCharacterShouldChangeCharactersInRange:range replacementString:string limitCharacters:@"1234567890" limitIndex:5];
        return isResult;
    }
    else if (5000 == textField.tag)
    {
        // 限制只能输入指定字符
//        BOOL isResult = [textField limitTextField:string limitStr:@"1234567890" edit:NO];
//        return isResult;
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField editingDone];
    return YES;
}

@end
