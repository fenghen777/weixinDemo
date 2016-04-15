//
//  SendMesgViewController.m
//  weixinDemo
//
//  Created by leadingwinner on 12-10-20.
//  Copyright (c) 2012年 leadingwinner. All rights reserved.
//

#import "SendMesgViewController.h"

@interface SendMesgViewController ()

@end

@implementation SendMesgViewController
@synthesize delegate = _delegate;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void) onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
        
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        
    }
    
}

-(void) onResp:(BaseResp*)resp
{
    //可以省略
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
    }
    else if([resp isKindOfClass:[SendAuthResp class]])
    {
    }
}


#pragma mark - View lifecycle

- (void)sendMusicContent
{
//    if (_delegate)
//    {
//        [_delegate sendMusicContent] ;
//    }
    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]) {
        WXMediaMessage *message = [WXMediaMessage message];
        message.title = @"五月天<后青春期的诗>";
        message.description = @"人群中哭着你只想变成透明的颜色\
        你再也不会梦或痛或心动了\
        你已经决定了你已经决定了\
        你静静忍着紧紧把昨天在拳心握着\
        而回忆越是甜就是越伤人\
        越是在手心留下密密麻麻深深浅浅的刀割\
        重新开始活着";
        [message setThumbImage:[UIImage imageNamed:@"res3.jpg"]];
        
        WXMusicObject *ext = [WXMusicObject object];
        ext.musicUrl = @"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4BDA0E4B88DE698AFE79C9FE6ADA3E79A84E5BFABE4B990222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696332342E74632E71712E636F6D2F586B303051563558484A645574315070536F4B7458796931667443755A68646C2F316F5A4465637734356375386355672B474B304964794E6A3770633447524A574C48795333383D2F3634363232332E6D34613F7569643D32333230303738313038266469723D423226663D312663743D3026636869643D222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31382E71716D757369632E71712E636F6D2F33303634363232332E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E5889BE980A0EFBC9AE5B08FE5B7A8E89B8B444E414C495645EFBC81E6BC94E594B1E4BC9AE5889BE7BAAAE5BD95E99FB3222C22736F6E675F4944223A3634363232332C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E4BA94E69C88E5A4A9222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D31354C5569396961495674593739786D436534456B5275696879366A702F674B65356E4D6E684178494C73484D6C6A307849634A454B394568572F4E3978464B316368316F37636848323568413D3D2F33303634363232332E6D70333F7569643D32333230303738313038266469723D423226663D302663743D3026636869643D2673747265616D5F706F733D38227D";
        
        message.mediaObject = ext;
        
        SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
        req.bText = NO;
        req.message = message;
        req.scene = _scene;
        
        [WXApi sendReq:req];
    }else{
        UIAlertView *alView = [[UIAlertView alloc]initWithTitle:@"" message:@"你的iPhone上还没有安装微信,无法使用此功能，使用微信可以方便的把你喜欢的作品分享给好友。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"免费下载微信", nil];
        [alView show];
        [alView release];
        
    }

}
- (void)sendVideoContent
{
//    if (_delegate)
//    {
//        [_delegate sendVideoContent] ;
//    }
    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]) {
        WXMediaMessage *message = [WXMediaMessage message];
        message.title = @"步步惊奇";
        message.description = @"只能说胡戈是中国广告界的一朵奇葩！！！这次真的很多人给跪了、、、";
        [message setThumbImage:[UIImage imageNamed:@"res2.jpg"]];
        
        WXVideoObject *ext = [WXVideoObject object];
        ext.videoUrl = @"http://www.tudou.com/programs/view/6vx5h884JHY/?fr=1";
        
        message.mediaObject = ext;
        
        SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
        req.bText = NO;
        req.message = message;
        req.scene = _scene;
        
        [WXApi sendReq:req];
    }else{
        UIAlertView *alView = [[UIAlertView alloc]initWithTitle:@"" message:@"你的iPhone上还没有安装微信,无法使用此功能，使用微信可以方便的把你喜欢的作品分享给好友。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"免费下载微信", nil];
        [alView show];
        [alView release];
        
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 2) {
        NSString *weiXinLink = @"itms-apps://itunes.apple.com/cn/app/wei-xin/id414478124?mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:weiXinLink]];
    }
}
-(void) changeScene:(NSInteger)scene{
    _scene = scene;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _scene = WXSceneSession;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)OnClick
{
    
    UIActionSheet *acSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"微信",@"新浪", nil];
    acSheet.tag =1;
    acSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [acSheet showInView:[[UIApplication sharedApplication]keyWindow]];
    [acSheet release];
}

#pragma mark - uiactionsheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag==1) {
        if (buttonIndex == 0) {
            
            UIActionSheet *acSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"分享给微信好友",@"分享到朋友圈", nil];
            acSheet.tag =2;
            acSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
            [acSheet showInView:[[UIApplication sharedApplication]keyWindow]];
            [acSheet release];
            
        }
        else if (buttonIndex == 1) {
            UIAlertView *al = [[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"新浪", nil];
            [al show];
            [al release];
        }
        else if (buttonIndex == 2) {
            //************
        }
    }else if (actionSheet.tag==2){
        if (buttonIndex == 0) {
            [self sendMusicContent];
            [_delegate changeScene:WXSceneSession];
            
        }
        else if (buttonIndex == 1) {
            [self sendVideoContent];
            [_delegate changeScene:WXSceneTimeline];

        }
        
    }
    
}

- (void)dealloc {
    [super dealloc];
}
@end
