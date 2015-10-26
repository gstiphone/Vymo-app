//
//  EditLeadsVC.m
//  Vymo_test
//
//  Created by User on 08/10/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import "EditLeadsVC.h"

@interface EditLeadsVC ()

@end

@implementation EditLeadsVC


- (void) hideKeyboard {
    
    _view_cover.hidden=YES;
    _view_table.hidden=YES;
    
    [_view_cover removeGestureRecognizer:gestureRecognizer];
}


- (void)viewDidLoad {
    
    arr_heading=[[NSMutableArray alloc]init];
    arr_code=[[NSMutableArray alloc]init];
    arr_required=[[NSMutableArray alloc]init];
    arr_type=[[NSMutableArray alloc]init];
    arr_max=[[NSMutableArray alloc]init];
    arr_min=[[NSMutableArray alloc]init];
    arr_update=[[NSMutableArray alloc]init];
    
   arr_occupation_spinner=[[NSArray alloc]init];
    arr_income_spinner=[[NSArray alloc]init];
    arr_marital_spinner=[[NSArray alloc]init];
    arr_children_spinner=[[NSArray alloc]init];
    
    _view_cover.hidden=YES;
    _view_table.hidden=YES;
    
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"editleads"]);
    
    
    
    [super viewDidLoad];
    
    
    for (NSDictionary *dic in [[NSUserDefaults standardUserDefaults]valueForKey:@"editleads"])
    {
        NSString *str_hint=[dic valueForKey:@"hint"];
        [arr_heading addObject:str_hint];
        
        NSString *str_code=[dic valueForKey:@"code"];
        [arr_code addObject:str_code];
        
        NSString *str_required=[dic valueForKey:@"required"];
        [arr_required addObject:str_required];
        
        NSString *str_type=[dic valueForKey:@"type"];
        [arr_type addObject:str_type];
        
       
        
        if ([str_code isEqualToString:@"occupation"])
        {
            arr_occupation_spinner=[dic valueForKey:@"spinner_options"];
             NSLog(@"%@",arr_occupation_spinner);
        }
       
        if ([str_code isEqualToString:@"income"])
        {
            arr_income_spinner=[dic valueForKey:@"spinner_options"];
            NSLog(@"%@",arr_income_spinner);
        }
        
        if ([str_code isEqualToString:@"marital_status"])
        {
            arr_marital_spinner=[dic valueForKey:@"spinner_options"];
            NSLog(@"%@",arr_income_spinner);
        }
        
        if ([str_code isEqualToString:@"children"])
        {
            arr_children_spinner=[dic valueForKey:@"spinner_options"];
            NSLog(@"%@",arr_income_spinner);
        }

        

        
        
    }
    
    
    // Do any additional setup after loading the view.
    
    
    
    
