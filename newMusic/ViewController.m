//
//  ViewController.m
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/04/30.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "ViewController.h"

// 遷移先を宣言
#import "userSignUpViewController.h"
#import "mainViewController.h"

@interface ViewController () {
    MPMoviePlayerViewController *MPMPlayerController;
}

@end

@implementation ViewController

- (void)splashMoviePlayBackDidFinish:(NSNotification *)notification {
    
    // 動画終了後の画面の色調整
    UIView *fadeView = [[UIView alloc]initWithFrame:self.view.frame];
    fadeView.backgroundColor = [UIColor blackColor];
    fadeView.alpha = 0.0f;
    [self.view addSubview:fadeView];
    
    // Fadeout & remove
    [UIView animateWithDuration:0.5f
                     animations:^{
                         fadeView.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         [fadeView removeFromSuperview];
                         
                         [[NSNotificationCenter defaultCenter] removeObserver:self];
                         [MPMPlayerController.view removeFromSuperview];
                     }];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 動画を表示
    NSURL *filePath = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"IMG_0282" ofType:@"MOV"]];
    
    MPMPlayerController = [[MPMoviePlayerViewController alloc]initWithContentURL:filePath];
    MPMPlayerController.moviePlayer.backgroundView.backgroundColor = [UIColor whiteColor];
    MPMPlayerController.moviePlayer.controlStyle = MPMovieControlStyleNone;
    MPMPlayerController.view.frame = self.view.frame;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(splashMoviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:MPMPlayerController
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:MPMPlayerController.moviePlayer];
    
    // 動画を繰り返し再生
    MPMPlayerController.moviePlayer.repeatMode = MPMovieRepeatModeOne;
    MPMPlayerController.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    [MPMPlayerController.moviePlayer setFullscreen:YES animated:NO];
    
    [self.view addSubview:MPMPlayerController.view];
    
    
    
    // ボタンの位置、操作関数呼び出し
    [self newMyButton];
    
}



// ボタンの配置と操作内容
- (void)newMyButton{
    
    // SignUpButtonとSignInButtonの初期化（位置、大きさを同時に指定）
    _mySignUpButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 500, 80, 20)];
    _mySignInButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 500, 80, 20)];
    
    // ボタンに表示される文字を設定。UIControlStateNormalはノーマルのボタンの形を指定
    [_mySignUpButton setTitle:@"Sign Up" forState: UIControlStateNormal];
    [_mySignInButton setTitle:@"Sign In" forState: UIControlStateNormal];
    
    // ボタンの表示文字色（透明度）を設定  []の中で細かく色の指定する
    [_mySignUpButton setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:1] forState:UIControlStateNormal];
    [_mySignInButton setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:1] forState:UIControlStateNormal];
    
    // ボタンがタップされた時に、tapBtn:メソッドを発動する
    [_mySignUpButton addTarget:self action:@selector(tapBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [_mySignInButton addTarget:self action:@selector(tapBtn2:) forControlEvents:UIControlEventTouchUpInside];
    
    // 画面上にボタンを追加（設置）
    [self.view addSubview:_mySignUpButton];
    [self.view addSubview:_mySignInButton];
    
}



// SignUpボタンを押されたら、userSignUpViewControllerに画面遷移
-(void)tapBtn1:(UIButton*)button1{
    
    // iPhoneのデータを呼び出す
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // userの名前取得
    NSString *defaultName = [userDefaults stringForKey:@"keyName"];
    NSLog(@"%@", defaultName);
    
    // userのパスワード取得
    NSString *password = [userDefaults stringForKey:@"keyPass"];
    NSLog(@"%@", password);
    
    
    
    //アカウンントを持っている場合
    if ([defaultName  isEqual: defaultName] && [password  isEqual: password]) {
        
        // アラート表示
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"登録されています"
                                   message:@""
                                  delegate:self
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        [alert show];
        
        
        
        // mainViewControllerに画面遷移
        // 動画を停止する
        [MPMPlayerController.moviePlayer stop];
        mainViewController *secondVC2 = [[mainViewController alloc] init];
        
        // インスタンス化し画面遷移
        secondVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController"];
        
        [[self navigationController] pushViewController:secondVC2 animated:YES];
        
        return;
        
    }
    
    // 動画を停止する
    [MPMPlayerController.moviePlayer stop];
    userSignUpViewController *secondVC1 = [[userSignUpViewController alloc] init];
    
    // インスタンス化し画面遷移
    secondVC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"userSignUp"];
    
     [[self navigationController] pushViewController:secondVC1 animated:YES];
    
}



