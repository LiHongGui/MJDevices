//
//  MJDevices.m
//  MJNaviBar
//
//  Created by MichaelLi on 2020/11/16.
//

#import "MJDevices.h"
#import <UIKit/UIKit.h>
#define kUIScreen [UIScreen mainScreen].bounds
#define kUIS_W [UIScreen mainScreen].bounds.size.width
#define kUIS_H [UIScreen mainScreen].bounds.size.height
@implementation MJDevices
static UIView *statusBar = nil;
#pragma mark-screenWidth
+ (CGFloat)mjScreenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

#pragma mark-screenHeight
+ (CGFloat)mjScreenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}
#pragma mark-状态栏高度
+ (CGFloat)mjStatusHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}
#pragma mark-导航栏高度
+ (CGFloat)mjTabBarHeight
{
    return [MJDevices isIphoneX]?83:49;
}
#pragma mark-导航栏高度
+ (CGFloat)mjNavBarHeight
{
   if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        if (![MJDevices isPadDevice]) {
            return 32;
        }else {
            return 70;
        }
    } else {
        if ([MJDevices isPadDevice]) {
            return 70;
        }else {
            if ([self isIphoneX]) {
                NSLog(@"isIphoneX");
                return 88;
            } else {
                return 64;
            }
        }

    }

}
+ (NSString *)getUUID
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return [result stringByReplacingOccurrencesOfString:@"-" withString:@""];
}
+(BOOL)isPadDevice
{
    if ([[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        return YES;;
    }else {
        return NO;
    }
}
+(void)deviceType:(MJDevicesBlockType)deviceType wh:(MJDevicesBlockWH)wh
{
    NSString *widthH = [NSString stringWithFormat:@"%.f*%.f",kUIS_W,kUIS_H];
    if ([widthH isEqualToString:@"320*480"]) {//3.5
        wh(widthH);
        deviceType(0);
    }else if ([widthH isEqualToString:@"320*568"]) {//4.0
        wh(widthH);
        deviceType(1);
    }else if ([widthH isEqualToString:@"375*667"]) {//4.7
        wh(widthH);
        deviceType(2);
    }else if ([widthH isEqualToString:@"414*736"]) {//5.5
        wh(widthH);
        deviceType(3);
    }else if ([widthH isEqualToString:@"375*812"]) {//5.8
        wh(widthH);
        deviceType(4);
    }else if ([widthH isEqualToString:@"414*896"]) {//6.1 6.5
        wh(widthH);
        deviceType(5);
    }else if ([widthH isEqualToString:@"768*1024"]) {//7.9
        wh(widthH);
        deviceType(6);
    }else if ([widthH isEqualToString:@"768*1024"]) {//9.7
        wh(widthH);
        deviceType(7);
    }else if ([widthH isEqualToString:@"834*1194"]) {//10.5
        wh(widthH);
        deviceType(8);
    }else if ([widthH isEqualToString:@"1024*1194"]) {//11
        wh(widthH);
        deviceType(9);
    }else if ([widthH isEqualToString:@"1024*1366"]) {//12.9
        wh(widthH);
        deviceType(10);
    }

}
#pragma mark-statusBarStyle
+(void)statusBarStyleColor:(UIColor *)statusColor
{
    if (CGColorEqualToColor(statusColor.CGColor,[UIColor whiteColor].CGColor)) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    }else {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
}
#pragma mark-:是否是iPhoneX
+ (BOOL)isIphoneX {
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    if (@available(iOS 11.0, *)) {
        if (window.safeAreaInsets.bottom > 0.0) {
            NSLog(@"isIphoneX");
            return YES;
        } else {
            NSLog(@"NotIsIphoneX");
            return NO;
        }
    } else {
        return NO;
    }
}
#pragma mark-:设置状态栏颜色
+ (void)setStatusBarBackgroundColor:(UIColor*)color
{
    if (@available(iOS 13.0, *)) {
        if (!statusBar) {
                 UIWindow *keyWindow = [UIApplication sharedApplication].windows[0];
                 statusBar = [[UIView alloc] initWithFrame:keyWindow.windowScene.statusBarManager.statusBarFrame];
                 [keyWindow addSubview:statusBar];
        }
    } else {
        // Fallback on earlier versions
        statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    }
    if([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
@end
