//
//  header.m
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "header.h"
#import "lex.h"

@implementation Header

@synthesize mat_hdr;

@synthesize isPrpDir;

@synthesize validHdr;

- (id) init{
    
    self = [super init];
    
    isPrpDir = NO;
    
    hf_algorithm = @"algorithm";
    
    hf_bitset = @"bitset";
    
    hf_cassert = @"cassert";
    
    hf_cctype = @"cctype";
    
    hf_cerrno = @"cerrno";
    
    hf_cfloat = @"cfloat";
    
    hf_ciso646 = @"ciso646";
    
    hf_climits = @"climits";
    
    hf_clocale = @"clocale";
    
    hf_cmath = @"cmath";
    
    hf_complex = @"complex";
    
    hf_csetjmp = @"csetjmp";
    
    hf_csignal = @"csignal";
    
    hf_cstdarg = @"cstdarg";
    
    hf_cstddef = @"cstddef";
    
    hf_cstdio = @"cstdio";
    
    hf_cstdlib = @"cstdlib";
    
    hf_cstring = @"cstring";
    
    hf_ctime = @"ctime";
    
    hf_cwchar = @"cwchar";
    
    hf_cwctype = @"cwctype";
    
    hf_deque = @"deque";
    
    hf_exception = @"exception";
    
    hf_fstream = @"fstream";
    
    hf_functional = @"functional";
    
    hf_iomanip = @"iomanip";
    
    hf_ios = @"ios";
    
    hf_iosfwd = @"iosfwd";
    
    hf_iostream = @"iostream";
    
    hf_istream = @"istream";
    
    hf_iterator = @"iterator";
    
    hf_limits = @"limits";
    
    hf_list = @"list";
    
    hf_locale = @"locale";
    
    hf_map = @"map";
    
    hf_memory = @"memory";
    
    hf_new = @"new";
    
    hf_numeric = @"numeric";
    
    hf_ostream = @"ostream";
    
    hf_queue = @"queue";
    
    hf_set = @"set";
    
    hf_sstream = @"sstream";
    
    hf_stack = @"stack";
    
    hf_stdexcept = @"stdexcept";
    
    hf_streambuf = @"streambuf";
    
    hf_string = @"string";
    
    hf_typeinfo = @"typeinfo";
    
    hf_utility = @"utility";
    
    hf_valarray = @"valarray";
    
    hf_vector = @"vector";
    
    hf = @[hf_algorithm, hf_bitset, hf_complex, hf_deque, hf_exception, hf_fstream, hf_functional, hf_iomanip, hf_ios, hf_iosfwd, hf_iostream, hf_istream, hf_iterator, hf_limits, hf_list, hf_locale, hf_map, hf_memory, hf_new, hf_numeric, hf_ostream, hf_queue, hf_set, hf_sstream, hf_stack, hf_stdexcept, hf_streambuf, hf_string, hf_typeinfo, hf_utility, hf_valarray, hf_vector, hf_cassert, hf_cctype, hf_cerrno, hf_cfloat, hf_ciso646, hf_climits, hf_clocale, hf_cmath, hf_csetjmp, hf_csignal, hf_cstdarg, hf_cstddef, hf_cstdio, hf_cstdlib, hf_cstring, hf_ctime, hf_cwchar, hf_cwctype];
    
    dfnDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*define[\t]*" options:0 error:nil];
    
    eifDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*elif[\t]*" options:0 error:nil];
    
    elsDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*else[\t]*" options:0 error:nil];
    
    endDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*endif[\t]*" options:0 error:nil];
    
    errDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*error[\t]*" options:0 error:nil];
    
    ifDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*if[\t]*" options:0 error:nil];
    
    ifdDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*ifdef[\t]*" options:0 error:nil];
    
    ifnDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*ifndef[\t]*" options:0 error:nil];
    
    ingHdr = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*include[\t]*\\<.*\\>" options:0 error:nil];
    
    inlHdr = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*include[\t*]*\".*\"" options:0 error:nil];
    
    linDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*line[\t]*" options:0 error:nil];
    
    prgDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*pragma[\t]*" options:0 error:nil];
    
    undDir = [NSRegularExpression regularExpressionWithPattern:@"^#[\t]*undef[\t]*" options:0 error:nil];
    
    return self;
}

- (void) setHeader:(NSString*)hdr{
    
    validHdr = hdr;
}

- (NSString*) getHeader{
    
    return validHdr;
}

- (BOOL) isValidHeader:(NSString *)Token withErr:(NSString *)errPath{
    
    NSRange searchRange = NSMakeRange(0, [Token length]);
    NSScanner *scan;
    NSString *invHFile = [[NSString alloc] init];
    NSFileHandle* err = [NSFileHandle fileHandleForUpdatingAtPath:errPath];
    mat_hdr = [ingHdr firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        scan = [NSScanner scannerWithString:Lexeme];
        [scan scanUpToString:@"<" intoString:nil];
    
        while (![scan isAtEnd]) {
            
            NSString* hfile = nil;
            [scan scanString:@"<" intoString:nil];
            
            if ([scan scanUpToString:@">" intoString:&hfile]) {
                
                if ([self isValidHeaderFile:hfile]) {
                    
                    [self setHeader:Lexeme];
                    isPrpDir = YES;
                    return isPrpDir;
                }
                else{
                    
                    
                    isPrpDir = NO;
                    invHFile = [NSString stringWithFormat:@"Invalid header file '%@'\nCompilation terminated.\n", hfile];
                    [err writeData:[invHFile dataUsingEncoding:NSUTF8StringEncoding]];
                    return 0;
                }
            }
        }
    }
    else
        isPrpDir = NO;
    
    mat_hdr = [inlHdr firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [dfnDir firstMatchInString:Token options:0 range:searchRange];

    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [eifDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [elsDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [endDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [errDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [ifdDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [ifDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [ifnDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [linDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [prgDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;

    mat_hdr = [undDir firstMatchInString:Token options:0 range:searchRange];
    
    if (mat_hdr) {
        
        NSString* Lexeme = [Token substringWithRange:[mat_hdr rangeAtIndex:0]];
        [self setHeader:Lexeme];
        isPrpDir = YES;
        return isPrpDir;
    }
    else
        isPrpDir = NO;
    
    return isPrpDir;
}

- (BOOL) isValidHeaderFile:(NSString *)hfile{
    
    BOOL isValidHf = NO;
    
    if ([hf containsObject:hfile]) {
        
        isValidHf = YES;
        return isValidHf;
    }
    else
        isValidHf = NO;
    
    return isValidHf;
}

@end
