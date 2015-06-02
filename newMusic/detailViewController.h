//
//  detailViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/04.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface detailViewController : UIViewController <NSURLConnectionDelegate,UISearchBarDelegate,UITextFieldDelegate,AVAudioPlayerDelegate> {
    
    NSURLConnection *connection;
    NSMutableData *dataAsync;
    float totalbytes;
    float loadedbytes;
    UIProgressView *progressView_;
    
    NSString *searchSongArtist;
    NSDictionary *_str;
    NSArray *_musicImg;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchDetail;
@property (weak, nonatomic) IBOutlet UIImageView *artistImage;
@property (weak, nonatomic) IBOutlet UILabel *artistname;
@property (weak, nonatomic) IBOutlet UILabel *songTittle;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)soundbutton:(id)sender;
@property(nonatomic) AVAudioPlayer *audioPlayer;


@end
