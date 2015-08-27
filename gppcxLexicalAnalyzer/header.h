//
//  header.h
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Header : NSObject{
    
    BOOL isPrpDir;
    
    NSString* hf_algorithm;
    
    NSString* hf_bitset;
    
    NSString* hf_complex;
    
    NSString* hf_deque;
    
    NSString* hf_exception;
    
    NSString* hf_fstream;
    
    NSString* hf_functional;
    
    NSString* hf_iomanip;
    
    NSString* hf_ios;
    
    NSString* hf_iosfwd;
    
    NSString* hf_iostream;
    
    NSString* hf_istream;
    
    NSString* hf_iterator;
    
    NSString* hf_limits;
    
    NSString* hf_list;
    
    NSString* hf_locale;
    
    NSString* hf_map;
    
    NSString* hf_memory;
    
    NSString* hf_new;
    
    NSString* hf_numeric;
    
    NSString* hf_ostream;
    
    NSString* hf_queue;
    
    NSString* hf_set;
    
    NSString* hf_sstream;
    
    NSString* hf_stack;
    
    NSString* hf_stdexcept;
    
    NSString* hf_streambuf;
    
    NSString* hf_string;
    
    NSString* hf_typeinfo;
    
    NSString* hf_utility;
    
    NSString* hf_valarray;
    
    NSString* hf_vector;
    
    NSString* hf_cassert;
    
    NSString* hf_cctype;
    
    NSString* hf_cerrno;
    
    NSString* hf_cfloat;
    
    NSString* hf_ciso646;
    
    NSString* hf_climits;
    
    NSString* hf_clocale;
    
    NSString* hf_cmath;
    
    NSString* hf_csetjmp;
    
    NSString* hf_csignal;
    
    NSString* hf_cstdarg;
    
    NSString* hf_cstddef;
    
    NSString* hf_cstdio;
    
    NSString* hf_cstdlib;
    
    NSString* hf_cstring;
    
    NSString* hf_ctime;
    
    NSString* hf_cwchar;
    
    NSString* hf_cwctype;
    
    NSArray* hf;
    
    NSRegularExpression* inlHdr;              //HEADER pattern for "#include""".
    
    NSRegularExpression* ingHdr;              //HEADER pattern for "#include<>".
    
    NSRegularExpression* ifDir;               //Preprocessor pattern for "#if".
    
    NSRegularExpression* elsDir;              //Preprocessor pattern for "#else".
    
    NSRegularExpression* endDir;              //Preprocessor pattern for "#endif".
    
    NSRegularExpression* dfnDir;              //Preprocessor pattern for "#define".
    
    NSRegularExpression* linDir;              //Preprocessor pattern for "#line".
    
    NSRegularExpression* ifnDir;              //Preprocessor pattern for "#ifndef".
    
    NSRegularExpression* eifDir;              //Preprocessor pattern for "#elif".
    
    NSRegularExpression* errDir;              //Preprocessor pattern for "#error".
    
    NSRegularExpression* ifdDir;              //Preprocessor pattern for "#ifdef".
    
    NSRegularExpression* undDir;              //Preprocessor pattern for "#undef".
    
    NSRegularExpression* prgDir;              //Preprocessor pattern for "#pragma".
    
}

@property BOOL isPrpDir;

@property (retain) NSString* validHdr;

@property (retain) NSTextCheckingResult* mat_hdr;

- (void) setHeader:(NSString*) hdr;

- (NSString*) getHeader;

- (BOOL) isValidHeader:(NSString*) Token withErr:(NSString*) errPath;

- (BOOL) isValidHeaderFile:(NSString*) hfile;

@end
