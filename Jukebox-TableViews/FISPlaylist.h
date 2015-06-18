//
//  Playlist.h
//  JukeboxViews
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject

-(instancetype)initWithName:(NSString *)name;

@property (strong, nonatomic) NSMutableArray *songs;
@property (strong, nonatomic) NSString *name;
//@property (strong, nonatomic) NSMutableArray *arrayOfNames;

-(void)sortSongsByTitle;
-(void)sortSongsByArtist;
-(void)sortSongsByAlbum;
-(NSString *)description;
-(FISSong *)songAtPosition:(NSNumber *)position;

@end
