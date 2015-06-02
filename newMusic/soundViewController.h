//
//  soundViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/01.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface soundViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,AVAudioPlayerDelegate> {
    
    NSString *searchSongArtist;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic) AVAudioPlayer *audioPlayer;

@end
