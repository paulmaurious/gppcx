//
//  lex.m
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "AppDelegate.h"
#import "lex.h"
#import "keyword.h"
#import "operator.h"
#import "splchar.h"
#import "header.h"

@implementation Lex

@synthesize IDpass;

@synthesize DGTpass;

@synthesize isLexPass;

@synthesize line;

@synthesize order;

@synthesize mat_dgt;

@synthesize mat_id;

- (id) init{
    
    self = [super init];
    
    isLexPass = NO;
    
    order = 0;
    
    line = 1;
    
    IDENT = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]+[a-zA-Z0-9_]*" options:0 error:nil];
    
    DIGIT = [NSRegularExpression regularExpressionWithPattern:@"[0-9]+[.0-9]*" options:0 error:nil];
    
    Lexeme = @"";
    
    validDGT = @"";
    
    validID = @"";
    
    Token = @"";
    
    ASP = @"";
    
    return self;
}

- (void) setID:(NSString *)ident{
    
    validID = ident;
}

- (void) setDGT:(NSString *)digit{
    
    validDGT = digit;
}

- (void) setPath:(NSString *)ASPath{
    
    ASP = ASPath;
}

- (NSString*) getPath{
    
    return ASP;
}

- (NSString*) getDGT{
    
    return validDGT;
}

- (NSString*) getID{
    
    return validID;
}

- (BOOL) isValidDGT:(NSString *)digit{
    
    NSRange searchRange = NSMakeRange(0, [digit length]);
    mat_dgt = [DIGIT firstMatchInString:digit options:0 range:searchRange];
    
    if (mat_dgt) {
        
        [self setDGT:[digit substringWithRange:[mat_dgt rangeAtIndex:0]]];
        DGTpass = YES;
        return DGTpass;
    }
    else
        DGTpass = NO;
    
    return DGTpass;
}

- (BOOL) isValidID:(NSString *)ident{
    
    NSRange searchRange = NSMakeRange(0, [ident length]);
    mat_id = [IDENT firstMatchInString:ident options:0 range:searchRange];
    
    if (mat_id) {
        
        [self setID:[ident substringWithRange:[mat_id rangeAtIndex:0]]];
        IDpass = YES;
        return IDpass;
    }
    else
        IDpass = NO;
    
    return IDpass;
}

- (BOOL) lex:(NSString *)srcPath withSym:(NSString *)symPath withErr:(NSString *)errPath{
    
    Header* h = [[Header alloc] init];
    Keyword* k = [[Keyword alloc] init];
    Operator* o = [[Operator alloc] init];
    Splchar* s = [[Splchar alloc] init];
    NSFileHandle* sym = [NSFileHandle fileHandleForWritingAtPath:symPath];
    NSFileHandle* err = [NSFileHandle fileHandleForWritingAtPath:errPath];
    NSFileHandle* src = [NSFileHandle fileHandleForReadingAtPath:srcPath];
    NSData* srcData = [src readDataToEndOfFile];
    NSString* srcCont = [[NSString alloc] initWithData:srcData encoding:NSUTF8StringEncoding];
    NSArray* lines = [srcCont componentsSeparatedByString:@"\n"];
    NSString* outPut;
    
    if ([srcCont length] != 0) {
        
        for (int i = 0; i < [lines count]; i++) {
            
            Lexeme = [lines objectAtIndex:i];
            NSArray* temp = [Lexeme componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            for (int j = 0; j < [temp count]; j++) {
                
                Token = [temp objectAtIndex:j];
                while ([Token length] != 0) {
                    
                    if ([h isValidHeader:Token withErr:errPath]) {
                        
                        isLexPass = YES;
                        order++;
                        Token = [Token stringByReplacingOccurrencesOfString:[h getHeader] withString:@""];
                        outPut = [NSString stringWithFormat:@"HD %@ %ld %ld\n", [h getHeader], (long)line, (long)order];
                        [sym writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
                        [h setIsPrpDir:NO];
                    }
                    else if ([k isValidKeyword:Token]){
                        
                        isLexPass = YES;
                        order++;
                        Token = [Token stringByReplacingOccurrencesOfString:[k getKeyword] withString:@""];
                        outPut = [NSString stringWithFormat:@"KW %@ %ld %ld\n", [k getKeyword], (long)line, (long)order];
                        [sym writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
                        [k setIsValidKey:NO];
                    }
                    else if([o isValidOpr:Token]){
                        
                        isLexPass = YES;
                        order++;
                        NSRange rng = NSMakeRange(0, 1);
                        Token = [Token stringByReplacingCharactersInRange:rng withString:@""];
                        outPut = [NSString stringWithFormat:@"OP %@ %ld %ld\n", [o getOperator], (long)line, (long)order];
                        [sym writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
                        [o setIsValidOprtr:NO];
                    }
                    else if ([s isValidSplChar:Token]){
                        
                        isLexPass = YES;
                        order++;
                        NSRange rng = NSMakeRange(0, 1);
                        Token = [Token stringByReplacingCharactersInRange:rng withString:@""];
                        outPut = [NSString stringWithFormat:@"SP %@ %ld %ld\n", [s getSplChar], (long)line, (long)order];
                        [sym writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
                        [s setIsValidSpl:NO];
                    }
                    else if ([self isValidID:Token]){
                        
                        isLexPass = YES;
                        order++;
                        Token = [Token stringByReplacingOccurrencesOfString:[self getID] withString:@""];
                        outPut = [NSString stringWithFormat:@"ID %@ %ld %ld\n", [self getID], (long)line, (long)order];
                        [sym writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
                        [self setIDpass:NO];
                    }
                    else if ([self isValidDGT:Token]){
                        
                        isLexPass = YES;
                        order++;
                        Token = [Token stringByReplacingOccurrencesOfString:[self getDGT] withString:@""];
                        outPut = [NSString stringWithFormat:@"DG %@ %ld %ld\n", [self getDGT], (long)line, (long)order];
                        [sym writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
                        [self setDGTpass:NO];
                    }
                    else{
                        
                        isLexPass = NO;
                        order++;
                        outPut = [NSString stringWithFormat:@"Unknown symbol %@ at %ld:%ld\n", Token, (long)order, (long)line];
                        Token = [Token stringByReplacingOccurrencesOfString:Token withString:@""];
                        [err writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
                    }
                }
            }
            line++;
            order = 0;
            outPut = [NSString stringWithFormat:@"----  eol ----\n"];
            [sym writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    else{
        
        outPut = [NSString stringWithFormat:@"Empty File"];
        [err writeData:[outPut dataUsingEncoding:NSUTF8StringEncoding]];
        isLexPass = NO;
    }
    [sym closeFile];
    [err closeFile];
    return isLexPass;
}

@end


