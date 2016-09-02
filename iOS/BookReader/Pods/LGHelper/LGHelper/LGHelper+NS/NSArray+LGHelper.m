//
//  NSArray+LGHelper.m
//  LGHelper
//
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Grigory Lutkov <Friend.LGA@gmail.com>
//  (https://github.com/Friend-LGA/LGHelper)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "NSArray+LGHelper.h"
#import "NSDictionary+LGHelper.h"

@implementation NSArray (LGHelper)

#pragma mark -

- (NSArray *)arrayByRemovingNullObjects
{
    NSMutableArray *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    
    NSUInteger iMax = [replaced count];

    for (NSUInteger i = 0; i < iMax; i++)
    {
        id object = [replaced objectAtIndex:i];
        
        if (object == nul)
        {
            [replaced removeObjectAtIndex:i];
            i--;
            iMax--;
        }
        else if ([object isKindOfClass:[NSDictionary class]])
            [replaced replaceObjectAtIndex:i withObject:[object dictionaryByRemovingNullObjects]];
        else if ([object isKindOfClass:[NSArray class]])
            [replaced replaceObjectAtIndex:i withObject:[object arrayByRemovingNullObjects]];
    }
    
    return [replaced copy];
}

@end