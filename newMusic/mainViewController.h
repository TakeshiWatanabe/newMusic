//
//  mainViewController.h
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

//宣言
#import "ViewController.h"
#import "userSignUpViewController.h"
#import "newMainTableViewCell.h"


@interface mainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    NSArray *_coffeeArray;
}

@property (weak, nonatomic) IBOutlet UITableView *mainViewController;
//@property (weak, nonatomic) IBOutlet UITableViewCell *tableView;

@end
