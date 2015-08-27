//
//  FolderDropView.h
//  gppcx
//
//  Created by Maurious Paul on 11/07/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FolderDropView : NSView <NSDraggingDestination>{
    
    NSURL *destFolderURL;
}

@property (retain) NSURL *destFolderURL;

@end
