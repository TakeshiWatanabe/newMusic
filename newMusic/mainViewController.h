//
//  mainViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

// 宣言
#import "ViewController.h"
#import "userSignUpViewController.h"
#import "playBackViewController.h"
#import "sampleImageViewController.h"


@interface mainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AVAudioPlayerDelegate> {
    
    NSArray *_musicCell;
    NSMutableArray *newMusicCell;
    
    // 音楽
    NSMutableArray *_musicPlay;
    
    // goodButton
    int number;
    NSString *kazuText;
    IBOutlet UILabel *numberLabel;
    
    
}

// テーブル 
@property (weak, nonatomic) IBOutlet UITableView *mainViewController;

// 音楽
@property (nonatomic) AVAudioPlayer *audioPlayer;   

//@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
//@property (weak, nonatomic) IBOutlet UILabel *kazuLabel;

- (IBAction)serchButton:(id)sender;
- (IBAction)mainButton:(id)sender;

@end
