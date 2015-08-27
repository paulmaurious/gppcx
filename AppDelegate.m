//
//  AppDelegate.m
//  gppcx
//
//  Created by Maurious Paul on 01/07/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "AppDelegate.h"
#import "gppcxLexicalAnalyzer.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *splashScreen;

@property (weak) IBOutlet NSProgressIndicator *loadApplication;

@property (weak) IBOutlet NSWindow *mainWindow;

@property (weak) IBOutlet NSWindow *destFolderWindow;

@property (weak) IBOutlet NSWindow *resultWindow;

@property (weak) IBOutlet NSWindow *outputWindow;

@end

@implementation AppDelegate

@synthesize mainWindow;

@synthesize destFolderWindow;

@synthesize mainNext;

@synthesize outputWindow;

@synthesize fileStatus;

@synthesize folderSelBack;

@synthesize folderNext;

@synthesize folderStatus;

@synthesize srcFilePath;

@synthesize destFolderPath;

@synthesize fmgr;

@synthesize symPath;

@synthesize errPath;

@synthesize appSupDirPath;

@synthesize destFilePath;

@synthesize compileConfirm;

@synthesize resultWindow;

@synthesize LALable;

@synthesize LAStatus;

@synthesize SALable;

@synthesize SAStatus;

@synthesize startCompile;

@synthesize PPLable;

@synthesize PPStatus;

@synthesize progressBar;

@synthesize compileError;

@synthesize compileSuccess;

@synthesize errCont;

@synthesize errData;

@synthesize errFile;

@synthesize printedCont;

@synthesize printedData;

@synthesize printedFile;

@synthesize outScreen;

@synthesize splashScreen;

@synthesize loadApplication;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [splashScreen setBackgroundColor:[NSColor whiteColor]];
    [splashScreen setAlphaValue:0.95f];
    [self startProgressBar:loadApplication];
    while ([self incrementLoadApplication]) {
        
        [self performSelector:@selector(incrementLoadApplication) withObject:self afterDelay:1];
    }
    [splashScreen close];
    [mainWindow setIsVisible:YES];
    [mainWindow setTitlebarAppearsTransparent:YES];
    [mainWindow setBackgroundColor:[NSColor whiteColor]];
    [mainWindow setAlphaValue:0.95f];
    [destFolderWindow setTitlebarAppearsTransparent:YES];
    [destFolderWindow setBackgroundColor:[NSColor whiteColor]];
    [destFolderWindow setAlphaValue:0.95f];
    [resultWindow setTitlebarAppearsTransparent:YES];
    [resultWindow setBackgroundColor:[NSColor whiteColor]];
    [resultWindow setAlphaValue:0.95f];
    [outputWindow setTitlebarAppearsTransparent:YES];
    [outputWindow setBackgroundColor:[NSColor whiteColor]];
    [outputWindow setAlphaValue:0.95f];
    fmgr = [NSFileManager defaultManager];

    NSURL* appSupDir = nil;
    NSArray* urls = [fmgr URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask];
    
    if ([urls count] > 0) {
        
        appSupDir = [[urls objectAtIndex:0] URLByAppendingPathComponent:@"ent.make.gppcx" isDirectory:YES];
    }
    
    appSupDirPath = [appSupDir path];
    [fmgr createDirectoryAtPath:appSupDirPath withIntermediateDirectories:NO attributes:nil error:nil];
    symPath = [NSString stringWithFormat:@"%@%@", appSupDirPath, @"/symbol.tbl"];
    errPath = [NSString stringWithFormat:@"%@%@", appSupDirPath, @"/error.log"];
    [fmgr createFileAtPath:symPath contents:nil attributes:nil];
    [fmgr createFileAtPath:errPath contents:nil attributes:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)finishIt:(id)sender {
    
    [NSApp terminate:self];
}

