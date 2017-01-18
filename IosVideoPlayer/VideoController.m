//
//  VideoController.m
//  IosVideoPlayer
//
//  Created by Ahmet Alsan on 16/01/2017.
//  Copyright © 2017 veoss. All rights reserved.
//

#import "VideoController.h"

@implementation VideoController

#pragma mark - Video Functions

- (void)playVideo:(NSString *)url {
    
    NSLog(@"Play: %@", url);
    
    if([self player] == nil) {
        
        NSLog(@"Add Video Player");
        
        self.player = [[PBJVideoPlayerController alloc] init];
        self.player.delegate = self;
        
        UIViewController *topViewController = [self getTopViewController];
        
        self.player.view.frame = topViewController.view.bounds;
        [topViewController addChildViewController:self.player];
        [topViewController.view addSubview:self.player.view];
        [self.player didMoveToParentViewController:topViewController];
    }
    
    self.player.videoPath = url;
    [self.player playFromBeginning];
};

- (void)stopVideo {
    NSLog(@"Stop");
    [self.player stop];
};

- (void)resumeVideo {
    NSLog(@"Resume");
    [self.player playFromCurrentTime];
};

- (void)pauseVideo {
    NSLog(@"Pause");
    [self.player pause];
};

#pragma mark - Delegate Functions

- (void)videoPlayer:(PBJVideoPlayerController *)videoPlayer didUpdatePlayBackProgress:(CGFloat)progress {
    NSLog(@"Progress: %f", progress);
}

- (void)videoPlayerReady:(PBJVideoPlayerController *)videoPlayer {
    
}

- (void)videoPlayerPlaybackDidEnd:(PBJVideoPlayerController *)videoPlayer {
    
}

#pragma mark - Others

+(instancetype) singleton
{
    static id _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^
                  {
                      _sharedInstance = [self new];
                  });
    return _sharedInstance;
}

- (UIWindow*) getTopApplicationWindow
{
    // grabs the top most window
    NSArray* windows = [[UIApplication sharedApplication] windows];
    return ([windows count] > 0) ? windows[0] : nil;
}

- (UIViewController*) getTopViewController
{
    // get the top most window
    UIWindow *window = [self getTopApplicationWindow];
    
    // get the root view controller for the top most window
    UIViewController *vc = window.rootViewController;
    
    // check if this view controller has any presented view controllers, if so grab the top most one.
    while (vc.presentedViewController != nil)
    {
        // drill to topmost view controller
        vc = vc.presentedViewController;
    }
    
    return vc;
}

@end
