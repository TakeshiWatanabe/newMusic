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

@interface sampleImageViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate,UISearchBarDelegate,UITextFieldDelegate,AVAudioPlayerDelegate> {
    
    // 配列の宣言
    NSArray *_musicList;
    NSArray *_musicListTrackName;
    NSArray *_musicListArtistName;
    NSArray *_musicListViewUrl;
    NSArray *_musicListSound;
    NSArray *_musicListTrackId;
    NSArray *_musicCell;
    
    NSMutableArray *_musicPlay;
    
    NSURLConnection *connection;
    NSMutableData *dataAsync;
    float totalbytes;
    float loadedbytes;
    UIProgressView *progressView_;
    
    // 変数
    NSString *searchSongArtist;
    NSDictionary *_str;
    NSData *imgData;
    
}

@property(nonatomic) AVAudioPlayer *audioPlayer;

@property (weak, nonatomic) IBOutlet UISearchBar *searchDetail;
@property (weak, nonatomic) IBOutlet UITableView *artistTableView;

@end