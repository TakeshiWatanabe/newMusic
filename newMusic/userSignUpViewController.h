//
//  userSignUpViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userSignUpViewController : UIViewController

//宣言
<UIPageViewControllerDelegate,UIPickerViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate> {
    //配列の宣言
    NSArray *_genre;
    NSArray *_country;
}

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
- (IBAction)nameText:(id)sender;
- (IBAction)genreText:(id)sender;
- (IBAction)countryText:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIPickerView *countryPickerView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextName;
@property (weak, nonatomic) IBOutlet UITextField *inputTextGenre;
@property (weak, nonatomic) IBOutlet UITextField *inputTextCountry;
@property (weak, nonatomic) IBOutlet UIPickerView *genrePickerView;
- (IBAction)picButton:(id)sender;
- (IBAction)genreButton:(id)sender;
- (IBAction)countryButton:(id)sender;

@end
