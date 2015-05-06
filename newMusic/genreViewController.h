//
//  genreViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/04.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface genreViewController : UIViewController
//宣言
<UITableViewDelegate,UITableViewDataSource> {
    //メンバ変数宣言
    NSArray *_genre;
}
@property (weak, nonatomic) IBOutlet UITableView *genreTable;

@end
