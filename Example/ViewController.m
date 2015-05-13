//
//  ViewController.m
//  NCMusicEngine Example
//
//  Created by Aster0id on 13-5-5.
//  Copyright (c) 2013年 NC. All rights reserved.
//

#import "ViewController.h"
#import "NCMusicEngine.h"
#import "Mp3PlayerButton.h"
@interface ViewController ()<NCMusicEngineDelegate>
{
    NCMusicEngine *_player;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    // Do any additional setup after loading the view from its nib.
    Mp3PlayerButton *playButton = [[Mp3PlayerButton alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    playButton.mp3URL = [NSURL URLWithString:@"http://music.baidutt.com/up/kwcawacd/yydwpu.mp3"];
    [playButton addTarget:self action:@selector(playAudio:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)playAudio:(Mp3PlayerButton *)button
{
    if (_player == nil) {
        _player = [[NCMusicEngine alloc] init];
        //_player.button = button;
        _player.delegate = self;
    }
    
    if ([_player.button isEqual:button]) {
        if (_player.playState == NCMusicEnginePlayStatePlaying) {
            [_player pause];
        }
        else if(_player.playState==NCMusicEnginePlayStatePaused){
            [_player resume];
        }
        else{
            [_player playUrl:button.mp3URL];
        }
    } else {
        [_player stop];
        _player.button = button;
        [_player playUrl:button.mp3URL];
    }
}

@end
