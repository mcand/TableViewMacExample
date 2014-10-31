//
//  ViewController.m
//  Triangle
//
//  Created by Andre Furquin on 10/26/14.
//  Copyright (c) 2014 Andre Furquim. All rights reserved.
//

#import "ViewController.h"
#import "Triangle.h"
#import "Rectangle.h"


@implementation ViewController
@synthesize formsArray, tableView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Triangle *scaleneTriangle = [[Triangle alloc] initWithSides:3 side:4 andSide:5];
//    Triangle *isoscelesTriangle = [[Triangle alloc] initWithSides:20 side:20 andSide:10];
//    Triangle *equilateralTriangle = [[Triangle alloc] initWithSides:10 side:10 andSide:10];
//    Triangle *invalidTriangle = [[Triangle alloc] initWithSides:40 side:10 andSide:5];
//    
//    self.formsArray = [[NSMutableArray alloc] initWithObjects:scaleneTriangle, isoscelesTriangle, equilateralTriangle, invalidTriangle, nil];

    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // Do any additional setup after loading the view.
}
 
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    NSLog(@"Numeros de triangulos e %lu", self.formsArray.count);
    return [self.formsArray count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSTableCellView *result = [self.tableView makeViewWithIdentifier:@"MyView" owner:self];
    
    Shape *shape = [self.formsArray objectAtIndex:row];
    
    if ([shape.name isEqualToString:@"Triangle"]) {
        
        Triangle *triangle = (Triangle *)shape;
        
        if ([tableColumn.identifier isEqualToString:@"Form"]) {
            result.textField.stringValue = triangle.name;
        } else if ([tableColumn.identifier isEqualToString:@"Sides"]) {
            result.textField.stringValue = [NSString stringWithFormat:@"%.2f, %.2f e %.2f", triangle.sideA, triangle.sideB, triangle.sideC];
        } else if ([tableColumn.identifier isEqualToString:@"ValidForm"]) {
            result.textField.stringValue = [triangle isValidTriangle:triangle] ? @"Yes": @"No";
        } else if ([tableColumn.identifier isEqualToString:@"Area"]) {
            result.textField.stringValue = [NSString stringWithFormat:@"%.2f", triangle.area];
        } else if ([tableColumn.identifier isEqualToString:@"FormType"]) {
            result.textField.stringValue = [triangle triangleClassification];
        }
    } else {

        Rectangle *rectangle = (Rectangle *)shape;
        
        if ([tableColumn.identifier isEqualToString:@"Form"]) {
            result.textField.stringValue = rectangle.name;
        } else if ([tableColumn.identifier isEqualToString:@"Sides"]) {
            result.textField.stringValue = [NSString stringWithFormat:@"%.2f e %.2f", rectangle.sideA, rectangle.sideB];
        } else if ([tableColumn.identifier isEqualToString:@"ValidForm"]) {
            result.textField.stringValue = @"Yes";
        } else if ([tableColumn.identifier isEqualToString:@"Area"]) {
            result.textField.stringValue = [NSString stringWithFormat:@"%.2f", rectangle.area];
        } else if ([tableColumn.identifier isEqualToString:@"FormType"]) {
            result.textField.stringValue = [rectangle rectangleClassification];
        }
        
    }
    

    return result;
    
}

- (IBAction)openDocument:(id)sender{
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[NSArray arrayWithObjects:@"tri", @"sqa",nil]];
    
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  file = [[panel URLs] objectAtIndex:0];
            
            if ([[file pathExtension] isEqualToString:@"tri"]) {
                [self performSelectorInBackground:@selector(triangle:) withObject:file];
            } else {
                if ([[file pathExtension] isEqualToString:@"sqa"]){
                    [self performSelectorInBackground:@selector(square:) withObject:file];
                }
            }
            

        }
        
    }];
}

#pragma mark To do: Refatorar esse método para ficar reutilizavel, pois faz muita coisa igual ao triangle

- (void) square:(NSURL *)file{
    NSError *error;
    
    NSString *words = [[NSString alloc] initWithContentsOfURL:file encoding:NSUTF8StringEncoding error:&error];
    
    NSLog(@"%@", words);
    
    NSArray *lines = [words componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSMutableArray *shapes = [[NSMutableArray alloc] init];
    
    for(int i=0; i < lines.count; i++) {
        
        NSArray*info = [lines[i] componentsSeparatedByString:@";"];
        
        // Creates triangles to be populated
        CGFloat side1 = (CGFloat)[info[0] floatValue];
        CGFloat side2 = (CGFloat)[info[1] floatValue];
        
        Rectangle *rectangle = [[Rectangle alloc] initWithSides:side1 side:side2];
        
        [shapes addObject:rectangle];
    }
    
    self.formsArray = shapes;
    
    [self performSelectorOnMainThread:@selector(updateTableView) withObject:nil waitUntilDone:NO];
}

#pragma mark To do: Refatorar esse método para ficar reutilizavel, pois faz muita coisa igual ao rectangle
-(void) triangle:(NSURL *)file{
    
        NSError *error;
    
        NSString *words = [[NSString alloc] initWithContentsOfURL:file encoding:NSUTF8StringEncoding error:&error];
    
        NSLog(@"%@", words);
    
        NSArray *lines = [words componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];

        NSMutableArray *shapes = [[NSMutableArray alloc] init];
    
        for(int i=0; i < lines.count; i++) {
    
            NSArray*info = [lines[i] componentsSeparatedByString:@";"];
    
            // Creates triangles to be populated
            CGFloat side1 = (CGFloat)[info[0] floatValue];
            CGFloat side2 = (CGFloat)[info[1] floatValue];
            CGFloat side3 = (CGFloat)[info[2] floatValue];

            Triangle *triangle = [[Triangle alloc] initWithSides:side1 side:side2 andSide:side3];
   
            [shapes addObject:triangle];
        }
    
        self.formsArray = shapes;
    
        [self performSelectorOnMainThread:@selector(updateTableView) withObject:nil waitUntilDone:NO];
    
}

#pragma mark

-(void)updateTableView{

    [self.tableView reloadData];    

}

@end
