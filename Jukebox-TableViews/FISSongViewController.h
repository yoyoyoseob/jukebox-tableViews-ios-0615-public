//
//  FISSongViewController.h
//  Jukebox-TableViews
//
//  Created by Yoseob Lee on 6/17/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FISPlaylist.h"

@interface FISSongViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) FISPlaylist *playlist;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
