//
//  LoginViewController.m
//  JuKeBao
//
//  Created by loohcs on 14-1-22.
//  Copyright (c) 2014年 loohcs. All rights reserved.
//

#import "LoginViewController.h"

#import "SignUpViewController.h"

#import "CustomTabBarViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark -- 主要是一些按钮输入框的初始化，以及一些特定的属性初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.isRememberPassward = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationItem.title = @"欢迎进入海印百货通";
    
//    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    UIImage *bgImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"]];
//    _imageView.image = bgImage;
//    [self.view addSubview:_imageView];

    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"]]];
    
//    self.size = [GetScreenSize getScreenSize:self.interfaceOrientation];
    
//    _helper=[[ServiceHelper alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"default userID = %@", [defaults objectForKey:@"userID"]);
    NSLog(@"default passward = %@", [defaults objectForKey:@"passward"]);
    
    //用户名
//    UILabel *nameLable = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 50, 30)];
//    nameLable.font = [UIFont systemFontOfSize:13];
//    nameLable.text = @"用户名:";
//    nameLable.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:nameLable];
    _userNameImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, SCREEN_HEIGHT/2-50, 290, 40)];
    UIImage *nameImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"png"]];
    _userNameImageView.image = nameImage;
    _userNameImageView.userInteractionEnabled = YES;
    
    _nameText = [[UITextField alloc] initWithFrame:CGRectMake(60, 5, 200, 30)];
    _nameText.font = [UIFont systemFontOfSize:13];
    _nameText.placeholder = @"请输入用户名";
    _nameText.delegate = self;
    _nameText.userInteractionEnabled = YES;
    [_userNameImageView addSubview:_nameText];
    
    [self.view addSubview:_userNameImageView];

    //密码
