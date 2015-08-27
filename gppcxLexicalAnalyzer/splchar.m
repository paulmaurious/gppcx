//
//  splchar.m
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "splchar.h"

@implementation Splchar

@synthesize isValidSpl;

@synthesize validSpl;

- (id) init{
    
    self = [super init];
    
    isValidSpl = NO;
    
    br_cls = @"{";
    
    br_opn = @"}";
    
    es_bks = @"\\";
    
    es_dbq = @"\"";
    
    es_qnm = @"\?";
    
    es_sgq = @"\'";
    
    pn_cls = @"(";
    
    pn_opn = @")";
    
    sp_at = @"@";
    
    sp_dlr = @"$";
    
    sp_hsh = @"#";
    
    sp_qut = @"`";
    
    sp_trm = @";";
    
    sp_uns = @"_";
    
    sq_cls = @"[";
    
    sq_opn = @"]";
    
    spl = @[br_cls, br_opn, es_bks, es_dbq, es_qnm, es_sgq, pn_cls, pn_opn, sp_at, sp_dlr, sp_hsh, sp_qut, sp_trm, sp_uns, sq_cls, sq_opn];
    
    return self;
}

- (void) setSplChar:(NSString *)sp{
    
    validSpl = sp;
}

- (NSString*) getSplChar{
    
    return validSpl;
}

- (BOOL) isValidSplChar:(NSString *)spch{
    
    NSString* sp = [spch substringToIndex:1];
    if ([spl containsObject:sp]) {
        
        isValidSpl = YES;
        [self setSplChar:sp];
    }
    else
        isValidSpl = NO;
    
    return isValidSpl;
}

@end
