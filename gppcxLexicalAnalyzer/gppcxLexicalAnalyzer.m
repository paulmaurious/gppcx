//
//  gppcxLexicalAnalyzer.m
//  gppcxLexicalAnalyzer
//
//  Created by Maurious Paul on 19/07/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import "gppcxLexicalAnalyzer.h"

@implementation gppcxLexicalAnalyzer

@synthesize l = __l;

- (id)init{
    
    self = [super init];
    
    l = [[Lex alloc] init];
    
    return self;
}

- (id)getLexObject{
    
    return l;
}

@end