//     [[NSUserDefaults standardUserDefaults]setObject:[responseDict valueForKey:@"inputs"] forKey:@"detailsInfo"];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"detailsInfo"]);
    arr_code_show=[[NSMutableArray alloc]init];
    arr_name_show=[[NSMutableArray alloc]init];
    arr_type_show=[[NSMutableArray alloc]init];
    arr_value_show=[[NSMutableArray alloc]init];
    
    for (NSDictionary *dic in [[NSUserDefaults standardUserDefaults]valueForKey:@"detailsInfo"])
    {
        NSString *str_code=[dic valueForKey:@"code"];
        [arr_code_show addObject:str_code];
        NSString *str_name=[dic valueForKey:@"name"];
        [arr_name_show addObject:str_name];
        NSString *str_type=[dic valueForKey:@"type"];
        [arr_type_show addObject:str_type];
        NSString *str_value=[dic valueForKey:@"value"];
        [arr_value_show addObject:str_value];
        
    }
    
    NSLog(@"%@",arr_code_show);
    NSLog(@"%@",arr_name_show);
    NSLog(@"%@",arr_type_show);
    NSLog(@"%@",arr_value_show);
    
    
    for (int i=0; i<[arr_heading count]; i++)
    {
        NSString*strval=[arr_code objectAtIndex:i];
        
        if ([arr_code_show containsObject:strval])
        {
            int a=(int)[arr_code_show indexOfObject:strval];
           NSString *strval_2= [arr_value_show objectAtIndex:a];
            
           [arr_update addObject:strval_2];
        }
        else
        {
          [arr_update addObject:@" "];  
        }
        
        
        
        
    }
    
    NSLog(@"%@",arr_update);
    

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    
    // Return the number of sections.
    return 1;
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    NSUInteger count = 0;
    
    if (tableView==_table_view)
    {
        count=[arr_heading count];
    }
    
    if (tableView==_table_view_popup)
    {
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"occupation"])
        {
            count= [arr_occupation_spinner count];
            
        }
        else if([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"income"])
        {
            
            count =[arr_income_spinner count];
            
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"marital_status"])
        {
            
            count = [arr_marital_spinner count];
            
            
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"children"])
        {
            
            count=[arr_children_spinner count];
            
        }
    }
    
    
    
    
       return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
 
      CustomEditLeadsCell  *Cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  // CustomEditLeadsCell  *Cell1 =(CustomEditLeadsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //Cell1=[[CustomEditLeadsCell alloc]init];
    
    if (tableView==_table_view)
    {
        if ([[arr_type objectAtIndex:indexPath.row]isEqualToString:@"spinner"])
        {
            UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 190, 30)];
            lbl1.backgroundColor=[UIColor whiteColor];
            lbl1.text=[arr_heading objectAtIndex:indexPath.row];
            lbl1.textColor=[UIColor blackColor];
            //
            //            UIImageView*image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 25, 310, 40)];
            //            image.image=[UIImage imageNamed:@"dropdownbox_L@SixP.png"];
            //
            //           UILabel *lbl_show=[[UILabel alloc]initWithFrame:CGRectMake(5, 25, 310, 40)];
            //            lbl_show.backgroundColor=[UIColor clearColor];
            //
            //            UIButton *btn_city=[[UIButton alloc]initWithFrame:CGRectMake(5, 25, 310, 40)];
            //            btn_city.backgroundColor=[UIColor clearColor];
            //            [btn_city addTarget:self action:@selector(BtnSourcePress) forControlEvents:UIControlEventTouchUpInside];
            //            btn_city.tag=indexPath.row;
            //
            [Cell1.contentView addSubview:lbl1];
            //            [cell.contentView addSubview:image];
            //            [cell.contentView addSubview:lbl_show];
            //            [cell.contentView addSubview:btn_city];
            NSLog(@"%@",Cell1.txt_fld_cust.placeholder);
            Cell1.img_vw.image=[UIImage imageNamed:@"dropdownbox_L@SixP.png"];
            Cell1.txt_fld_cust.tag=indexPath.row;
            Cell1.txt_fld_cust.delegate=self;
            
//            if ([[arr_update objectAtIndex:indexPath.row]isEqualToString:@" "])
//            {
                Cell1.txt_fld_cust.placeholder=[arr_heading objectAtIndex:indexPath.row];
          //  }
//            else
//            {
                Cell1.txt_fld_cust.text=[arr_update objectAtIndex:indexPath.row];
          //  }
            
            
           
            
        }
        
        else
        {
            UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 190, 30)];
            lbl1.backgroundColor=[UIColor whiteColor];
            NSString *check=[arr_heading objectAtIndex:indexPath.row];
            lbl1.text=[arr_heading objectAtIndex:indexPath.row];
            lbl1.textColor=[UIColor blackColor];
            //
            //            UIImageView*image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 25, 310, 40)];
            //            image.image=[UIImage imageNamed:@"txt_fld_P@six.png"];
            //
            //            UITextField *txt_fld=[[UITextField alloc]initWithFrame:CGRectMake(5, 25, 310, 40)];
            //            txt_fld.backgroundColor=[UIColor clearColor];
            //            txt_fld.delegate=self;
            //            txt_fld.tag=indexPath.row;
            //
            [Cell1.contentView addSubview:lbl1];
            //            [cell.contentView addSubview:image];
            //            [cell.contentView addSubview:txt_fld];
            
            Cell1.img_vw.image=[UIImage imageNamed:@"txt_fld_P@six.png"];
            Cell1.txt_fld_cust.tag=indexPath.row;
            Cell1.txt_fld_cust.delegate=self;
            
            
