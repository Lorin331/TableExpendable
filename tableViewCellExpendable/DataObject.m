//
//  DataObject.m
//  tableViewCellExpendable
//
//  Created by Raphael Pinto on 22/04/13.
//  Copyright (c) 2013 Raphael Pinto. All rights reserved.
//

#import "DataObject.h"

@implementation DataObject


@synthesize mTitle;
@synthesize mSelected;



- (void)dealloc
{
    [mTitle release];
    [super dealloc];
}

@end
