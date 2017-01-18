//
//  IosVideoPlayer.m
//  IosVideoPlayer
//
//  Created by Ahmet Alsan on 04/12/2016.
//  Copyright © 2016 veoss. All rights reserved.
//

#import "IosVideoPlayer.h"
#import "VideoController.h"

@implementation IosVideoPlayer

+ (void)playVideo:(NSString *)url {
    [[VideoController singleton] playVideo: url];
};

@end


