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

@interface searchGenreViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,NSURLConnectionDelegate,UISearchBarDelegate,UITextFieldDelegate,AVAudioPlayerDelegate> {
    
    //配列の宣言
    NSArray *_musicList;
    
}
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
- (IBAction)artistButton:(id)sender;
- (IBAction)genreButton:(id)sender;


@end
