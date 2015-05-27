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
    
    // ボタンを押されたら動画を停止する
    [MPMPlayerController.moviePlayer stop];
    userSignUpViewController *secondVC1 = [[userSignUpViewController alloc] init];
    
    // インスタンス化
    secondVC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"userSignUp"];
    
     [[self navigationController] pushViewController:secondVC1 animated:YES];
    
}



// SignInボタンを押されたら、mainViewControllerに画面遷移
-(void)tapBtn2:(UIButton*)button2{
    
//    //userデータがあるか確認する
//    if (name == nil || country == nil || genre == nil || userImg == nil) {
//        UIAlertView *alert =
//        [[UIAlertView alloc] initWithTitle:@"登録されていません"
//                                   message:@"Sign Up ボタンを押してください"
//                                  delegate:self
//                         cancelButtonTitle:@"OK"
//                         otherButtonTitles:nil];
//        [alert show];
//        
//    } else {
//        
//        //mainViewControllerに画面遷移
//        //ボタンを押されたら動画を停止する
//        [MPMPlayerController.moviePlayer stop];
//        mainViewController *secondVC2 = [[mainViewController alloc] init];
//        
//        //インスタンス化し画面遷移
//        secondVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController"];
//        
//        [[self navigationController] pushViewController:secondVC2 animated:YES];
//    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
