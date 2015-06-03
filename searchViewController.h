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
#import "playBackViewController.h"

@interface searchViewController : UIViewController
<MPMediaPickerControllerDelegate> {
    //配列の宣言
    NSArray *_genre;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBer;

- (IBAction)genreButton:(id)sender;
- (IBAction)artistButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *allImg;
@property (weak, nonatomic) IBOutlet UIImageView *classicImg;
@property (weak, nonatomic) IBOutlet UIImageView *jazzImg;
@property (weak, nonatomic) IBOutlet UIImageView *HouseImg;
@property (weak, nonatomic) IBOutlet UIImageView *edmImg;
@property (weak, nonatomic) IBOutlet UIImageView *rockImg;
@property (weak, nonatomic) IBOutlet UIImageView *popImg;
@property (weak, nonatomic) IBOutlet UIImageView *rbImg;
@property (weak, nonatomic) IBOutlet UIImageView *hiphopImg;
@property (weak, nonatomic) IBOutlet UIImageView *generationDistinctionImg;
@property (weak, nonatomic) IBOutlet UIImageView *reggaeImg;
@property (weak, nonatomic) IBOutlet UIImageView *hawaiianImg;
@property (weak, nonatomic) IBOutlet UIImageView *kpopImg;
@property (weak, nonatomic) IBOutlet UIImageView *jpopImg;
@property (weak, nonatomic) IBOutlet UIImageView *animeImg;
@property (weak, nonatomic) IBOutlet UIImageView *tranceImg;
@property (weak, nonatomic) IBOutlet UIImageView *danceImg;


@end
