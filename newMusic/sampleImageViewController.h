//
//  sampleImageViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/04.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "mainViewController.h"

@interface sampleImageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate,UISearchBarDelegate,UITextFieldDelegate,AVAudioPlayerDelegate,NSURLConnectionDataDelegate> {
    
    // 配列の宣言
    NSArray *_musicList;
    NSArray *_musicListTrackName;
    NSArray *_musicListArtistName;
    NSArray *_musicListViewUrl;
    NSArray *_musicListSound;
    NSArray *_musicListTrackId;
    NSArray *_musicCell;
    
    NSString *musicTittle;
    NSString *artistName;
    UIImage *musicImg;
    NSString *soundUrl;
    NSString *trackId;
    int userId;
    NSString *StrmusicImg;
    
    // 音楽
    NSMutableArray *_musicPlay;
    NSArray *array;
    NSString *soundCell;
    
    NSURLConnection *connection;
    NSMutableData *dataAsync;
    float totalbytes;
    float loadedbytes;
    UIProgressView *progressView_;
    
    // 変数
    NSString *searchSongArtist;
    NSDictionary *_str;
    NSData *imgData;
    
    UIButton *favouriteBtn;
    
    UIAlertView *alertfavourite;
    NSString *favouriteData;
    
    int _audioPlayerRow;
    
}

@property(nonatomic) AVAudioPlayer *audioPlayer;

@property (weak, nonatomic) IBOutlet UISearchBar *searchDetail;
@property (weak, nonatomic) IBOutlet UITableView *artistTableView;
- (IBAction)searchButton:(id)sender;
- (IBAction)mainButton:(id)sender;
- (IBAction)userInfoButton:(id)sender;
- (IBAction)genretButton:(id)sender;

@property (retain,nonatomic) NSString *dictionary;
@property (weak, nonatomic) NSString *eventId;

@property (weak, nonatomic) NSString *SondUrl;

@property (strong, nonatomic) NSMutableData *receivedData;

// 非同期
@property (nonatomic, strong) NSMutableDictionary *imageCache;


@end
