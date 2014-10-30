//
//  ViewController.h
//  Triangle
//
//  Created by Andre Furquin on 10/26/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Triangle.h"

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate, NSApplicationDelegate>{
    IBOutlet NSTableView *tableView;
    NSMutableArray *formsArray;
}
@property(strong) NSTableView *tableView;
@property(strong) NSMutableArray *formsArray;
- (IBAction)openDocument:(id)sender;
- (BOOL)application:(NSApplication*)theApplication openFile:(NSString*)filename;
//- (BOOL)processFile:(NSString *)file;
-(void) triangle:(NSURL *)file;
-(void)atualizarTableView;
@end

