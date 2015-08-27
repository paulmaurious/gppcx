//
//  splchar.h
//  gppcx
//
//  Created by Maurious Paul on 03/05/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Splchar : NSObject{
    
    BOOL isValidSpl;
    
    NSString* es_sgq;         //'\''
    
    NSString* es_dbq;         //'\"'
    
    NSString* es_qnm;         //'\?'
    
    NSString* es_bks;         //'\\'
    
    NSString* pn_opn;         //'('
    
    NSString* pn_cls;         //')'
    
    NSString* br_opn;         //'{'
    
    NSString* br_cls;         //'}'
    
    NSString* sp_qut;         //'`'
    
    NSString* sp_trm;         //';'
    
    NSString* sq_opn;         //'['
    
    NSString* sq_cls;         //']'
    
    NSString* sp_uns;         //'_'
    
    NSString* sp_at;          //'@'
    
    NSString* sp_hsh;         //'#'
    
    NSString* sp_dlr;         //'$'
    
    NSArray* spl;

}

@property BOOL isValidSpl;

@property (retain) NSString* validSpl;

- (void) setSplChar:(NSString*) sp;

- (NSString*) getSplChar;

- (BOOL) isValidSplChar:(NSString*) spch;

@end
