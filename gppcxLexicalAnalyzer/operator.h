//
//  operator.h
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Operator : NSObject{
    
    BOOL isValidOprtr;
    
    NSString* ar_add;         //'+'
    
    NSString* ar_sub;         //'-'
    
    NSString* ar_mul;         //'*'
    
    NSString* ar_div;         //'/'
    
    NSString* ar_mod;         //'%'
    
    NSString* rl_eql;         //'='
    
    NSString* rl_gt;          //'>'
    
    NSString* rl_lt;          //'<'
    
    NSString* lg_and;         //'&'
    
    NSString* lg_or;          //'|'
    
    NSString* lg_not;         //'!'
    
    NSString* bw_xor;         //'^'
    
    NSString* bw_cmp;         //'~'
    
    NSString* sp_dot;         //'.'
    
    NSString* sp_cma;         //','
    
    NSString* sp_scp;         //':'
 
    NSArray* opr;
}

@property BOOL isValidOprtr;

@property (retain) NSString* validOprtr;

- (void) setOperator:(NSString*) op;

- (NSString*) getOperator;

- (BOOL) isValidOpr:(NSString*) oprtr;

@end