//            if ([[arr_update objectAtIndex:indexPath.row]isEqualToString:@" "])
//            {
                Cell1.txt_fld_cust.placeholder=[arr_heading objectAtIndex:indexPath.row];
            //}
//            else
//            {
                Cell1.txt_fld_cust.text=[arr_update objectAtIndex:indexPath.row];
           // }
            
            
            
            
        }
        
        
        
    }

    if (tableView==_table_view_popup)
    {
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"occupation"])
        {
            Cell1.textLabel.text= [arr_occupation_spinner objectAtIndex:indexPath.row];
            
        }
        else if([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"income"])
        {
            
            Cell1.textLabel.text =[arr_income_spinner objectAtIndex:indexPath.row];
            
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"marital_status"])
        {
            
            Cell1.textLabel.text = [arr_marital_spinner objectAtIndex:indexPath.row];
            
            
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"children"])
        {
            
            Cell1.textLabel.text=[arr_children_spinner objectAtIndex:indexPath.row];
            
        }

    }
    
    
    
    
    return Cell1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
    if (tableView==_table_view_popup)
    {
        NSString *str_spinner_val;
        
        if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"occupation"])
        {
           str_spinner_val= [arr_occupation_spinner objectAtIndex:indexPath.row];
            
        }
        else if([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"income"])
        {
            
            str_spinner_val =[arr_income_spinner objectAtIndex:indexPath.row];
            
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"marital_status"])
        {
            
            str_spinner_val = [arr_marital_spinner objectAtIndex:indexPath.row];
            
            
        }
        else if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"opentable"]isEqualToString:@"children"])
        {
            
            str_spinner_val=[arr_children_spinner objectAtIndex:indexPath.row];
            
        }
        
        
        [arr_update replaceObjectAtIndex:j withObject:str_spinner_val];
        NSLog(@"%@",arr_update);
        
        txtRef.text=str_spinner_val;
        _view_cover.hidden=YES;
        _view_table.hidden=YES;

    }
    
    
    
}




- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    
    
    
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
    
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
        
        if ([UIScreen mainScreen].bounds.size.height==568.0)
        {
            
            NSLog(@"Potrait");
            self.view.frame=CGRectMake(0, -120, 320, 568);
            
        }
        
        
        
    }
    
    
    if ([[arr_type objectAtIndex:textField.tag] isEqualToString:@"phone"])
    {
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//        txt_ref_fld=[[UITextField alloc] init];
//        txt_ref_fld=textField;
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.view addGestureRecognizer:gestureRecognizer];
    }
    
    if ([[arr_type objectAtIndex:textField.tag] isEqualToString:@"number"])
    {
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        //        txt_ref_fld=[[UITextField alloc] init];
        //        txt_ref_fld=textField;
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.view addGestureRecognizer:gestureRecognizer];
    }

    
    

    
    if ([[arr_type objectAtIndex:textField.tag]isEqualToString:@"spinner"])
    {
        [[NSUserDefaults standardUserDefaults]setObject:[arr_code objectAtIndex:textField.tag] forKey:@"opentable"];
        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        txtRef=[[UITextField alloc]init];
        txtRef=textField;
        j=(int)textField.tag;
        [textField resignFirstResponder];
        
        _view_cover.hidden=NO;
        _view_table.hidden=NO;
        [_table_view_popup reloadData];
        
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [_view_cover addGestureRecognizer:gestureRecognizer];

        
    }
    
    
    
    
