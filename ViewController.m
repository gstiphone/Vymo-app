//
//  ViewController.m
//  Vymo
//
//  Created by User on 23/09/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "ViewController.h"
#import "LeadsVW.h"
#import "UpDateLead.h"
#import "CalendarViewController.h"
#import "UpdateViewController.h"
#import "SettingsViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize text_email,text_password;
- (void)viewDidLoad {
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"token"] length] >1)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CalendarViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"CalendarViewController"];
        [self.navigationController pushViewController:view animated:YES];
    }
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSubmit:(id)sender
{
//    text_email.text=@"ios.test@vymo.in";
//    text_password.text=@"iostest";

   if([text_email.text isEqualToString:@""] ||[text_password.text isEqualToString:@""])
   {
       UIAlertView *view = [[UIAlertView alloc]
                            initWithTitle: @"VYMO"
                            message: @"Please fill the required feilds"
                            delegate: self
                            cancelButtonTitle: @"OK." otherButtonTitles: nil];
       [view show];

       
   }
    else
    {
    NSURL *url=[NSURL URLWithString:@"http://vymo-ios.herokuapp.com/users/session"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
        
        [self.view addSubview:vw];
//        spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2, ([UIScreen mainScreen].bounds.size.height-32)/2, 32.0f, 32.0f);
        
        
        UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
        
        if(orientation == 0)
        { spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2, ([UIScreen mainScreen].bounds.size.height-32)/2, 32.0f, 32.0f);
        }
        else if(orientation == UIInterfaceOrientationPortrait)
        {
            
            if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
            {
            }
            
            else
            {
                //=====================================================================================================================================480
                if ([UIScreen mainScreen].bounds.size.height==480.0)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2, ([UIScreen mainScreen].bounds.size.height-225), 32.0f, 32.0f);
                }
                //=========================================================================================================================================568
                if ([UIScreen mainScreen].bounds.size.height==568.0)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2, ([UIScreen mainScreen].bounds.size.height-32)/2, 32.0f, 32.0f);
                    
                    
                }
                //=============================================================================================================================================667
                if ([UIScreen mainScreen].bounds.size.height==667.0)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2, ([UIScreen mainScreen].bounds.size.height-34)/2, 32.0f, 32.0f);
                    
                    
                }
                //=================================================================================================================================================736
                if ([UIScreen mainScreen].bounds.size.height==736.0)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-406 ) , 32.0f, 32.0f);
                }
                
            }
            
            
            
        }
        else if(orientation == UIInterfaceOrientationLandscapeLeft)
        {
            
            if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
            {
            }
            
            else
            {
                //=====================================================================================================================================480
                if ([UIScreen mainScreen].bounds.size.width==480.0)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-132) , 32.0f, 32.0f);
                    
                }
                //=========================================================================================================================================568
                if ([UIScreen mainScreen].bounds.size.width==568)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-128) , 32.0f, 32.0f);
                    
                }
                //=============================================================================================================================================667
                if ([UIScreen mainScreen].bounds.size.height==375.0)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-156 ) , 32.0f, 32.0f);
                    
                }
                //=================================================================================================================================================736
                if ([UIScreen mainScreen].bounds.size.width==736.0)
                {
                    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-156 ) , 32.0f, 32.0f);
                }
                
            }
            
            
        }
        else if(orientation == UIInterfaceOrientationLandscapeRight)
        {
            //Do something if right
            
            //=====================================================================================================================================480
            if ([UIScreen mainScreen].bounds.size.width==480.0)
            {
                spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-132) , 32.0f, 32.0f);
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.width==568.0)
            {
                spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-128) , 32.0f, 32.0f);
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.height==375.0)
            {
                spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-156 ) , 32.0f, 32.0f);
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.width==736.0)
            {
                spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
                spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2,([UIScreen mainScreen].bounds.size.height-156 ) , 32.0f, 32.0f);
                
            }

            
        }

        
        
        
        
        
        
        [self.view addSubview:spinner];
        
        [spinner startAnimating];
        
 //   NSArray *objects = [NSArray arrayWithObjects:@"ios.test@vymo.in", @"iostest",     nil];
     NSArray *objects = [NSArray arrayWithObjects:text_email.text, text_password.text,     nil];
    NSArray *keys = [NSArray arrayWithObjects:@"email", @"password", nil];
    NSDictionary *questionDict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    NSLog(@"%@",questionDict);
    NSError *error=nil;
    NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:questionDict options:0 error:&error];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: jsonData];
    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self];
    [connection start];
    
   
    }
   
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    LeadsVW *View = [storyboard instantiateViewControllerWithIdentifier:@"LeadsVW"];
//    [self.navigationController pushViewController:View animated:YES];
    
    UIButton *btn=(UIButton *)sender;
    NSString* str=[NSString stringWithFormat:@"%ld",(long)btn.tag++];
    
    
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UpDateLead *View = [storyboard instantiateViewControllerWithIdentifier:@"UpDateLead"];
//        View.strtag=str;
//        [self.navigationController pushViewController:View animated:YES];