//    UILabel *passwardLable = [[UILabel alloc] initWithFrame:CGRectMake(60, 160, 50, 30)];
//    passwardLable.font = [UIFont systemFontOfSize:13];
//    passwardLable.text = @"密  码:";
//    passwardLable.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:passwardLable];
    
    _passwordImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, SCREEN_HEIGHT/2, 290, 40)];
    UIImage *passwordImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"password" ofType:@"png"]];
    _passwordImageView.image = passwordImage;
    _passwordImageView.userInteractionEnabled = YES;
    
    _passwardText = [[UITextField alloc] initWithFrame:CGRectMake(60, 5, 200, 30)];
    _passwardText.font = [UIFont systemFontOfSize:13];
    _passwardText.placeholder = @"请输入您的密码";
    _passwardText.secureTextEntry = YES;
    _passwardText.delegate = self;
    _passwardText.userInteractionEnabled = YES;
    [_passwordImageView addSubview:_passwardText];
    [self.view addSubview:_passwordImageView];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _loginBtn.frame = CGRectMake(15, SCREEN_HEIGHT/2+50, 290, 40);
    //[_loginBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logIn" ofType:@"png"]]forState:UIControlStateNormal];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    
    _registePassword = [[UIImageView alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT/2+100, 30, 30)];
    if ([[defaults objectForKey:@"isRememberPassward"] isEqualToString:@"YES"]) {
        _registePassword.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"select" ofType:@"png"]];
        _passwardText.text = [defaults objectForKey:@"passward"];
        _nameText.text = [defaults objectForKey:@"userID"];
        _isRememberPassward = YES;
    }
    else
    {
        _registePassword.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"disSelect" ofType:@"png"]];
    }
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(registerBtnAction)];
    [_registePassword addGestureRecognizer:tapGR];
    _registePassword.userInteractionEnabled = YES;
    [self.view addSubview:_registePassword];
    
    _registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _registerBtn.frame = CGRectMake(60, SCREEN_HEIGHT/2+100, 80, 30);
    [_registerBtn setTitle:@"记住密码" forState:UIControlStateNormal];
    [_registerBtn addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    if ([[defaults objectForKey:@"isAutoLogIn"] isEqualToString:@"YES"]) {
////        _registerBtn.backgroundColor = [UIColor cyanColor];
//        _passwardText.text = [defaults objectForKey:@"passward"];
//        _nameText.text = [defaults objectForKey:@"userID"];
//        _isAutoLogIn = YES;
//    }
    [self.view addSubview:_registerBtn];
    
    _autoLogIn = [[UIImageView alloc] initWithFrame:CGRectMake(160, SCREEN_HEIGHT/2+100, 30, 30)];
    if ([[defaults objectForKey:@"isAutoLogIn"] isEqualToString:@"YES"]) {
        _autoLogIn.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"select" ofType:@"png"]];
    }
    else
    {
        _autoLogIn.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"disSelect" ofType:@"png"]];
    }
    UITapGestureRecognizer *tapGR2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(autoLogInAction)];
    [_autoLogIn addGestureRecognizer:tapGR2];
    _autoLogIn.userInteractionEnabled = YES;
    [self.view addSubview:_autoLogIn];
    
    _autoLogBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _autoLogBtn.frame = CGRectMake(190, SCREEN_HEIGHT/2+100, 80, 30);
    [_autoLogBtn setTitle:@"自动登录" forState:UIControlStateNormal];
    [_autoLogBtn addTarget:self action:@selector(autoLogInAction) forControlEvents:UIControlEventTouchUpInside];
    if ([[defaults objectForKey:@"isAutoLogIn"] isEqualToString:@"YES"]) {
        
    }
    [self.view addSubview:_autoLogBtn];

    _forgetPassword = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _forgetPassword.frame = CGRectMake(60, SCREEN_HEIGHT/2+150, 90, 40);
    //[_loginBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logIn" ofType:@"png"]]forState:UIControlStateNormal];
    [_forgetPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
    [_forgetPassword addTarget:self action:@selector(forgetPasswordBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_forgetPassword];
    
    
    _signUpBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _signUpBtn.frame = CGRectMake(180, SCREEN_HEIGHT/2+150, 90, 40);
    //[_loginBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logIn" ofType:@"png"]]forState:UIControlStateNormal];
    [_signUpBtn setTitle:@"注册" forState:UIControlStateNormal];
    [_signUpBtn addTarget:self action:@selector(signUpBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_signUpBtn];
    
}


#pragma mark -- 屏幕中一些按钮的响应动作
//点击输入框，弹出键盘，同时将用户名，密码输入框上移
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _userNameImageView.frame = CGRectMake(15, SCREEN_HEIGHT/2-130, 290, 40);
    _passwordImageView.frame = CGRectMake(15, SCREEN_HEIGHT/2-80, 290, 40);
    _loginBtn.frame = CGRectMake(15, SCREEN_HEIGHT/2-30, 290, 40);
    _registerBtn.frame = CGRectMake(60, SCREEN_HEIGHT/2+20, 80, 30);
    _registePassword.frame = CGRectMake(30, SCREEN_HEIGHT/2+20, 30, 30);
    _autoLogBtn.frame = CGRectMake(190, SCREEN_HEIGHT/2+20, 80, 30);
    _autoLogIn.frame = CGRectMake(160, SCREEN_HEIGHT/2+20, 30, 30);
    
    _imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg2" ofType:@"jpg"]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _userNameImageView.frame = CGRectMake(15, SCREEN_HEIGHT/2, 290, 40);
    _passwordImageView.frame = CGRectMake(15, SCREEN_HEIGHT/2+50, 290, 40);
    _loginBtn.frame = CGRectMake(15, SCREEN_HEIGHT/2+100, 290, 40);
    _registerBtn.frame = CGRectMake(60, SCREEN_HEIGHT/2+150, 80, 30);
    _registePassword.frame = CGRectMake(30, SCREEN_HEIGHT/2+150, 30, 30);
    _autoLogBtn.frame = CGRectMake(190, SCREEN_HEIGHT/2+150, 80, 30);
    _autoLogIn.frame = CGRectMake(160, SCREEN_HEIGHT/2+150, 30, 30);
    
    _imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bg" ofType:@"png"]];
}

//点击空白处回收键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    [super touchesBegan:touches withEvent:event];
    [_nameText resignFirstResponder];
    [_passwardText resignFirstResponder];
}