- (IBAction)startCompileClicked:(id)sender {
    
    gppcxLexicalAnalyzer *gla = [[gppcxLexicalAnalyzer alloc] init];
    printedFile = [NSFileHandle fileHandleForReadingAtPath:destFilePath];
    BOOL dummyLex = [[gla getLexObject] lex:srcFilePath withSym:symPath withErr:errPath];
    BOOL dummySyntax = YES;
    BOOL dummyPrint = YES;
    errFile = [NSFileHandle fileHandleForReadingAtPath:errPath];
    errData = [errFile readDataToEndOfFile];
    errCont = [[NSString alloc] initWithData:errData encoding:NSUTF8StringEncoding];
    [destFolderWindow close];
    [resultWindow setIsVisible:YES];
    [LAStatus setHidden:NO];
    [LALable setHidden:NO];
    [SAStatus setHidden:YES];
    [SALable setHidden:YES];
    [PPStatus setHidden:YES];
    [PPLable setHidden:YES];
    if (dummyLex && ([errCont length] == 0)) {
        
        [LAStatus setImage:[NSImage imageNamed:@"PROGSUCC_64"]];
        [self startProgressBar:self];
        [SALable setHidden:NO];
        [SAStatus setHidden:NO];
    }
    else{
        
        [LAStatus setImage:[NSImage imageNamed:@"PROGFAIL_64"]];
        [self startProgressBar:progressBar];
        [SALable setHidden:NO];
        [SAStatus setHidden:NO];
    }
    if (dummySyntax) {
        
        [SAStatus setImage:[NSImage imageNamed:@"PROGSUCC_64"]];
        [self incrementProgressBar];
        [PPLable setHidden:NO];
        [PPStatus setHidden:NO];
    }
    else{
        
        [SAStatus setImage:[NSImage imageNamed:@"PROGFAIL_64"]];
        [self incrementProgressBar];
        [PPLable setHidden:NO];
        [PPStatus setHidden:NO];
    }
    if (dummyPrint) {
        
        [PPStatus setImage:[NSImage imageNamed:@"PROGSUCC_64"]];
        [self incrementProgressBar];
    }
    else{
        
        [PPStatus setImage:[NSImage imageNamed:@"PROGFAIL_64"]];
        [self incrementProgressBar];
    }
    if (dummyPrint && dummyLex && dummySyntax && ([errCont length] == 0)) {
        
        [resultWindow beginSheet:compileSuccess completionHandler:^(NSModalResponse returnCode) {
            
        }];
    }
    else{
        
        [resultWindow beginSheet:compileError completionHandler:^(NSModalResponse returnCode) {
            
        }];
    }
}

- (IBAction)showTheSheet:(id)sender {
    
    NSString* filePrefix = @"pp_";
    NSString *oldFileName = [[srcFilePath lastPathComponent] stringByDeletingPathExtension];
    NSString* newFileName = [[NSString stringWithFormat:@"%@%@", filePrefix, oldFileName] stringByAppendingPathExtension:@"cpp"];
    fmgr = [NSFileManager defaultManager];
    destFilePath = [destFolderPath stringByAppendingString:[NSString stringWithFormat:@"/%@", newFileName]];
    [fmgr createFileAtPath:destFilePath contents:nil attributes:nil];
    [destFolderWindow beginSheet:compileConfirm completionHandler:^(NSModalResponse returnCode) {

    }];
}

- (IBAction)mainNextClicked:(id)sender {
    
    [mainWindow setIsVisible:NO];
    [destFolderWindow setIsVisible:YES];
}

- (IBAction)mainExitClicked:(id)sender {
    
    NSAlert* confExit = [[NSAlert alloc] init];
    [confExit addButtonWithTitle:@"Proceed"];
    [confExit addButtonWithTitle:@"Cancel"];
    [confExit setMessageText:@"Are you sure to exit?"];
    [confExit setInformativeText:@"You are about to exit. Please select Proceed to confirm exit or Cancel to deny exit."];
    [confExit setAlertStyle:NSWarningAlertStyle];
    [confExit beginSheetModalForWindow:mainWindow completionHandler:^(NSModalResponse returnCode) {
        
        if (returnCode == NSAlertFirstButtonReturn) {
            
            [NSApp terminate:self];
        }
    }];
}

- (IBAction)folderSelBackClicked:(id)sender {
    
    [destFolderWindow setIsVisible:NO];
    [mainWindow setIsVisible:YES];
    [fileStatus setImage:[NSImage imageNamed:@"FILEOK_256"]];
}

