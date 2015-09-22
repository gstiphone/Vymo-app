#import <UIKit/UIKit.h>

@interface Achivements : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
   IBOutlet UIScrollView *scroll1;
   IBOutlet UIScrollView *scroll2;
    UILabel *lbl1;
    UILabel *lbl2;
    UILabel *lbl3;
    NSArray *arrRM;
    IBOutlet UIButton *btnCalculator;
    IBOutlet UIButton *btnSettingsl;
    IBOutlet UIButton *btninfo;
    IBOutlet UIButton *btnAddGoal;
    UIView *vwGoal;
    UIButton *btnDropdown;
    UITableView *tblDropDownGoal;
    NSArray *arrFetchdata;
    NSArray *arrFetchdata2;
    BOOL category;
    int iD;
    NSString *strRepsType;
    UIView *vwPopup;
    UIButton *btnCancel;
    UIButton *btnSave;
    UILabel *lblType;
    UILabel *lblWeight;
    UIButton *btnTypeDropdown;
    UITextField *txtWeight;
    UITableView *tblStat;
    NSArray *arrStat;
    NSMutableArray *arrValues;
    IBOutlet UIView *vwCalculator;

    
}
@end
