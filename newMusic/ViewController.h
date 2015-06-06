//
//  ViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/04/30.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

// 遷移先を宣言
#import "userSignUpViewController.h"
#import "mainViewController.h"
#import "alertCanselViewController.h"


@interface ViewController : UIViewController < UIAlertViewDelegate >{
    
    UIButton *_mySignUpButton; // SignUpButtonを宣言
    UIButton *_mySignInButton; // SignInButtonを宣言
    bool _is_playing;          // ムービーが再生中である事を示す
    
    // データベースに接続で使用
    NSString *nowTagStr;
    NSString *txtBuffer;       // xml解析で使用
    NSMutableArray *userArr;   // ユーザ名を格納する配列
    NSInteger xml_index;       // xmlの数を入れる数値
    NSURLConnection *conect;   // 通信コネクト
    NSMutableData *data;       // 受信データ
    UIView *uv_load;           // LoadingView(通信中にぐるぐる回るやつ)
    NSArray *_array;
    
    UIAlertView *_alert;
    NSString *second;
    
}
// リピート再生するか
@property (nonatomic,assign) BOOL repeat;


@end

