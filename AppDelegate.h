//
//  AppDelegate.h
//  gppcx
//
//  Created by Maurious Paul on 01/07/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    
    __weak IBOutlet NSPanel *compileConfirm;
    
    __weak IBOutlet NSPanel *compileSuccess;
    
    __weak IBOutlet NSPanel *compileError;
}

@property (weak) IBOutlet NSPanel *compileSuccess;

@property (weak) IBOutlet NSPanel *compileError;

@property (weak) IBOutlet NSPanel *compileConfirm;

@property (weak) IBOutlet NSButton *mainNext;

@property (weak) IBOutlet NSButton *folderSelBack;

@property (weak) IBOutlet NSImageView *fileStatus;

@property (weak) IBOutlet NSButton *folderNext;

@property (weak) IBOutlet NSImageView *folderStatus;

@property (weak) IBOutlet NSButton *mainRestart;

@property (weak) IBOutlet NSButton *folderSelRes;

@property (retain) NSString *srcFilePath;

@property (retain) NSString *destFolderPath;

@property (retain) NSString *destFilePath;

@property (retain) NSFileManager* fmgr;

@property (retain) NSString *appSupDirPath;

@property (retain) NSString *symPath;

@property (retain) NSString *errPath;

@property (weak) IBOutlet NSTextField *outScreen;

@property (weak) IBOutlet NSImageView *LAStatus;

@property (weak) IBOutlet NSImageView *SAStatus;

@property (weak) IBOutlet NSImageView *PPStatus;

@property (weak) IBOutlet NSProgressIndicator *progressBar;

@property (weak) IBOutlet NSTextField *LALable;

@property (weak) IBOutlet NSTextField *SALable;

@property (weak) IBOutlet NSTextField *PPLable;

@property (weak) IBOutlet NSButton *startCompile;

@property (retain) NSFileHandle *errFile;

@property (retain) NSFileHandle *printedFile;

@property (retain) NSData *errData;

@property (retain) NSData *printedData;

@property (retain) NSString *errCont;

@property (retain) NSString *printedCont;

- (IBAction)finishIt:(id)sender;

- (IBAction)startCompileClicked:(id)sender;

- (IBAction)showTheSheet:(id)sender;

- (IBAction)mainNextClicked:(id)sender;

- (IBAction)mainExitClicked:(id)sender;

- (IBAction)folderSelBackClicked:(id)sender;

- (BOOL) checkFileExt:(NSURL*)fileURL;

- (BOOL) checkFolderExist:(NSURL*)folderURL;

- (IBAction)folderExitClicked:(id)sender;

- (IBAction)mainResClicked:(id)sender;

- (IBAction)folderSelResClicked:(id)sender;

- (IBAction)endTheSheet:(id)sender;

- (IBAction)endErrorSheet:(id)sender;

- (IBAction)endSuccessSheet:(id)sender;

- (IBAction)goHome:(id)sender;

@end

