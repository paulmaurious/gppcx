//
//  gppcxLexicalAnalyzer.h
//  gppcxLexicalAnalyzer
//
//  Created by Maurious Paul on 19/07/15.
//  Copyright (c) 2015 M.A.K.E. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lex.h"

@interface gppcxLexicalAnalyzer : NSObject{
    
    __strong Lex *l;
}

@property (retain)Lex *l;

- (id)init;

- (id)getLexObject;

@end
