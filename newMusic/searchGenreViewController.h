//
//  searchGenreViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "mainViewController.h"
#import "searchViewController.h"
#import "playBackViewController.h"
#import "searchArtistViewController.h"
#import "searchViewController.h"

@interface searchGenreViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate,UISearchBarDelegate,UITextFieldDelegate,AVAudioPlayerDelegate> {
    
    //配列の宣言
    NSURLConnection *connection;
    NSMutableData *dataAsync;
    float totalbytes;
    float loadedbytes;
    UIProgressView *progressView_;
    
    NSArray *_musicList;
    NSArray *_musicListArtistName;
    NSArray *_musicListViewUrl;
    NSArray *_musicListSound;
    NSDictionary *_str;
    NSArray *_artistCell;
    
    NSString *_btnGenre;
    
}

@property (nonatomic) NSString *genreInfo;


@property (weak, nonatomic) IBOutlet UITableView *artistTableView;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;

//一度読み込んだ画像をキャッシュして、再び読み込まない
@property (nonatomic, strong) NSMutableDictionary *imageCache;
- (IBAction)backBtn:(id)sender;


@end
