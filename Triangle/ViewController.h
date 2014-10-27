//
//  ViewController.h
//  Triangle
//
//  Created by Andre Furquin on 10/26/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDataSource>{
    IBOutlet NSTableView *tableView;
    NSMutableArray *shoppingListArray;
}
@property(strong) IBOutlet NSTableView *tableView;
@property(strong) NSMutableArray *shoppingListArray;
@end

