//
//  searchViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/05/12.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "mainViewController.h"
#import "searchGenreViewController.h"
#import "searchArtistViewController.h"
#import "playBackViewController.h"
#import "sampleImageViewController.h"

@interface searchViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,AVAudioPlayerDelegate> {
    
    //配列の宣言
    NSArray *_musicList;
    NSMutableArray *_musicPlay;
    NSArray *_genre;
    NSString *searchSongArtist;
    
    NSURLConnection *connection;
    NSMutableData *dataAsync;
    float totalbytes;
    float loadedbytes;
    UIProgressView *progressView_;
    
}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBer;

@property (weak, nonatomic) IBOutlet UIImageView *NewArtistImg;
@property (weak, nonatomic) IBOutlet UIImageView *classicImg;
@property (weak, nonatomic) IBOutlet UIImageView *jazzImg;
@property (weak, nonatomic) IBOutlet UIImageView *soundTrackImg;
@property (weak, nonatomic) IBOutlet UIImageView *edmImg;
@property (weak, nonatomic) IBOutlet UIImageView *rockImg;
@property (weak, nonatomic) IBOutlet UIImageView *popImg;
@property (weak, nonatomic) IBOutlet UIImageView *rbImg;
@property (weak, nonatomic) IBOutlet UIImageView *hiphopImg;
@property (weak, nonatomic) IBOutlet UIImageView *hitSongImg;
@property (weak, nonatomic) IBOutlet UIImageView *reggaeImg;
//@property (weak, nonatomic) IBOutlet UIImageView *bluesImg;
@property (weak, nonatomic) IBOutlet UIImageView *alternativeImg;
@property (weak, nonatomic) IBOutlet UIImageView *jpopImg;
@property (weak, nonatomic) IBOutlet UIImageView *animeImg;
@property (weak, nonatomic) IBOutlet UIImageView *fitnessImg;
@property (weak, nonatomic) IBOutlet UIImageView *danceImg;

- (IBAction)serchButton:(id)sender;
- (IBAction)mainButton:(id)sender;
- (IBAction)userInfoButton:(id)sender;



@end
