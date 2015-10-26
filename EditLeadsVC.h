//
//  EditLeadsVC.h
//  Vymo_test
//
//  Created by User on 08/10/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomEditLeadsCell.h"

@interface EditLeadsVC : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

{
    int j;
    
    NSMutableArray *arr_heading;
    NSMutableArray *arr_code;
    NSMutableArray *arr_required;
    NSMutableArray *arr_type;
    NSMutableArray *arr_max;
    NSMutableArray *arr_min;
    NSMutableArray *arr_update;
    
    CustomEditLeadsCell *Cell;
    
    UITextField *txtRef;
    
    NSArray *arr_occupation_spinner;
    NSArray *arr_income_spinner;
    NSArray *arr_marital_spinner;
    NSArray *arr_children_spinner;
    
    UITapGestureRecognizer *gestureRecognizer;
    
    
    NSMutableArray *arr_code_show;
    NSMutableArray *arr_name_show;
    NSMutableArray *arr_type_show;
    NSMutableArray *arr_value_show;
}


@property (weak, nonatomic) IBOutlet UITableView *table_view;
@property (weak, nonatomic) IBOutlet UIView *view_cover;
@property (weak, nonatomic) IBOutlet UIView *view_table;
@property (weak, nonatomic) IBOutlet UITableView *table_view_popup;
- (IBAction)btnBack:(id)sender;

@end
