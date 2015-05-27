//
//  ViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/04/30.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController < UIAlertViewDelegate >{
    
    UIButton *_mySignUpButton; // SignUpButtonを宣言
    UIButton *_mySignInButton; // SignInButtonを宣言
    bool _is_playing;          // ムービーが再生中である事を示す
}
// リピート再生するか
@property (nonatomic,assign) BOOL repeat;


@end