//
//    
//    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"dob"])
//    {
//        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//        _view_cover.hidden=NO;
//        _view_table.hidden=YES;
//        _view_picker.hidden=NO;
//        _picker_2.hidden=YES;
//        _picker_view.hidden=NO;
//        
//        // [_view_picker addSubview:_picker_view];
//        [textField resignFirstResponder];
//        
//        txtRef1=[[UITextField alloc]init];
//        txtRef1=textField;
//        
//        [_picker_view setDatePickerMode:UIDatePickerModeDate];
//        _picker_view.backgroundColor = [UIColor whiteColor];
//        [_picker_view addTarget:self action:@selector(LabelChange:) forControlEvents:UIControlEventValueChanged];
//        
//    }
//    
//    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"meeting"])
//    {
//        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//        _view_cover.hidden=NO;
//        _view_table.hidden=YES;
//        _view_picker.hidden=NO;
//        _picker_view.hidden=YES;
//        _picker_2.hidden=NO;
//        //[_view_picker addSubview:_picker_view];
//        [textField resignFirstResponder];
//        
//        txtRef2=[[UITextField alloc]init];
//        txtRef2=textField;
//        
//        [_picker_2 setDatePickerMode:UIDatePickerModeDate];
//        _picker_2.backgroundColor = [UIColor whiteColor];
//        [_picker_2 addTarget:self action:@selector(LabelChangeMeeting:) forControlEvents:UIControlEventValueChanged];
//        
//    }
    
    
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldEndEditing");
    //    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"textFieldDidEndEditing");
    
    int i=(int)textField.tag;
    NSLog(@"%d",i);
    
    NSString *str_num=[arr_required objectAtIndex:textField.tag];
//    ![textField.text length]>0
    
    if ([str_num boolValue] == 1)
    {
        if ([textField.text isEqualToString:@" "])
        {
            textField.backgroundColor=[UIColor redColor];
        }
        else
        {
            textField.backgroundColor=[UIColor clearColor];
        }
    }
    
    
    
    [arr_update replaceObjectAtIndex:textField.tag withObject:textField.text];
    
    NSLog(@"%@",arr_update);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    
    
//    int i=(int)textField.tag;
//    NSLog(@"%d",i);
//    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"phone"])
//    {
//        
//        if(range.length + range.location > textField.text.length)
//        {
//            return NO;
//        }
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 10;   //(int)[arr_header_maxchar objectAtIndex:textField.tag];
//        
//    }
//    
//    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"pincode"])
//    {
//        
//        if(range.length + range.location > textField.text.length)
//        {
//            return NO;
//        }
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <=  6;  //(int)[arr_header_maxchar objectAtIndex:textField.tag];
//        
//    }
//    
//    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"alternate_phone"])
//    {
//        
//        if(range.length + range.location > textField.text.length)
//        {
//            return NO;
//        }
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <=  10;  //(int)[arr_header_maxchar objectAtIndex:textField.tag];
//        
//    }
    
    
    //    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"pincode"])
    //    {
    //        if(range.length + range.location > textField.text.length)
    //        {
    //            return NO;
    //        }
    //
    //        NSUInteger newLength = [textField.text length] + [string length] - range.length;
    //        return newLength <=  6;  //(int)[arr_header_maxchar objectAtIndex:textField.tag];
    //    }
    
    
    
    
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"textFieldShouldReturn:");
    //    if (textField.tag == 1) {
    //        UITextField *passwordTextField = (UITextField *)[self.view viewWithTag:2];
    //        [passwordTextField becomeFirstResponder];
    //    }
    //    else {
    //        [textField resignFirstResponder];
    //    }
    
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
        
        if ([UIScreen mainScreen].bounds.size.height==568.0)
        {
            
            NSLog(@"Potrait");
            self.view.frame=CGRectMake(0, 0, 320, 568);
            
        }
        
        
        
        
    }
    
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)btnBack:(id)sender {
    
    [self .navigationController popViewControllerAnimated:YES];
}
@end
