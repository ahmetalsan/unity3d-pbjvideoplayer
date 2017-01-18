//
//  VideoController.h
//  IosVideoPlayer
//
//  Created by Ahmet Alsan on 16/01/2017.
//  Copyright © 2017 veoss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PBJVideoPlayer.h"

@interface VideoController : NSObject <PBJVideoPlayerControllerDelegate>

@property (nonatomic, strong) PBJVideoPlayerController *player;

+(instancetype) singleton;

- (void)playVideo:(NSString *)url;

@end
