@interface CalendarViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableData *lookServerResponseData;
    NSArray *arrData;
    IBOutlet UITableView *tbl;
    UISwipeGestureRecognizer *swipeLeft;
    UISwipeGestureRecognizer *swipeRight;
    NSMutableArray *arrMenu;
    IBOutlet UITableView *tblMenu;
    BOOL isSwipe;
    NSDictionary* responseDict;
}
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
- (IBAction)btn_menue:(id)sender;

@end