//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UpDateLead *View = [storyboard instantiateViewControllerWithIdentifier:@"UpDateLead"];
//    View.strtag=str;
//    [self.navigationController pushViewController:View animated:YES];
    
    
    
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
    NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:lookServerResponseData options:kNilOptions error:&errorJson];
    
    NSLog(@"responseDict=%@",responseDict);
     [spinner stopAnimating];
    
    
    NSString *authString=responseDict[@"auth_token"];
    NSLog(@"%@",authString);
    
    [[NSUserDefaults standardUserDefaults]setObject:authString forKey:@"token"];
    
    
    NSArray *arr=[responseDict valueForKey:@"input_fields"];
    NSLog(@"%@",arr);
    
    NSDictionary *dic_new=[arr valueForKey:@"new"];
    NSLog(@"%@>>>>",dic_new);
    
    [[NSUserDefaults standardUserDefaults]setObject:[arr valueForKey:@"new"] forKey:@"newleads"];
    
    NSDictionary *dic_new_edit=[arr valueForKey:@"edit_new"];
    NSLog(@"%@...",dic_new_edit);
    
    [[NSUserDefaults standardUserDefaults]setObject:[arr valueForKey:@"edit_new"] forKey:@"editleads"];

    
    
    
    
    if(![authString length]>0)
    {
        NSString *errorString=responseDict[@"error"];
        if([errorString isEqualToString:@"Invalid password"])
        {
            UIAlertView *view = [[UIAlertView alloc]
                                 initWithTitle: @"VYMO"
                                 message: @"Invalid password"
                                 delegate: self
                                 cancelButtonTitle: @"OK." otherButtonTitles: nil];
            [view show];
            
        }
        
        if([errorString isEqualToString:@"User not found"])
        {
            UIAlertView *view = [[UIAlertView alloc]
                                 initWithTitle: @"VYMO"
                                 message: @"Invalid User"
                                 delegate: self
                                 cancelButtonTitle: @"OK." otherButtonTitles: nil];
            [view show];
            
        }

    
    }
    else
    {
    [[NSUserDefaults standardUserDefaults]setObject:authString forKey:@"authString_default"];
        NSLog(@"User- %@",[responseDict valueForKey:@"user"]);
        NSLog(@"User- %@",[responseDict valueForKey:@"version"]);
    [[NSUserDefaults standardUserDefaults]setObject:[responseDict valueForKey:@"user"] forKey:@"user"];
    [[NSUserDefaults standardUserDefaults]setObject:[responseDict valueForKey:@"version"] forKey:@"version"];
        
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    CalenderVW *View = [storyboard instantiateViewControllerWithIdentifier:@"CalenderVW"];
//    [self.navigationController pushViewController:View animated:YES];
        
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        LeadsVW *View = [storyboard instantiateViewControllerWithIdentifier:@"LeadsVW"];
//        [self.navigationController pushViewController:View animated:YES];
        
        
        
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        CalendarViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"CalendarViewController"];
//        [self.navigationController pushViewController:view animated:YES];
        
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UpdateViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"UpdateViewController"];
//        [self.navigationController pushViewController:view animated:YES];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CalendarViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"CalendarViewController"];
        [self.navigationController pushViewController:view animated:YES];
    
    }
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
    {
        if ([UIScreen mainScreen].bounds.size.width==480.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 480, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==568.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 568.0, 320);
        }
        if ([UIScreen mainScreen].bounds.size.width==667.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 667, 375);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==736.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 736, 414);
        }
        
    }
    
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
    {
        
        if ([UIScreen mainScreen].bounds.size.height==480.0)
        {
            
            NSLog(@"Potrait");
            self.view.frame=CGRectMake(0, 0, 320, 480);
            
        }
        
        
        
    }

    
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
 if(textField==text_email || text_password)
 {
     if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
     {
         
         NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
          NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
         
         if ([UIScreen mainScreen].bounds.size.width==480.0)
         {
              NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -80, 480, 320);
         }
         
         if ([UIScreen mainScreen].bounds.size.width==568.0)
         {
             NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -80, 568, 320);
         }
         
         if ([UIScreen mainScreen].bounds.size.width==667.0)
         {
             NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -50, 667, 320);
         }
         
         if ([UIScreen mainScreen].bounds.size.width==736.0)
         {
             NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -50, 736, 414);
         }
     }
     
     if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
     {
         if ([UIScreen mainScreen].bounds.size.height==480.0)
         {
             NSLog(@"Potrait");
             self.view.frame=CGRectMake(0, -80, 320, 480);
         }
     }
 
 }
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
    {
        
        NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
        NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
        
        if ([UIScreen mainScreen].bounds.size.width==480.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -80, 480, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==568.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -80, 568, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==667.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -50, 667, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==736.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -50, 736, 414);
        }
    }
    
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
    {
        if ([UIScreen mainScreen].bounds.size.height==480.0)
        {
            NSLog(@"Potrait");
            self.view.frame=CGRectMake(0, -80, 320, 480);
        }
    }

    
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
    {
        
        NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
        NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
        
        if ([UIScreen mainScreen].bounds.size.width==480.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -80, 480, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==568.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -80, 568, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==667.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -50, 667, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==736.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, -50, 736, 414);
        }
    }
    
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
    {
        if ([UIScreen mainScreen].bounds.size.height==480.0)
        {
            NSLog(@"Potrait");
            self.view.frame=CGRectMake(0, -80, 320, 480);
        }
    }

    
}
@end
