//
//  RootViewController.m
//  HXYStudyDemo
//
//  Created by tzsoft on 2017/8/9.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()
@property (nonatomic ,strong)UMSocialMessageObject *messageObject;
@end

@implementation ShareViewController
- (instancetype)init{

    if (self = [super init]) {
        
        self.title = @"分享";
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    DLog(@"%d",TEST);
    
    NSArray *platformArr = @[@"分享到微信朋友圈",@"分享给微信好友",@"分享到空间",@"分享给QQ好友",@"短信"];
    for (int i = 0; i < platformArr.count; i ++) {
       
        UIButton *shareBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        [shareBtn setTitle:[platformArr objectAtIndex:i] forState:UIControlStateNormal];
        shareBtn.backgroundColor = [self randomColor];
        shareBtn.frame = CGRectMake(30, 10 + 40 * i + 10 *i, 150, 40);
        [self.view addSubview:shareBtn];
        shareBtn.tag = 10 + i;
        [shareBtn addTarget:self action:@selector(shareToPlatform:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (UMSocialMessageObject *)messageObject{

    if (!_messageObject) {
        
        _messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象
        NSString* thumbURL =  @"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/w%3D268%3Bg%3D0/sign=3169935a918fa0ec7fc7630b1eac3ed3/4034970a304e251fc673b591a786c9177e3e53d6.jpg";
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"欢迎使用【同智伟业】电子合同平台" descr:@"“安全移动”办公的缔造者，为您提供快捷、高效的无纸化办公方案" thumImage:thumbURL];
        //设置网页地址
        shareObject.webpageUrl = @"http://www.tongzhi.com.cn";
        
        //分享消息对象设置分享内容对象
        self.messageObject.shareObject = shareObject;
    }
    return  _messageObject;
}

- (void)shareToPlatform:(UIButton * )shareBtn{
    
    UMSocialPlatformType platType = UMSocialPlatformType_UnKnown;
    
    switch (shareBtn.tag) {
        case 10:
            platType = UMSocialPlatformType_WechatTimeLine;
            break;
        case 11:
            platType = UMSocialPlatformType_WechatSession;
            break;
        case 12:
            platType = UMSocialPlatformType_Qzone;
            break;
        case 13:
            platType = UMSocialPlatformType_QQ;
            break;
        case 14:
            platType = UMSocialPlatformType_Sms;
            break;
            
        default:
            break;
    }
    //
    [[UMSocialManager defaultManager] shareToPlatform:platType messageObject:self.messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
    }];
}

//生成随机颜色
-(UIColor *) randomColor{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