//点击回车键回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)loginBtnAction
{
    NSLog(@"登陆！！！");
    [_nameText resignFirstResponder];
    [_passwardText resignFirstResponder];
    
    _userName = _nameText.text;
    _passWard = _passwardText.text;
    
    
    //将用户名和密码以参数的形式传到服务器端，在服务器端监测是否是合法的用户名以及密码，合法返回字符串@“YES”，非法@“NO”
    //???: 在将用户名以及密码传送到服务器端时，是否应该加密？
    //如何进行加密，服务器端如何解密，这个是后期工作，现在以明文的方式传输
    
//    if ([_userName isEqualToString:@"ehighsun"] && [_passWard isEqualToString:@"000861"]) {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:@"Bk09QYM4tqPP" forKey:@"primaryUserKey"];
//        //TODO: 验证用户名与密码，如果成功则请求基础数据，否则提示输入错误
//        if (self.isRememberPassward == YES) {
//            //TODO: 进入记住密码状态，则需要将用户名与密码记录在本地数据中，方便下次登录
//            
//            if ([[defaults objectForKey:@"isRememberPassward"] isEqualToString:@"YES"]) {
//                [defaults setObject:_nameText.text forKey:@"userID"];
//                [defaults setObject:_passwardText.text forKey:@"passward"];
//                //[defaults setObject:@"Bk09QYM4tqPP" forKey:@"primaryUserKey"];
//            }
//            
//        }
//    }
//    
//    else
//    {
//        UIAlertView *failAlertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"您的用户名或密码输入错误，请检查之后重新登入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        [failAlertView show];
//        failAlertView.tag = 200;
//    }
    
//    NSMutableArray *params = [[NSMutableArray alloc] init];
//    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"skycount40",@"dbName", nil];
//    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"count_data",@"DataSourceTable", nil];
//    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"16",@"ShopIds", nil];
//    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"16003084611",@"CamIds", nil];
//    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"08:00",@"beginTime", nil];
//    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:@"23:59",@"endTime", nil];
//    NSDictionary *dic7 = [NSDictionary dictionaryWithObjectsAndKeys:@"2014-4-23",@"beginDate", nil];
//    NSDictionary *dic8 = [NSDictionary dictionaryWithObjectsAndKeys:@"2014-4-23",@"endDate", nil];
//    
//    [params addObject:dic1];
//    [params addObject:dic2];
//    [params addObject:dic3];
//    [params addObject:dic4];
//    [params addObject:dic5];
//    [params addObject:dic6];
//    [params addObject:dic7];
//    [params addObject:dic8];
//    
//    ServiceArgs *args=[[ServiceArgs alloc] initWithWebServiceName:@"haiYinGetDataApi" andServiceNameSpace:DefaultWebServiceNamespace andMethod:@"GetShopInFlowByHour" andParams:params];
//    NSLog(@"%@", args.soapMessage);
//    ServiceResult *result=[ServiceHelper syncService:args];
//    NSLog(@"同步请求xml=%@\n",result);
//    NSLog(@"----------同步请求xml=%@\n",result.xmlString);
//    NSArray *arr=[result.xmlParse soapXmlSelectNodes:@"//Rows"];
//    NSLog(@"解析xml结果=%@\n",arr);
    
//    SetingViewController *setVC = [[SetingViewController alloc] init];
//    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:setVC];
//    [self presentViewController:navi animated:YES completion:^{
//        
//    }];
    
    CustomTabBarViewController *customTabBarVC = [[CustomTabBarViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:customTabBarVC];
    [self presentViewController:navi animated:YES completion:^{
        
    }];
    
}

- (BOOL)isLogInDBWith:(NSString *)userID andPassword:(NSString *)password
{
    NSMutableArray *params = [[NSMutableArray alloc] init];
    
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:userID,@"userID", nil]];
    [params addObject:[NSDictionary dictionaryWithObjectsAndKeys:password,@"passWard", nil]];

    return YES;
}

- (BOOL)forgetPasswordBtnAction
{
    SignUpViewController *signUpVC = [[SignUpViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:signUpVC];
    [self presentViewController:navi animated:YES completion:^{
        
    }];
    
    return YES;
}

- (BOOL)signUpBtnAction
{
    SignUpViewController *signUpVC = [[SignUpViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:signUpVC];
    [self presentViewController:navi animated:YES completion:^{
        
    }];
    
    return YES;
}

#pragma mark -- alertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.title isEqualToString:@"登录成功"]) {
        
    }
}

- (void)registerBtnAction
{
    //通过isRemberPassward来判断是否需要记住密码
    //如果已经是记住密码了，点击时取消记住密码状态
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (_isRememberPassward) {
        _registePassword.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"disSelect" ofType:@"png"]];
        _isRememberPassward = NO;
        [defaults setObject:@"NO" forKey:@"isRememberPassward"];
    }
    //如果不是记住密码，则点击时进入记住密码状态
    else
    {
        //TODO: 进入记住密码状态，则需要将用户名与密码记录在本地数据中，方便下次登录
        
        [defaults setObject:@"YES" forKey:@"isRememberPassward"];
        _registePassword.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"select" ofType:@"png"]];
        _isRememberPassward = YES;
    }
    
}

- (void)autoLogInAction
{
    //通过isAutoLog来判断是否需要自动登录
    //如果已经是自动登录了，点击时取消自动登录状态
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (_isAutoLogIn) {
        _autoLogIn.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"disSelect" ofType:@"png"]];
        _isAutoLogIn = NO;
        [defaults setObject:@"NO" forKey:@"isAutoLogIn"];
    }
    //如果不是自动登录了，点击时启动自动登录状态
    else
    {
        //TODO: 进入自动登录了
        
        [defaults setObject:@"YES" forKey:@"isAutoLogIn"];
        _autoLogIn.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"select" ofType:@"png"]];
        _isAutoLogIn = YES;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//TODO: 响应屏幕旋转
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}



@end
