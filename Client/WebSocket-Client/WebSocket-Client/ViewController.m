//
//  ViewController.m
//  WebSocket-Client
//
//  Created by 榆泽 on 2021/5/7.
//

#import "ViewController.h"
#import <SocketRocket/SocketRocket.h>

@interface ViewController () <SRWebSocketDelegate>

@property (nonatomic, strong) SRWebSocket *webSocket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWebSocket];
}

#pragma mark - WebSocket操作
- (void)initWebSocket {
    self.webSocket = [[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"ws://localhost:1234"]];
    self.webSocket.delegate = self;
    [self openWebSocket];
}

- (void)openWebSocket {
    [self.webSocket open];
}

- (void)sendClientHiMessage {
    [self.webSocket send:@"Client: Hi"];
}

#pragma mark - SRWebSocketDelegate
- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSLog(@"%s", __func__);
    [self sendClientHiMessage];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"%@", message);
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);
}

@end
