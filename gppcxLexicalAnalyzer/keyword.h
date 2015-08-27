//
//  keyword.h
//  gppcx
//
//  Created by Maurious Paul on 02/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Keyword : NSObject{
    
    BOOL isValidKey;
    
    NSString* kw_asm;
    
    NSString* kw_auto;
    
    NSString* kw_bool;
    
    NSString* kw_break;
    
    NSString* kw_case;
    
    NSString* kw_catch;
    
    NSString* kw_char;
    
    NSString* kw_class;
    
    NSString* kw_const;
    
    NSString* kw_const_cast;
    
    NSString* kw_continue;
    
    NSString* kw_default;
    
    NSString* kw_delete;
    
    NSString* kw_do;
    
    NSString* kw_double;
    
    NSString* kw_dynamic_cast;
    
    NSString* kw_else;
    
    NSString* kw_enum;
    
    NSString* kw_explicit;
    
    NSString* kw_export;
    
    NSString* kw_extern;
    
    NSString* kw_false;
    
    NSString* kw_float;
    
    NSString* kw_for;
    
    NSString* kw_friend;
    
    NSString* kw_goto;
    
    NSString* kw_if;
    
    NSString* kw_inline;
    
    NSString* kw_int;
    
    NSString* kw_long;
    
    NSString* kw_mutable;
    
    NSString* kw_namespace;
    
    NSString* kw_new;
    
    NSString* kw_operator;
    
    NSString* kw_private;
    
    NSString* kw_protected;
    
    NSString* kw_public;
    
    NSString* kw_register;
    
    NSString* kw_reinterpret_cast;
    
    NSString* kw_return;
    
    NSString* kw_short;
    
    NSString* kw_signed;
    
    NSString* kw_sizeof;
    
    NSString* kw_static;
    
    NSString* kw_static_cast;
    
    NSString* kw_struct;
    
    NSString* kw_switch;
    
    NSString* kw_template;
    
    NSString* kw_this;
    
    NSString* kw_throw;
    
    NSString* kw_true;
    
    NSString* kw_try;
    
    NSString* kw_typedef;
    
    NSString* kw_typeid;
    
    NSString* kw_typename;
    
    NSString* kw_union;
    
    NSString* kw_unsigned;
    
    NSString* kw_using;
    
    NSString* kw_virtual;
    
    NSString* kw_void;

    NSString* kw_volatile;
    
    NSString* kw_wchar_t;
    
    NSString* kw_while;
    
    NSArray* kw;
    
    NSRegularExpression* alpha;
    
}

@property (retain) NSTextCheckingResult* mat_alp;

@property (retain) NSString* validKey;

@property BOOL isValidKey;

- (void) setKeyword:(NSString*) key;

- (NSString*) getKeyword;

- (BOOL) isValidKeyword:(NSString*) Token;

@end