- (BOOL)checkFileExt:(NSURL *)fileURL{
    
    srcFilePath = [[NSString alloc] initWithString:[fileURL path]];
    NSString *fileName = [srcFilePath lastPathComponent];
    NSArray *fileTypes = @[@"C", @"cc", @"cxx", @"cpp", @"c++"];
    if ([fileTypes containsObject:[fileName pathExtension]]) {
        
        [fileStatus setImage:[NSImage imageNamed:@"FILEOK_256"]];
        [mainNext setEnabled:YES];
        return YES;
    }
    else{
        
        [fileStatus setImage:[NSImage imageNamed:@"FILENOTOK_256"]];
        [mainNext setEnabled:NO];
        return NO;
    }
}

- (IBAction)folderExitClicked:(id)sender {
    
    NSAlert* confExit = [[NSAlert alloc] init];
    [confExit addButtonWithTitle:@"Proceed"];
    [confExit addButtonWithTitle:@"Cancel"];
    [confExit setMessageText:@"Are you sure to exit?"];
    [confExit setInformativeText:@"You are about to exit. Please select Proceed to confirm exit or Cancel to deny exit."];
    [confExit setAlertStyle:NSWarningAlertStyle];
    [confExit beginSheetModalForWindow:destFolderWindow completionHandler:^(NSModalResponse returnCode) {
        
        if (returnCode == NSAlertFirstButtonReturn) {
            
            [NSApp terminate:self];
        }
    }];
}

- (IBAction)mainResClicked:(id)sender {
    
    [fileStatus setImage:[NSImage imageNamed:@"ADDFILE_256"]];
    [mainNext setEnabled:NO];
}

- (IBAction)folderSelResClicked:(id)sender {
    
    [folderStatus setImage:[NSImage imageNamed:@"ADDFOLDER_256"]];
    [folderNext setEnabled:NO];
}

- (BOOL)checkFolderExist:(NSURL *)folderURL{
    
    destFolderPath = [[NSString alloc] initWithString:[folderURL path]];
    BOOL isDir;

    if ([fmgr fileExistsAtPath:destFolderPath isDirectory:&isDir] && isDir) {
        
        [folderStatus setImage:[NSImage imageNamed:@"FOLDEROK_256"]];
        [folderNext setEnabled:YES];
        return YES;
    }
    else{
        
        [fileStatus setImage:[NSImage imageNamed:@"FOLDERNOTOK_256"]];
        [folderNext setEnabled:NO];
        return NO;
    }
}

- (IBAction)endTheSheet:(id)sender {
    
    [destFolderWindow endSheet:compileConfirm];
}

- (IBAction)endErrorSheet:(id)sender {
    
    [resultWindow endSheet:compileError];
    [resultWindow close];
    [outputWindow setIsVisible:YES];
    errFile = [NSFileHandle fileHandleForReadingAtPath:errPath];
    errData = [errFile readDataToEndOfFile];
    errCont = [[NSString alloc] initWithData:errData encoding:NSUTF8StringEncoding];
    [outScreen setStringValue:errCont];
}

- (IBAction)endSuccessSheet:(id)sender {
    
    [resultWindow endSheet:compileSuccess];
    [resultWindow close];
    [outputWindow setIsVisible:YES];
    NSFileHandle *symFile = [NSFileHandle fileHandleForReadingAtPath:symPath];
    NSData *symData = [symFile readDataToEndOfFile];
    NSString *symCont = [[NSString alloc] initWithData:symData encoding:NSUTF8StringEncoding];
    [outScreen setStringValue:symCont];
}

- (IBAction)goHome:(id)sender {
    
    [outputWindow close];
    [mainWindow setIsVisible:YES];
    [self performSelector:@selector(mainResClicked:) withObject:self];
    [self performSelector:@selector(folderSelResClicked:) withObject:self];
}
     
- (IBAction)startProgressBar:(id)sender
{
    // Initialize the progress bar to go from 0 to 100
    [sender setMinValue:0.0];
    [sender setMaxValue:99.0];
    [sender setDoubleValue:0.0];
    
    // Start the auto-increment calls
    //[self incrementProgressBar];
    [self incrementLoadApplication];
}

- (void)incrementProgressBar
{
    // Increment the progress bar value by 30
    [progressBar incrementBy:33.0];
}

- (BOOL)incrementLoadApplication
{
    // Increment the progress bar value by 1
    [loadApplication incrementBy:1.0];
    
    // If the progress bar hasn't reached 100 yet, then wait a second and call again
    if([loadApplication doubleValue] < [loadApplication maxValue])
        return YES;
    else
        return NO;
}

@end
