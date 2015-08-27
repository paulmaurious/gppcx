//
//  lex.h
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lex : NSObject{
    
    BOOL isLexPass;                     //Tells that Lexical Analysis is carried out without any errors if set to true.
    
    NSInteger order;                    //Tracks the order of tokens by numbering them.
    
    NSInteger line;                     //Tracks the line number.
    
    NSRegularExpression* IDENT;         //IDENTIFIER regular expression.
    
    NSRegularExpression* DIGIT;         //DIGIT regular expression.
    
    NSString* Lexeme;                   //Matching string pattern from input buffer.
    
    NSString* validID;                  //Temporary use of setters and getters for IDENTIFIER.
    
    NSString* validDGT;                 //Temporary use of setters and getters for DIGIT.
    
    BOOL IDpass;                        //Sets to true if IDENTIFIER pattern matches with string from input buffer.
    
    BOOL DGTpass;                       //Sets to true if DIGIT pattern matches with string from input buffer.
    
    NSString* Token;
    
    NSString* ASP;

}

@property BOOL isLexPass;

@property NSInteger order;

@property NSInteger line;

@property BOOL IDpass;

@property BOOL DGTpass;

@property (retain) NSTextCheckingResult* mat_id;

@property (retain) NSTextCheckingResult* mat_dgt;

- (void) setID:(NSString*) ident;

- (void) setDGT:(NSString*) digit;

- (void) setPath:(NSString*) ASPath;

- (NSString*) getPath;

- (NSString*) getID;

- (NSString*) getDGT;

- (BOOL) isValidID:(NSString*) ident;

- (BOOL) isValidDGT:(NSString*) digit;

- (BOOL) lex:(NSString*)srcPath withSym:(NSString*)symPath withErr:(NSString*)errPath;

@end
