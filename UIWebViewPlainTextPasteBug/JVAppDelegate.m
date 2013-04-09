//
//  JVAppDelegate.m
//  UIWebViewPlainTextPasteBug
//
//  Created by Heath Borders on 4/8/13.
//  Copyright (c) 2013 Jive Software. All rights reserved.
//

#import "JVAppDelegate.h"

@implementation JVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [UIWebView new];
    [webView loadHTMLString:@"<html><body><div><button onclick=\"alert(document.getElementById('red').innerHTML)\">show red</button><button onclick=\"alert(document.getElementById('blue').innerHTML)\">show blue</button></div><div id=\"red\" contenteditable=\"true\" style=\"background-color: red; font-size: 32px;\"></div><div id=\"blue\" contenteditable=\"true\" style=\"background-color: blue;\"></div></body></html>" baseURL:nil];
    
    UIViewController *viewController = [UIViewController new];
    viewController.view = webView;
    
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    [[[UIAlertView alloc] initWithTitle:@"Directions"
                                message:@"1. Paste text in the red rectangle, click the 'show red' button\n2. Paste text in the blue rectangle, click the 'show blue' button.\nNotice that red is wrapped in <font size='3'>, but blue is not.\n\nThis happens in iOS6+, but not in iOS5.1-"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
    
    return YES;
}

@end
