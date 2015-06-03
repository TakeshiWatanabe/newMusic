//
//  searchArtistViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/01.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "searchViewController.h"
#import "mainViewController.h"
#import "playBackViewController.h"


@interface searchArtistViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate,UISearchBarDelegate,UITextFieldDelegate,AVAudioPlayerDelegate> {
    
    // 配列の宣言
    NSArray *_artistCell;
    NSArray *_musicList;
    NSArray *_musicListArtistName;
    NSArray *_musicListViewUrl;
    NSArray *_musicListSound;
    //NSArray *_artist;
    NSMutableArray *_musicPlay;
    
    NSURLConnection *connection;
    NSMutableData *dataAsync;
    float totalbytes;
    float loadedbytes;
    UIProgressView *progressView_;
    
    // 変数
    NSString *searchSongArtist;
    NSDictionary *_str;
}

@property (weak, nonatomic) IBOutlet UITableView *artistTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchDetail;

- (IBAction)genreButton:(id)sender;
- (IBAction)artistButton:(id)sender;

@end
