//
//  MCManager.h
//  BlocTalk
//
//  Created by Murphy on 10/27/14.
//  Copyright (c) 2014 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MCManager : NSObject <MCSessionDelegate, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate>

@property (nonatomic, strong) MCPeerID *peerID;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCNearbyServiceBrowser *browser;
@property (nonatomic, strong) MCNearbyServiceAdvertiser *advertiser;

@property (nonatomic, strong) NSArray *activePeers;

+(instancetype) sharedInstance;

-(void)setupPeerAndSessionWithDisplayName:(NSString *)displayName;

@end
