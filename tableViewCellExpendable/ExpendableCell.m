//
//  ExpendableCell.m
//  tableViewCellExpendable
//
//  Created by Raphael Pinto on 22/04/13.
//  Copyright (c) 2013 Raphael Pinto. All rights reserved.
//

#import "ExpendableCell.h"
#import "DataObject.h"



@implementation ExpendableCell


@synthesize mMyDataObject;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [mMyDataObject release];
    [_mLabel release];
    [_mArrowButton release];
    [_mImage release];
    [super dealloc];
}



#pragma mark -
#pragma mark User Interaction Method



- (IBAction)onArrowButtonPressed:(id)sender
{	
	mMyDataObject.mSelected = !mMyDataObject.mSelected;
    
    [self updateArrow];
    
    if (mMyDataObject.mSelected)
	{
		[self enlargeImage];
	}
	else
	{
		[self reduceImage];
	}

    
	[[NSNotificationCenter defaultCenter] postNotificationName:@"onArrowButtonPressed" object:self];
}



#pragma mark -
#pragma mark View Update Methods



- (void)updateWithDataObject:(DataObject*)_DataObject
{
    self.mMyDataObject = _DataObject;
    
    _mLabel.text = _DataObject.mTitle;
    
    [self updateArrow];
}


- (void)updateArrow
{
    if (mMyDataObject.mSelected)
	{
		[_mArrowButton setImage:[UIImage imageNamed:@"icon_friends_arrow_up.png"] forState:UIControlStateNormal];
	}
	else
	{
		[_mArrowButton setImage:[UIImage imageNamed:@"icon_friends_arrow_down.png"] forState:UIControlStateNormal];
	}
}


- (void)enlargeImage
{
    [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionAllowAnimatedContent animations:^
     {
         _mImage.frame = CGRectMake(0, 0, 320  , 300);
         _mImage.image = [UIImage imageNamed:@"Kabutops.gif"];
         _mLabel.hidden = TRUE;
     }completion:^(BOOL finished){}];
}


- (void)reduceImage
{
    [UIView transitionWithView:self duration:0.3 options:UIViewAnimationOptionAllowAnimatedContent animations:^
     {
         _mImage.frame = CGRectMake(0, 0, 50, 50);
         _mImage.image = [UIImage imageNamed:@"140"];
         _mLabel.hidden = FALSE;
     }completion:^(BOOL finished){}];
}

@end
