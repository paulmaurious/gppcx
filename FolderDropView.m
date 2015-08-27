//
//  FolderDropView.m
//  gppcx
//
//  Created by Maurious Paul on 11/07/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "FolderDropView.h"
#import "AppDelegate.h"

@implementation FolderDropView

@synthesize destFolderURL;

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
    NSArray *folderNames = [pBoard propertyListForType:NSFilenamesPboardType];
    NSString *utiType = [[NSWorkspace sharedWorkspace] typeOfFile:[folderNames lastObject] error:nil];
    
    if (1 == [folderNames count] && [[pBoard types] containsObject:NSURLPboardType]) {
        
        destFolderURL = [NSURL URLFromPasteboard:pBoard];
        if ([[NSApp delegate] performSelector:@selector(checkFolderExist:) withObject:destFolderURL] && [[NSWorkspace sharedWorkspace] type:utiType conformsToType:(id)kUTTypeDirectory]) {
            
            return YES;
        }
        else{
            
            [[[NSApp delegate] folderStatus] setImage:[NSImage imageNamed:@"FOLDERNOTOK_256"]];
            [[[NSApp delegate] folderNext] setEnabled:NO];
            return NO;
        }
    }
    return NO;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
