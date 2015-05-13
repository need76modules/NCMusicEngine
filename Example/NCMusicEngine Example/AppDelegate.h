//
//  AppDelegate.h
//  NCMusicEngine Example
//
//  Created by nickcheng on 13-1-23.
//  Copyright (c) 2013年 NC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    ViewController *viewController;
}
@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic)  ViewController *viewController;

@end
