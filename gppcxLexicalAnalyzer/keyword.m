//
//  keyword.m
//  gppcx
//
//  Created by Maurious Paul on 02/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "keyword.h"

@implementation Keyword

@synthesize validKey;

@synthesize isValidKey;

@synthesize mat_alp;

- (id) init{
    
    self = [super init];
    
    isValidKey = NO;
    
    kw_asm = @"asm";
    
    kw_auto = @"auto";
    
    kw_bool = @"bool";
    
    kw_break = @"break";
    
    kw_case = @"case";
    
    kw_catch = @"catch";
    
    kw_char = @"char";
    
    kw_class = @"class";
    
    kw_const = @"const";
    
    kw_const_cast = @"const_cast";
    
    kw_continue = @"continue";
    
    kw_default = @"default";
    
    kw_delete = @"delete";
    
    kw_do = @"do";
    
    kw_double = @"double";
    
    kw_dynamic_cast = @"dynamic_cast";
    
    kw_else = @"else";
    
    kw_enum = @"enum";
    
    kw_explicit = @"explicit";
    
    kw_export = @"export";
    
    kw_extern = @"extern";
    
    kw_false = @"false";
    
    kw_float = @"float";
    
    kw_for = @"for";
    
    kw_friend = @"friend";
    
    kw_goto = @"goto";
    
    kw_if = @"if";
    
    kw_inline = @"inline";
    
    kw_int = @"int";
    
    kw_long = @"long";
    
    kw_mutable = @"mutable";
    
    kw_namespace = @"namespace";
    
    kw_new = @"new";
    
    kw_operator = @"operator";
    
    kw_private = @"private";
    
    kw_protected = @"protected";
    
    kw_public = @"public";
    
    kw_register = @"register";
    
    kw_reinterpret_cast = @"reinterpret_cast";
    
    kw_return = @"return";
    
    kw_short = @"short";
    
    kw_signed = @"signed";
    
    kw_sizeof = @"sizeof";
    
    kw_static = @"static";
    
    kw_static_cast = @"static_cast";
    
    kw_struct = @"struct";
    
    kw_switch = @"switch";
    
    kw_template = @"template";
    
    kw_this = @"this";
    
    kw_throw = @"throw";
    
    kw_true = @"true";
    
    kw_try = @"try";
    
    kw_typedef = @"typedef";
    
    kw_typeid = @"typeid";
    
    kw_typename = @"typename";
    
    kw_union = @"union";
    
    kw_unsigned = @"unsigned";
    
    kw_using = @"using";
    
    kw_virtual = @"virtual";
    
    kw_void = @"void";
    
    kw_volatile = @"volatile";
    
    kw_wchar_t = @"wchar_t";
    
    kw_while = @"while";
    
    kw = @[kw_asm, kw_auto, kw_bool, kw_break, kw_case, kw_catch, kw_char, kw_class, kw_const, kw_const_cast, kw_continue, kw_default, kw_delete, kw_do, kw_double, kw_dynamic_cast, kw_else, kw_enum, kw_explicit, kw_export, kw_extern, kw_false, kw_float, kw_for, kw_friend, kw_goto, kw_if, kw_inline, kw_int, kw_long, kw_mutable, kw_namespace, kw_new, kw_operator, kw_private, kw_protected, kw_public, kw_register, kw_reinterpret_cast, kw_return, kw_short, kw_signed, kw_sizeof, kw_static, kw_static_cast, kw_struct, kw_switch, kw_template, kw_this, kw_throw, kw_true, kw_try, kw_typedef, kw_typeid, kw_typename, kw_union, kw_unsigned, kw_using, kw_virtual, kw_void, kw_volatile, kw_wchar_t, kw_while];
            
    alpha = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z]+" options:0 error:nil];
    
    return self;
}

- (void) setKeyword:(NSString*)key{
    
    validKey = key;
}

- (NSString*) getKeyword{
    
    return validKey;
}

- (BOOL) isValidKeyword:(NSString *)Token{
    
    NSRange searchRange = NSMakeRange(0, [Token length]);
    mat_alp = [alpha firstMatchInString:Token options:0 range:searchRange];
               
    if(mat_alp){
        
        NSString* Lexeme = [Token substringWithRange:[mat_alp rangeAtIndex:0]];
        if ([kw containsObject:Lexeme]){
            
            isValidKey = YES;
            [self setKeyword:Lexeme];
        }
        else
            isValidKey = NO;
    }
    return isValidKey;
}

@end
