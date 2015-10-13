#import <UIKit/UIKit.h>
#import "CustomAddNewLeadsTableViewCell.h"

@interface AddNewLeadsVC : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    int j;
    
     NSMutableData *lookServerResponseData;
    NSMutableArray *arr_fields_header;
     NSMutableArray *arr_fields_header_type;
    NSArray *arr_source_name;
    NSArray *arr_source_code;
    BOOL isRemove;
    NSMutableArray * arr_post;
    NSMutableArray *arr_header_maxchar;
    NSMutableArray *arr_header_required;
    NSMutableArray *arr_header_code;
    
    CustomAddNewLeadsTableViewCell *Cell1;
    UITapGestureRecognizer *gestureRecognizer;
    int item;
    UITextField *txtRef,*txtRef1;
    UITextField*txtRef2,*txt_ref_fld;
    NSArray *arr_source_input;
    
    BOOL isFirstPiker,isSecondPiker;
}
@property (weak, nonatomic) IBOutlet UITableView *main_table_view;
- (IBAction)btn_cancel:(id)sender;
- (IBAction)btn_Add:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *view_cover;
@property (weak, nonatomic) IBOutlet UIView *view_table;
@property (weak, nonatomic) IBOutlet UITableView *table_view_source;
@property (weak, nonatomic) IBOutlet UIView *view_picker;
@property (weak, nonatomic) IBOutlet UIDatePicker *picker_view;
- (IBAction)Btn_done_pick:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *picker_2;
- (IBAction)btn_back:(id)sender;
- (IBAction)btn_back2:(id)sender;

@end
