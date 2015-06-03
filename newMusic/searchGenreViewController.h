//
//  searchGenreViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

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
    
}

@property (weak, nonatomic) IBOutlet UITableView *artistTableView;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
- (IBAction)artistButton:(id)sender;
- (IBAction)genreButton:(id)sender;


@end
