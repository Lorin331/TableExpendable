//
//  FirstViewController.h
//  tableViewCellExpendable
//
//  Created by Raphael Pinto on 22/04/13.
//  Copyright (c) 2013 Raphael Pinto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *mTableView;


@property (nonatomic, retain) NSMutableArray* mDataObjects;


@end
