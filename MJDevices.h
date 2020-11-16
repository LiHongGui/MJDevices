//
//  MJDevices.h
//  MJNaviBar
//
//  Created by MichaelLi on 2020/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJDevices : NSObject
typedef void (^MJDevicesBlockWH)(NSString *wh);
typedef void (^MJDevicesBlockType)(NSInteger deviceType);
#pragma mark-screenWidth
+ (CGFloat)mjScreenWidth;
#pragma mark-screenHeight
+ (CGFloat)mjScreenHeight;
#pragma mark-状态栏高度
+ (CGFloat)mjStatusHeight;
#pragma mark-导航栏高度
+ (CGFloat)mjTabBarHeight;
#pragma mark-导航栏高度
+ (CGFloat)mjNavBarHeight;
+ (NSString *)getUUID;
+(BOOL)isPadDevice;
+(void)deviceType:(MJDevicesBlockType)deviceType wh:(MJDevicesBlockWH)wh;
#pragma mark-statusBarStyle
+(void)statusBarStyleColor:(UIColor *)statusColor;
#pragma mark-:是否是iPhoneX
+ (BOOL)isIphoneX;
#pragma mark-:设置状态栏颜色
+ (void)setStatusBarBackgroundColor:(UIColor*)color;
@end

NS_ASSUME_NONNULL_END
