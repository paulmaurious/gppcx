//
//  FileDropView.m
//  gppcx
//
//  Created by Maurious Paul on 11/07/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "FileDropView.h"
#import "AppDelegate.h"

@implementation FileDropView

@synthesize srcFileURL;

- (void)awakeFromNib{
    
    [self registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender{
    
    if ([sender draggingSourceOperationMask] & NSDragOperationCopy) {
        
        [self setNeedsDisplay:YES];
        return NSDragOperationCopy;
    }
    
    return NSDragOperationNone;
}

- (NSDragOperation)draggingUpdated:(id<NSDraggingInfo>)sender{
    
    [self setNeedsDisplay:YES];
    return NSDragOperationCopy;
}

- (void)draggingEnded:(id<NSDraggingInfo>)sender{
    
    [self setNeedsDisplay:NO];
}

- (void)draggingExited:(id<NSDraggingInfo>)sender{
    
    [self setNeedsDisplay:NO];
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender{
    
    NSPasteboard *pBoard = [sender draggingPasteboard];
    NSArray *fileNames = [pBoard propertyListForType:NSFilenamesPboardType];

    if (1 == [fileNames count] && [[pBoard types] containsObject:NSURLPboardType]) {
            
        srcFileURL = [NSURL URLFromPasteboard:pBoard];
        if ([[NSApp delegate] performSelector:@selector(checkFileExt:) withObject:srcFileURL]) {
                
            return YES;
        }
    }
    
    return NO;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
