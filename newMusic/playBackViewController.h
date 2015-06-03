//
//  playBackViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/02.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface playBackViewController : UIViewController <NSURLConnectionDelegate,UISearchBarDelegate,UITextFieldDelegate,AVAudioPlayerDelegate,UITableViewDataSource,UITableViewDelegate> {
    
    NSURLConnection *connection;
    NSMutableData *dataAsync;
    float totalbytes;
    float loadedbytes;
    UIProgressView *progressView_;
    
    NSString *searchSongArtist;
    NSDictionary *_str;
    NSArray *_musicImg;
    NSArray *_artistCell;
    NSArray *_musicList;
    
    NSArray *_musicListArtistName;
    NSArray *_musicListTrackName;
    NSArray *_musicListViewUrl;
    NSArray *_musicListSound;
    NSMutableArray *_musicPlay;
    NSData *imageData;
}

@property (weak, nonatomic) IBOutlet UISearchBar *searchDetail;
@property (weak, nonatomic) IBOutlet UIImageView *artistImg;
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistname;
- (IBAction)goodButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
- (IBAction)soundbutton:(id)sender;
@property(nonatomic) AVAudioPlayer *audioPlayer;
//- (IBAction)goodButton:(id)sender;
- (IBAction)favouriteButton:(id)sender;

@end
