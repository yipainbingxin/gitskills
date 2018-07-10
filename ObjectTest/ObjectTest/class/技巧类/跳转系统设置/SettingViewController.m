//
//  SettingViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
/*
 
 想跳到哪个设置界面只需要prefs:root=后面的值即可！是的，就是这样的。
 
 
 About — prefs:root=General&path=About
 Accessibility — prefs:root=General&path=ACCESSIBILITY
 Airplane Mode On — prefs:root=AIRPLANE_MODE
 Auto-Lock — prefs:root=General&path=AUTOLOCK
 Brightness — prefs:root=Brightness
 Bluetooth — prefs:root=General&path=Bluetooth
 Date & Time — prefs:root=General&path=DATE_AND_TIME
 FaceTime — prefs:root=FACETIME
 General — prefs:root=General
 Keyboard — prefs:root=General&path=Keyboard
 iCloud — prefs:root=CASTLE
 iCloud Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
 International — prefs:root=General&path=INTERNATIONAL
 Location Services — prefs:root=LOCATION_SERVICES
 Music — prefs:root=MUSIC
 Music Equalizer — prefs:root=MUSIC&path=EQ
 Music Volume Limit — prefs:root=MUSIC&path=VolumeLimit
 Network — prefs:root=General&path=Network
 Nike + iPod — prefs:root=NIKE_PLUS_IPOD
 Notes — prefs:root=NOTES
 Notification — prefs:root=NOTIFICATIONS_ID
 Phone — prefs:root=Phone
 Photos — prefs:root=Photos
 Profile — prefs:root=General&path=ManagedConfigurationList
 Reset — prefs:root=General&path=Reset
 Safari — prefs:root=Safari
 Siri — prefs:root=General&path=Assistant
 Sounds — prefs:root=Sounds
 Software Update — prefs:root=General&path=SOFTWARE_UPDATE_LINK
 Store — prefs:root=STORE
 Twitter — prefs:root=TWITTER
 Usage — prefs:root=General&path=USAGE
 VPN — prefs:root=General&path=Network/VPN
 Wallpaper — prefs:root=Wallpaper
 Wi-Fi — prefs:root=WIFI
 
 
 
 */

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
//    //Wi-Fi设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
//    if ([[UIApplication sharedApplication] canOpenURL:url])
//    {
//        [[UIApplication sharedApplication] openURL:url];
//    }
//    //定位服务
//    //定位服务有很多APP都有，如果用户关闭了定位，那么，我们在APP里面可以提示用户打开定位服务。点击到设置界面设置，直接跳到定位服务设置界面。代码如下：
//    //定位服务设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
//    if ([[UIApplication sharedApplication] canOpenURL:url])
//    {
//        [[UIApplication sharedApplication] openURL:url];
//    }
//    //Face Time
//    //FaceTime设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=FACETIME"];
//    if ([[UIApplication sharedApplication] canOpenURL:url])
//    {
//        [[UIApplication sharedApplication] openURL:url];
//    }
//    //蓝牙设置界面
//    //蓝牙设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=Bluetooth"];
//    if ([[UIApplication sharedApplication] canOpenURL:url])
//    {
//        [[UIApplication sharedApplication] openURL:url];
//    }
    //iCloud设置界面
    NSURL *url = [NSURL URLWithString:@"prefs:root=CASTLE"];
    if ([[UIApplication sharedApplication] canOpenURL:url]){
        [[UIApplication sharedApplication] openURL:url];
    }
    

}
    


@end
