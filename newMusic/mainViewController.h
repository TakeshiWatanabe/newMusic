//
//  mainViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

//宣言
#import "ViewController.h"
#import "userSignUpViewController.h"

@interface mainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *musicInformationLabel;
- (IBAction)goodButton:(id)sender;
- (IBAction)listenButton:(id)sender;
- (IBAction)commentButton:(id)sender;


@end
