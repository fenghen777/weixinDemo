//
//  AppDelegate.m
//  weixinDemo
//
//  Created by leadingwinner on 12-10-19.
//  Copyright (c) 2012年 leadingwinner. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApi.h"
#import "SendMesgViewController.h"
@implementation AppDelegate
- (id)init{
    if(self = [super init]){
        
    }
    return self;
}
- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[SendMesgViewController alloc] initWithNibName:@"SendMesgViewController" bundle:nil] autorelease];
    //self.viewController.delegate = self;
    self.window.rootViewController = self.viewController;
   

    
    [self.window makeKeyAndVisible];
    [WXApi registerApp:@"wx2eb0ecb06f71bf8d"];
    return YES;
}
//
//- (void)doAuth
//{
//    SendAuthReq* req = [[[SendAuthReq alloc] init] autorelease];
//    req.scope = @"post_timeline";
//    req.state = @"xxx";
//    
//    [WXApi sendReq:req];
//}
//
//-(void) changeScene:(NSInteger)scene{
//    _scene = scene;
//}
//

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [WXApi handleOpenURL:url delegate:self];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
