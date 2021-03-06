//
//  userSignUpViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

// ボタンに枠を付ける
#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"

@interface userSignUpViewController : UIViewController

// 宣言
<UIPageViewControllerDelegate,UIPickerViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UITextFieldDelegate,UITextViewDelegate> {
    
    // 配列の宣言
    NSArray *_genre;
    NSArray *_country;
    UIImage *userImageView;
    
    // ボタンを押された時にPickerViewをだす
    BOOL _genreFlag;        // true or folesで判断させる
    BOOL _isVisibleFlag;    // true or folesで判断させる
    BOOL _userImageFlag;    // true or folesで判断させる
    UIView *_backView;      // backViewの指定
    UILabel *_myLabelInput; // 入力された文字を表示
    UITextField *_myText;   // テキストフィールド
}

@property (nonatomic,assign) int select_num;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
//@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIPickerView *viewPickerView;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *genreText;
- (IBAction)countryButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genrelabel;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *picButton;
@property (weak, nonatomic) IBOutlet UIView *moveGenreView;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UILabel *countryClearLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreClearLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordClearLabel;

@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCountry;
@property (weak, nonatomic) IBOutlet UIImageView *countryImage;

// tabBer
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;


@end
