#import "CalendarViewController.h"
#import "calenderTableViewCell.h"
#import "MenuTableViewCell.h"
#import "LeadsVW.h"
#import "UpDateLead.h"
#import "SettingsViewController.h"
#import "Details.h"
#import "UpdateViewController.h"


@interface CalendarViewController ()

@end

@implementation CalendarViewController
@synthesize firstView,secondView;
- (void)viewDidLoad {
    
    firstView.hidden=YES;
    secondView.hidden=YES;
    
    [super viewDidLoad];
    arrMenu=[[NSMutableArray alloc]init];
    [arrMenu addObject:@"Calendar"];
    [arrMenu addObject:@"Updates"];
    [arrMenu addObject:@"Leads"];
    [arrMenu addObject:@"Settings"];
    [self  performSelector:@selector(getdata) withObject:nil afterDelay:1 ];
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    // Do any additional setup after loading the view.
}
- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        //  NSLog(@"Left Swipe");
        firstView.hidden=NO;
        secondView.hidden=NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            secondView.frame=CGRectMake(-158, 66, 152, self.view.bounds.size.height-50);
            firstView.frame=CGRectMake(-320, 66, 320, self.view.bounds.size.height-50);
            
        }];
        
        
    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        //  NSLog(@"Right Swipe");
        firstView.hidden=NO;
        secondView.hidden=NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            secondView.frame=CGRectMake(0, 66, 152, self.view.bounds.size.height-50);
            firstView.frame=CGRectMake(0, 66, 320, self.view.bounds.size.height-50);
            
        }];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getdata
{
    sleep(5);
    NSURL *url=[NSURL URLWithString:@"http://vymo-ios.herokuapp.com/alerts"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];
//    NSArray *objects = [NSArray arrayWithObjects:[[NSUserDefaults standardUserDefaults]valueForKey:@"authString_default"],nil];
//    NSArray *keys = [NSArray arrayWithObjects:@"auth_token", nil];
    
//    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"authString_default"]);
//    NSDictionary *questionDict = [NSDictionary dictionaryWithObject:[[NSUserDefaults standardUserDefaults]valueForKey:@"authString_default"] forKey:@"auth_token"];
//    NSLog(@"%@",questionDict);
//    NSError *error=nil;
//    NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:questionDict options:0 error:&error];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPBody: jsonData];
    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self];
    [connection start];

}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    lookServerResponseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [lookServerResponseData appendData:data];
    
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *errorJson=nil;
     responseDict = [NSJSONSerialization JSONObjectWithData:lookServerResponseData options:kNilOptions error:&errorJson];
    
    NSLog(@"responseDict=%@",responseDict);
    if ([[responseDict valueForKey:@"results"] count]>0) {
        arrData=[[NSArray alloc]initWithArray:[responseDict valueForKey:@"results"]];
    }
    [tbl reloadData];
    [tblMenu reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==tblMenu) {
        return 1;
    }
    return [arrData count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==tblMenu) {
        return [arrMenu count];
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView==tblMenu) {
        static NSString *CellIdentifier = @"Cell";
       MenuTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
       // cell1.textLabel.text=@"Hi";
        cell1.lblMenu.text=[arrMenu objectAtIndex:indexPath.row];
        cell1.lblMenu.textColor=[UIColor whiteColor];
        cell1.lblMenu.backgroundColor=[UIColor clearColor];
        return cell1;
    }
    else
    {
    static NSString *cellIdentifier=@"cellIdentifier";
    
    calenderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    //if(tableView==tblMenu)
    cell.lblTime.text=[[[arrData objectAtIndex:indexPath.section] valueForKey:@"date"]substringFromIndex:11];
    cell.lblOrg.text=[[arrData objectAtIndex:indexPath.section] valueForKey:@"name"];
    cell.lblDetail.text=[[arrData objectAtIndex:indexPath.section] valueForKey:@"description"];
    cell.lblDetail.numberOfLines=0;
    cell.textLabel.backgroundColor=[UIColor clearColor];
    NSDateFormatter *df=[[NSDateFormatter alloc]init];
    [df setDateFormat:@"MMM dd yyyy hh:mm a"];
    
//    NSString * timeStampString = [[arrData objectAtIndex:indexPath.section] valueForKey:@"timestamp"];
//    NSTimeInterval _interval=[timeStampString doubleValue];
//    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDate *date2=[df dateFromString:[[arrData objectAtIndex:indexPath.section] valueForKey:@"date"]];
    NSDate *date1=[NSDate date];
    NSLog(@"%@          %@", date1,date2);
    if ([date2 compare:date1] == NSOrderedDescending) {
        NSLog(@"date1 is later than date2");
        cell.lblDetail.textColor=[UIColor blackColor];
        cell.lblOrg.textColor=[UIColor blackColor];
        cell.lblTime.textColor=[UIColor blackColor];
        //cell.lblDetail.textColor=[UIColor blackColor];
        
    } else if ([date2 compare:date1] == NSOrderedAscending) {
        NSLog(@"date1 is earlier than date2");
        cell.lblDetail.textColor=[UIColor redColor];
        cell.lblOrg.textColor=[UIColor redColor];
        cell.lblTime.textColor=[UIColor redColor];
        
    } else {
        NSLog(@"dates are the same");
        
    }
    
    return cell;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView==tblMenu) {
        return @"" ;
    }
    else
   return [[arrData objectAtIndex:section] valueForKey:@"header"] ;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == tblMenu)
    {
        NSString *str_menu=[arrMenu objectAtIndex:indexPath.row];
        NSLog(@"%@",str_menu);
        
        if ([str_menu isEqualToString:@"Calendar"])
        {
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            CalendarViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"CalendarViewController"];
//            [self.navigationController pushViewController:view animated:YES];

        }
        else if([str_menu isEqualToString:@"Updates"])
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UpdateViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"UpdateViewController"];
            [self.navigationController pushViewController:view animated:YES];
        }
        else if([str_menu isEqualToString:@"Leads"])
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LeadsVW *view = [storyboard instantiateViewControllerWithIdentifier:@"LeadsVW"];
            [self.navigationController pushViewController:view animated:YES];
        }
        else if([str_menu isEqualToString:@"Settings"])
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            SettingsViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
            [self.navigationController pushViewController:view animated:YES];
 
        }
            
        
        
    }
    
    else
    {
        NSString *test=[arrData objectAtIndex:indexPath.section];
        NSLog(@"%@",test);
        
        NSLog(@"%ld",(long)indexPath.section);
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Details *view = [storyboard instantiateViewControllerWithIdentifier:@"Details"];
        view.str=[[[responseDict valueForKey:@"results"] valueForKey:@"code"]objectAtIndex:indexPath.section];
        [self.navigationController pushViewController:view animated:YES];
        
    }
    
    
    
}


- (IBAction)btn_menue:(id)sender {
    
    if(isSwipe==NO)
    {
        [self handleSwipe:swipeRight];
        isSwipe=YES;
    }
    
    
    else
    {
        [self handleSwipe:swipeLeft];
        isSwipe=NO;
    }

    
}
@end
