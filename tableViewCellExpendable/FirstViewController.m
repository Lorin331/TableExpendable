//
//  FirstViewController.m
//  tableViewCellExpendable
//
//  Created by Raphael Pinto on 22/04/13.
//  Copyright (c) 2013 Raphael Pinto. All rights reserved.
//

#import "FirstViewController.h"
#import "DataObject.h"
#import "ExpendableCell.h"



@interface FirstViewController ()

@end

@implementation FirstViewController



@synthesize mDataObjects;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(expendCell:) name:@"onArrowButtonPressed" object:nil];
        
        self.mDataObjects = [NSMutableArray array];
        for (int i = 0; i < 45 ; i++)
        {
            DataObject* lDataObject = [[DataObject alloc] init];
            lDataObject.mTitle = [NSString stringWithFormat:@"Titre numéro : %i", i];
            lDataObject.mSelected = FALSE;
            [mDataObjects addObject:lDataObject];
            [lDataObject release];
        }
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"onArrowButtonPressed" object:nil];
    
    [mDataObjects release];
    [_mTableView release];
    [super dealloc];
}



#pragma mark -
#pragma mark UITableView DataSource Methods



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"ExpendableCell";
    ExpendableCell *cell = (ExpendableCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil];
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[ExpendableCell class]])
                cell = (ExpendableCell *)oneObject;
    }
    
    DataObject* currentObject = [mDataObjects objectAtIndex:indexPath.row];
    [cell updateWithDataObject:currentObject];
	
	return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [mDataObjects count];
}



#pragma mark -
#pragma mark UITableView Delegate Methods



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataObject* currentObject		= [mDataObjects objectAtIndex:indexPath.row];
    if(currentObject.mSelected)
    {
        return 300;
    }
    else
    {
        return 50;
    }
}



#pragma mark -
#pragma mark View Update Methods



- (void)expendCell:(NSNotification*)_Notification
{
    NSLog(@"%@", [_Notification object]);
	[_mTableView reloadRowsAtIndexPaths:[_mTableView indexPathsForSelectedRows] withRowAnimation:UITableViewRowAnimationTop];
}



@end
