//
//  ExpendableCell.h
//  tableViewCellExpendable
//
//  Created by Raphael Pinto on 22/04/13.
//  Copyright (c) 2013 Raphael Pinto. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DataObject;


@interface ExpendableCell : UITableViewCell



@property (retain, nonatomic) IBOutlet UILabel *mLabel;
@property (retain, nonatomic) IBOutlet UIButton *mArrowButton;
@property (retain, nonatomic) DataObject* mMyDataObject;
@property (retain, nonatomic) IBOutlet UIImageView *mImage;

- (void)updateWithDataObject:(DataObject*)_DataObject;
- (IBAction)onArrowButtonPressed:(id)sender;

@end
