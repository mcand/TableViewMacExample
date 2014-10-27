//
//  ViewController.m
//  Triangle
//
//  Created by Andre Furquin on 10/26/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize shoppingListArray, tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    self.shoppingListArray = [[NSMutableArray alloc] initWithObjects:@"Milk",@"Eggs", @"Butter", nil];

    [tableView setDelegate:self];
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSLog(@"%lu", self.shoppingListArray.count);
    return [self.shoppingListArray count];
}


-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    return [self.shoppingListArray objectAtIndex:row];
}





@end
