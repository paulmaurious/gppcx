//
//  operator.m
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "operator.h"

@implementation Operator

@synthesize isValidOprtr;

@synthesize validOprtr;

- (id) init{
    
    self = [super init];
    
    isValidOprtr = NO;
    
    ar_add = @"+";
    
    ar_div = @"/";
    
    ar_mod = @"%";
    
    ar_mul = @"*";
    
    ar_sub = @"-";
    
    bw_cmp = @"~";
    
    bw_xor = @"^";
    
    lg_and = @"&";
    
    lg_not = @"!";
    
    lg_or = @"|";
    
    rl_eql = @"=";
    
    rl_gt = @">";
    
    rl_lt = @"<";
    
    sp_cma = @",";
    
    sp_dot = @".";
    
    sp_scp = @":";
    
    opr = @[ar_add, ar_div, ar_mod, ar_mul, ar_sub, bw_cmp, bw_xor, lg_and, lg_not, lg_or, rl_eql, rl_gt, rl_lt,  sp_cma, sp_dot, sp_scp];
    
    return self;

}

- (void) setOperator:(NSString *)op{
    
    validOprtr = op;
}

- (NSString*) getOperator{
    
    return validOprtr;
}

- (BOOL) isValidOpr:(NSString *)oprtr{
    
    NSString* op = [oprtr substringToIndex:1];
    if ([opr containsObject:op]) {
        
        isValidOprtr = YES;
        [self setOperator:op];
    }
    else
        isValidOprtr = NO;
    
    return isValidOprtr;
}

@end
