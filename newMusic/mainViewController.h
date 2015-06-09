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
    
    // 音楽
    NSMutableArray *_musicPlay;
    
    // goodBotttun
    NSInteger total;
    //IBOutlet UILabel *number;
    
    
}

// テーブル 
@property (weak, nonatomic) IBOutlet UITableView *mainViewController;

// 音楽
@property (nonatomic) AVAudioPlayer *audioPlayer;   

@property (weak, nonatomic) IBOutlet UILabel *number;

- (IBAction)serchButton:(id)sender;
- (IBAction)mainButton:(id)sender;

@end
