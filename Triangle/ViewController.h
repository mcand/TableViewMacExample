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
@property(nonatomic, retain) NSTableView *tableView;
@property(nonatomic, strong) NSMutableArray *formsArray;
- (IBAction)openDocument:(id)sender;
- (void) triangle:(NSURL *)file;
- (void) square:(NSURL *)file;
- (void)updateTableView;
@end

