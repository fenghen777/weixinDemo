//
//  SendMesgViewController.h
//  weixinDemo
//
//  Created by leadingwinner on 12-10-20.
//  Copyright (c) 2012年 leadingwinner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApiObject.h"
#import "WXApi.h"
@protocol sendMsgToWeChatViewDelegate <NSObject>
- (void) sendMusicContent ;
- (void) sendVideoContent ;
- (void) changeScene:(NSInteger)scene;
@end
@interface SendMesgViewController : UIViewController<UIActionSheetDelegate,WXApiDelegate,sendMsgToWeChatViewDelegate>
{
    enum WXScene _scene;
}
- (IBAction)OnClick;

@property (nonatomic, assign) id<sendMsgToWeChatViewDelegate> delegate;
@end
