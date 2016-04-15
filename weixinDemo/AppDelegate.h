//
//  AppDelegate.h
//  weixinDemo
//
//  Created by leadingwinner on 12-10-19.
//  Copyright (c) 2012年 leadingwinner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SendMesgViewController.h"
#import "WXApi.h"

//@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate, WXApiDelegate>{
}


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SendMesgViewController *viewController;


@end