// SignInボタンを押されたら、mainViewControllerに画面遷移
-(void)tapBtn2:(UIButton*)button2{
    
    // 初期化
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init];
    
    
    
    // Loadingを表示するView(通信中にぐるぐる回るやつ)
    //[self LoadingView];
    
    
    
    // iPhoneのデータを呼び出す
    userDefaults = [NSUserDefaults standardUserDefaults];
    
    // userの名前取得
    NSString *defaultName = [userDefaults stringForKey:@"keyName"];
    NSLog(@"%@", defaultName);
    
    // userのパスワード取得
    NSString *password = [userDefaults stringForKey:@"keyPass"];
    NSLog(@"%@", password);
    
    
    
    // userデータがあるか確認
    if ([defaultName  isEqual: @""] && [password  isEqual: @""]) {
        
        // 登録されていない場合
        // アラート表示
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"登録されていません"
                                   message:@""
                                  delegate:self
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil];
        [alert show];
        
        
        
        // 動画を停止する
        [MPMPlayerController.moviePlayer stop];
        userSignUpViewController *secondVC1 = [[userSignUpViewController alloc] init];
        
        // インスタンス化し画面遷移
        secondVC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"userSignUp"];
        
        [[self navigationController] pushViewController:secondVC1 animated:YES];
        
        return;
        
    } else {
        
        // エンコード
        defaultName = [defaultName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        password = [password stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    }
    
    
    
    // phpにアクセス
    NSString *userConfirmation = [NSString stringWithFormat:@"http://192.168.33.200/GC5Team/newMusicOnlyServer/Check.php?name=%@&password=%@",defaultName,password];
    
    // リクエストを生成
    NSMutableURLRequest *phpRequest;
    phpRequest = [[NSMutableURLRequest alloc] init];
    [phpRequest setHTTPMethod:@"POST"];
    [phpRequest setURL:[NSURL URLWithString:userConfirmation]];
    [phpRequest setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [phpRequest setTimeoutInterval:30];
    [phpRequest setHTTPShouldHandleCookies:FALSE];
    [phpRequest setHTTPBody:[userConfirmation dataUsingEncoding:NSUTF8StringEncoding]];
    
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:phpRequest returningResponse:nil error:nil];
    
    // JSONをパース
    NSDictionary *userData = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    
    
    // NSLogで表示
    NSLog(@"username:%@ pass:%@",[userData valueForKeyPath:@"name"],[userData valueForKeyPath:@"password"]);
    
    
        
        // mainViewControllerに画面遷移
        // 動画を停止する
        [MPMPlayerController.moviePlayer stop];
        mainViewController *secondVC2 = [[mainViewController alloc] init];
        
        // インスタンス化し画面遷移
        secondVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController"];
        
        [[self navigationController] pushViewController:secondVC2 animated:YES];
    
    
    // userDefaultsインスタンス化と初期化
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
}



// Loadingを表示するView(通信中にぐるぐる回るやつ) 設定
- (void)LoadingView {
    
    UIScreen *sc = [UIScreen mainScreen];
    uv_load = [[UIView alloc] initWithFrame:CGRectMake(0,0,sc.applicationFrame.size.width, sc.applicationFrame.size.height)];
    uv_load.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.7];
    
    // ぐるぐる回る
    UIActivityIndicatorView *aci_loading;
    aci_loading = [[UIActivityIndicatorView alloc] init];
    aci_loading.frame = CGRectMake(0,0,sc.applicationFrame.size.width, sc.applicationFrame.size.height);
    aci_loading.center = uv_load.center;
    aci_loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [aci_loading startAnimating];
    
    // Loading表示
    [uv_load addSubview:aci_loading];
    [self.view addSubview:uv_load];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
