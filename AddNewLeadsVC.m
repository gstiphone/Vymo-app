#import "AddNewLeadsVC.h"
#import "CustomAddNewLeadsTableViewCell.h"
//#import "EditLeadsVC.h"


@interface AddNewLeadsVC ()

@end

@implementation AddNewLeadsVC

- (void) hideKeyboard
{
    
    _view_cover.hidden=YES;
    _view_table.hidden=YES;
   
    _view_table.hidden=YES;
    
    _view_picker.hidden=YES;
    [txtRef1 resignFirstResponder];
    [txtRef2 resignFirstResponder];
        [_view_cover removeGestureRecognizer:gestureRecognizer];
}


-(void)hide
{
    [txt_ref_fld resignFirstResponder];
    self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view removeGestureRecognizer:gestureRecognizer];
    
}

- (void)viewDidLoad {
    
  //  NSDictionary *dic_new=[[NSUserDefaults standardUserDefaults]valueForKey:@"newleads"];
    NSLog(@"...%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"newleads"]);
    _view_cover.hidden=YES;
    _view_table.hidden=YES;
    _view_picker.hidden=YES;
    
    _picker_view.backgroundColor=[UIColor grayColor];
    _picker_2.backgroundColor=[UIColor grayColor];
    
    
    
   arr_fields_header=[[NSMutableArray alloc]init];
    arr_fields_header_type=[[NSMutableArray alloc]init];
    arr_header_maxchar=[[NSMutableArray alloc]init];
    arr_header_required=[[NSMutableArray alloc]init];
    arr_header_code=[[NSMutableArray alloc]init];
    
    
    arr_source_name=[[NSArray alloc]init];
    arr_source_code=[[NSArray alloc]init];
      arr_post=[[NSMutableArray alloc]init];
    
    

    
    
    
    for (NSDictionary *dic_new in [[NSUserDefaults standardUserDefaults]valueForKey:@"newleads"])
    {
        NSString *str_hint=[dic_new valueForKey:@"hint"];
      //  NSLog(@"%@",str_hint);
        [arr_fields_header addObject:str_hint];
        
        NSString *str_type=[dic_new valueForKey:@"type"];
      //  NSLog(@"%@",str_type);
        [arr_fields_header_type addObject:str_type];
        
        NSString*str_maxchar=[NSString stringWithFormat:@"%@",[dic_new valueForKey:@"max_chars"]];
        if (![str_maxchar length] >0)
        {
            [arr_header_maxchar addObject:@"100"];
        }
        else
        {
            [arr_header_maxchar addObject:str_maxchar];
        }
        
        
        NSString *str_required=[dic_new valueForKey:@"required"];
        [arr_header_required addObject:str_required];
        
        NSString *str_code=[dic_new valueForKey:@"code"];
        [arr_header_code addObject:str_code];
        
        
    }
    
    
    for (int i=0; i<[arr_fields_header count]; i++)
    {
        [arr_post addObject:@""];
    }
    
    
   NSLog(@"%@",arr_post);
    
    
    
//    arr1=[[[[[NSUserDefaults standardUserDefaults]valueForKey:@"newleads"] valueForKey:@"sifg_options"] valueForKey:@"selection"] valueForKey:@"code_name_spinner_options"];
//    NSLog(@"%@",arr1);
    
    
//    arr_source=[[[NSUserDefaults standardUserDefaults]valueForKey:@"newleads"] valueForKey:@"sifg_options"];
//    NSLog(@"%@",arr_source);
//    
//    arr_source_spinner=[arr_source valueForKey:@"selection"];
//
//    NSLog(@"%@",arr_source_spinner);
//    
//    NSArray *arr_source_count=[[NSArray alloc]init];
//    arr_source_count=[arr_source_count arrayByAddingObjectsFromArray:[arr_source_spinner valueForKey:@"code_name_spinner_options"]];
//   
   NSLog(@"%ld",(unsigned long)[[[NSUserDefaults standardUserDefaults]valueForKey:@"newleads"] count]) ;
    arr_source_input=[[NSArray alloc]init];

    NSArray *arrtt=[[NSArray alloc]init];
    
    for (NSDictionary *dic in [[NSUserDefaults standardUserDefaults]valueForKey:@"newleads"] )
        
    {
        if ([[[dic valueForKey:@"sifg_options"] valueForKey:@"selection"] valueForKey:@"code_name_spinner_options"])
        {
         arr_source_name=[[[[dic valueForKey:@"sifg_options"] valueForKey:@"selection"] valueForKey:@"code_name_spinner_options"] valueForKey:@"name"];
            NSLog(@"%@",arr_source_name);
            
            arr_source_code=[[[[dic valueForKey:@"sifg_options"] valueForKey:@"selection"] valueForKey:@"code_name_spinner_options"] valueForKey:@"code"];
            NSLog(@"%@",arr_source_code);
        }
       
        
        if ([dic valueForKey:@"sifg_options"]  )
        {
            arr_source_input=[dic valueForKey:@"sifg_options"];
            //[arr_source_input addObject:stt];

        }
        
        
        
    }
    
    
   NSLog(@"%@",arr_source_input);
    NSLog(@"%@",[[[arr_source_input valueForKey:@"inputs"] valueForKey:@"referral"]valueForKey:@"hint"]);
//    for (NSDictionary *dic55 in arr_source_input)
//    {
//      NSDictionary *dicdic=[dic55 valueForKey:@"inputs"];
//         NSLog(@"%@",dicdic);
//    }
   
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    if (tableView==_main_table_view)
    {
        count=[arr_fields_header count];
        
        
        
    }
    if (tableView==_table_view_source)
    {
        count=[arr_source_name count];
    }
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
    static NSString *CellIdentifier = @"Cell";
    Cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (tableView==_main_table_view)
    {
        if ([[arr_fields_header_type objectAtIndex:indexPath.row]isEqualToString:@"sifg"])
        {
            UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 160, 30)];
            lbl1.backgroundColor=[UIColor whiteColor];
            lbl1.text=[arr_fields_header objectAtIndex:indexPath.row];
            lbl1.textColor=[UIColor blackColor];
            [Cell1.contentView addSubview:lbl1];
            Cell1.imgVW_field.image=[UIImage imageNamed:@"dropdownbox_L@SixP.png"];
            Cell1.txtfld_value.tag=indexPath.row;
            Cell1.txtfld_value.delegate=self;
//            if ([[arr_post objectAtIndex:indexPath.row]isEqualToString:@" "])
//            {
                Cell1.txtfld_value.placeholder=[arr_fields_header objectAtIndex:indexPath.row];
          //  }
//            else
//            {
                Cell1.txtfld_value.text=[arr_post objectAtIndex:indexPath.row];
           // }
            
            
            Cell1.btn_drop.enabled=NO;
        }
        
        else
        {
            UILabel *lbl1=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 160, 30)];
            lbl1.backgroundColor=[UIColor whiteColor];
            lbl1.text=[arr_fields_header objectAtIndex:indexPath.row];
            lbl1.textColor=[UIColor blackColor];
            [Cell1.contentView addSubview:lbl1];
            Cell1.imgVW_field.image=[UIImage imageNamed:@"txt_fld_P@six.png"];
            Cell1.txtfld_value.tag=indexPath.row;
            Cell1.txtfld_value.delegate=self;
            Cell1.txtfld_value.placeholder=[arr_fields_header objectAtIndex:indexPath.row];
//            if ([[arr_post objectAtIndex:indexPath.row]isEqualToString:@" "])
//            {
                Cell1.txtfld_value.placeholder=[arr_fields_header objectAtIndex:indexPath.row];
           // }
//            else
//            {
                Cell1.txtfld_value.text=[arr_post objectAtIndex:indexPath.row];
            //}
            Cell1.btn_drop.enabled=NO;
        }
        
        
       
    }
    
    
    if (tableView==_table_view_source)
    {
        Cell1.textLabel.text=[arr_source_name objectAtIndex:indexPath.row];
    }
    
    
    return Cell1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str=[arr_fields_header objectAtIndex:indexPath.row];
    NSLog(@"%@",str);
    
    if (tableView==_main_table_view)
    {
       // Cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (tableView==_table_view_source)
    {
        NSString *str1=[arr_source_name objectAtIndex:indexPath.row];
        NSLog(@"%@",str1);
        
        NSString *str2=[arr_source_code objectAtIndex:indexPath.row];
        NSLog(@"%@",str2);
//        UITextField *txt_fld=(UITextField *)[Cell1 viewWithTag:item];
//        txt_fld.text = [NSString stringWithFormat:@"%@",str1];
        
        _view_table.hidden=YES;
        _view_cover.hidden=YES;
        txtRef.text=str1;
        [arr_post replaceObjectAtIndex:j withObject:str1];
        
        NSLog(@"%@",arr_post);
        [txtRef resignFirstResponder];
        
        NSInteger row = [arr_fields_header indexOfObject:@"Source"];
        
        if ([str2 isEqualToString:@"referral"])
        {
            txtRef.text=@"Referral";
            if (isRemove==YES)
            {
                isRemove=NO;
                [arr_fields_header removeObjectAtIndex:row+1];
                [arr_fields_header_type removeObjectAtIndex:row+1];
                [arr_header_code removeObjectAtIndex:row+1];
                [arr_post removeObjectAtIndex:row+1];
                
                
            }

            
            if (isRemove==NO)
            {
                isRemove=YES;
                NSArray *arr =[[arr_source_input valueForKey:@"inputs"]valueForKey:@"referral"];
                //valueForKey:@"hint"];
                NSString *str_name;
                NSString *str_type;
                NSString*str_code;
                for (NSDictionary *dic in arr)
                {
                    str_name=[dic valueForKey:@"hint"];
                    str_type=[dic valueForKey:@"type"];
                    str_code =[dic valueForKey:@"code"];
                    
                }
                [arr_fields_header insertObject:str_name atIndex:row+1];
                [arr_fields_header_type insertObject:str_type atIndex:row+1];
                [arr_header_code insertObject:str_code atIndex:row+1];
                [arr_post insertObject:@" " atIndex:row+1];

            }
            else
            {
                isRemove=NO;
                [arr_fields_header removeObjectAtIndex:row+1];
                [arr_fields_header_type removeObjectAtIndex:row+1];
                [arr_header_code removeObjectAtIndex:row+1];
                [arr_post removeObjectAtIndex:row+1];
            }
            
            [_main_table_view reloadData];
        }
       
       else if ([str2 isEqualToString:@"retail"])
        {
            txtRef.text=@"Retail Self";
            if (isRemove==YES)
            {
                isRemove=NO;
                [arr_fields_header removeObjectAtIndex:row+1];
                [arr_fields_header_type removeObjectAtIndex:row+1];
                [arr_header_code removeObjectAtIndex:row+1];
                [arr_post removeObjectAtIndex:row+1];

                
            }
            
            if (isRemove==NO)
            {
                isRemove=YES;
                
                NSArray *arr =[[arr_source_input valueForKey:@"inputs"]valueForKey:@"retail"];
                //valueForKey:@"hint"];
                NSString *str_name;
                NSString *str_type;
                NSString*str_code;
                for (NSDictionary *dic in arr)
                {
                    str_name=[dic valueForKey:@"hint"];
                    str_type=[dic valueForKey:@"type"];
                    str_code =[dic valueForKey:@"code"];
                    
                }
                [arr_fields_header insertObject:str_name atIndex:row+1];
                [arr_fields_header_type insertObject:str_type atIndex:row+1];
                [arr_header_code insertObject:str_code atIndex:row+1];
                [arr_post insertObject:@" " atIndex:row+1];

            }
            else
            {
                isRemove=NO;
                [arr_fields_header removeObjectAtIndex:row+1];
                [arr_fields_header_type removeObjectAtIndex:row+1];
                [arr_header_code removeObjectAtIndex:row+1];
                [arr_post removeObjectAtIndex:row+1];


            }
            
            
            [_main_table_view reloadData];
        }
        else
        {
            if (isRemove==YES)
            {
                [arr_fields_header removeObjectAtIndex:row+1];
                [arr_fields_header_type removeObjectAtIndex:row+1];
                [arr_header_code removeObjectAtIndex:row+1];
                [arr_post removeObjectAtIndex:row+1];

                        isRemove=NO;
                
                [_main_table_view reloadData];
            }
           
            
        }
       
        
        
        
            }
    
//    if ([str isEqualToString:@"City"])
//    {
//
//        // NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(indexPath.row+1, indexPath.row+2)];
//        
//        NSLog(@"%ld",(long)indexPath.row);
//        
//        if (isRemove==NO)
//        {
//            [arr_fields_header insertObject:@"City name" atIndex:indexPath.row+1];
//            isRemove=YES;
//        }
//        else
//        {
//            [arr_fields_header removeObjectAtIndex:indexPath.row+1];
//            isRemove=NO;
//        }
//        
//        //[arr_fields_header insertObjects:arr_test atIndexes:indexSet];
//        
//        
//        [_main_table_view reloadData];
//    }
//    
//    if ([str isEqualToString:@"Source"])
//    {
//        [arr_fields_header insertObject:@"retail" atIndex:indexPath.row+1];
//        [arr_fields_header insertObject:@"return" atIndex:indexPath.row+2];
//        [_main_table_view reloadData];
//    }
    
    
}





-(void)BtnCityPress
{
    
    NSLog(@"btn City press");
    
    
    
}

-(void)BtnSourcePress
{
    
    NSLog(@"Source press");
    gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [_view_cover addGestureRecognizer:gestureRecognizer];
    
    _view_cover.hidden=NO;
    _view_table.hidden=NO;
    
    
    
//    item =(int)Cell1.btn_drop.tag;
//    NSLog(@"%d",item);
    
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(orientation == 0)
    {
        
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
                
                
                
                
                
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.height==568.0)
            {
                
                
                
                
                
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.height==667.0)
            {
                
                
                
                
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.height==736.0)
            {
                
                
                
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
                
                
                
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.width==568.0)
            {
                
                
                
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.width==667.0)
            {
                
                
                
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.height==736.0)
            {
                
            }
            
        }
        
        
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight)
    {
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
        }
        
        else
        {
            //=====================================================================================================================================480
            if ([UIScreen mainScreen].bounds.size.width==480.0)
            {
                
                
                
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.width==568.0)
            {
                
                
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.width==667.0)
            {
                
                
                
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.height==736.0)
            {
                
            }
            
        }
        
    }

    
    
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(orientation == 0)
    {
        
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
                
                
                
                
                
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.height==568.0)
            {
                
                
                
                
                
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.height==667.0)
            {
                
                
                
                
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.height==736.0)
            {
                
                
                
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
                
                
                
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.width==568.0)
            {
                
                
                
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.width==667.0)
            {
                
                
                
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.height==736.0)
            {
                
            }
            
        }
        
        
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight)
    {
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
        }
        
        else
        {
            //=====================================================================================================================================480
            if ([UIScreen mainScreen].bounds.size.width==480.0)
            {
                
                
                
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.width==568.0)
            {
                
                
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.width==667.0)
            {
                
                
                
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.height==736.0)
            {
                
            }
            
        }
        
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

    
    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"phone"])
    {
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        txt_ref_fld=[[UITextField alloc] init];
        txt_ref_fld=textField;
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [self.view addGestureRecognizer:gestureRecognizer];
    }

    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"alternate_phone"])
    {
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        txt_ref_fld=[[UITextField alloc] init];
        txt_ref_fld=textField;
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [self.view addGestureRecognizer:gestureRecognizer];

    }
    
    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"pincode"])
    {
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        txt_ref_fld=[[UITextField alloc] init];
        txt_ref_fld=textField;
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [self.view addGestureRecognizer:gestureRecognizer];


    }
    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"age"])
    {
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        txt_ref_fld=[[UITextField alloc] init];
        txt_ref_fld=textField;
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [self.view addGestureRecognizer:gestureRecognizer];

 
    }
    
//    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"pincode"])
//    {
//        [textField setKeyboardType:UIKeyboardTypeNumberPad];
//        txt_ref_fld=[[UITextField alloc] init];
//        txt_ref_fld=textField;
//        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
//        [self.view addGestureRecognizer:gestureRecognizer];
//
//    }


    
    
    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"sifg_source"])
    {
        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        txtRef=[[UITextField alloc]init];
        txtRef=textField;
        j=(int)textField.tag;
        [textField resignFirstResponder];
        [self BtnSourcePress];
    }


    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"dob"])
    {
       self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _view_cover.hidden=NO;
        _view_table.hidden=YES;
        _view_picker.hidden=NO;
        _picker_2.hidden=YES;
        _picker_view.hidden=NO;
        
       // [_view_picker addSubview:_picker_view];
        [textField resignFirstResponder];
        
        txtRef1=[[UITextField alloc]init];
        txtRef1=textField;
        j=(int)textField.tag;
        
        [_picker_view setDatePickerMode:UIDatePickerModeDate];
        _picker_view.backgroundColor = [UIColor whiteColor];
        [_picker_view addTarget:self action:@selector(LabelChange:) forControlEvents:UIControlEventValueChanged];
        
    }

    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"meeting"])
    {
        self.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _view_cover.hidden=NO;
        _view_table.hidden=YES;
        _view_picker.hidden=NO;
        _picker_view.hidden=YES;
        _picker_2.hidden=NO;
        //[_view_picker addSubview:_picker_view];
        [textField resignFirstResponder];
        
        txtRef2=[[UITextField alloc]init];
        txtRef2=textField;
         j=(int)textField.tag;
        
        [_picker_2 setDatePickerMode:UIDatePickerModeDate];
        _picker_2.backgroundColor = [UIColor whiteColor];
        [_picker_2 addTarget:self action:@selector(LabelChangeMeeting:) forControlEvents:UIControlEventValueChanged];
        
    }

    
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
    
    NSString *str_num=[arr_header_required objectAtIndex:textField.tag];
    
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
    
    
   
    [arr_post replaceObjectAtIndex:textField.tag withObject:textField.text];
    
    NSLog(@"%@",arr_post);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"textField:shouldChangeCharactersInRange:replacementString:");
    
    
    int i=(int)textField.tag;
    NSLog(@"%d",i);
    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"phone"])
    {
    
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;   //(int)[arr_header_maxchar objectAtIndex:textField.tag];
        
    }
    
    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"pincode"])
    {
        
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <=  6;  //(int)[arr_header_maxchar objectAtIndex:textField.tag];
        
    }

    if ([[arr_header_code objectAtIndex:textField.tag] isEqualToString:@"alternate_phone"])
    {
        
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <=  10;  //(int)[arr_header_maxchar objectAtIndex:textField.tag];
        
    }
    
    
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








- (IBAction)btn_cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (IBAction)btn_Add:(id)sender
{
    
    NSURL *url=[NSURL URLWithString:@"http://vymo-ios.herokuapp.com/leads"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
    
    NSMutableArray *arr_objects44=[[NSMutableArray alloc]init];
    NSDictionary *questionDict55;
    NSDictionary *object44=[[NSMutableDictionary alloc]init];
    
    
    
    [arr_post count];
    [arr_fields_header_type count];
    
    NSString *code=@" code ";
    NSString *name3=@" name ";
    NSString *type=@" type ";
    NSString *value=@" value ";
    NSString *strData=@"";
    for (int i=0; i<[arr_post count]; i++)
    {
        NSString *code2=[arr_header_code objectAtIndex:i];
        NSString *name4=[arr_fields_header objectAtIndex:i];
        NSString *type2 =[arr_fields_header_type objectAtIndex:i];
        NSString *value2=[arr_post objectAtIndex:i];
        if (i==[arr_post count]-1) {
            strData=[strData stringByAppendingString:[NSString stringWithFormat:@"{ \"code\" : \"%@\", \"name\" : \"%@\", \"type\" : \"%@\", \"value\" : \"%@\" }",code2,name4,type2,value2]];
        }
        else{
        strData=[strData stringByAppendingString:[NSString stringWithFormat:@"{ \"code\" : \"%@\", \"name\" : \"%@\", \"type\" : \"%@\", \"value\" : \"%@\" },",code2,name4,type2,value2]];
        }
        
     /*   if ([[arr_fields_header_type objectAtIndex:i]isEqualToString:@"phone"])
        {
            NSArray *objects1 = [NSArray arrayWithObjects: code2,name4,type2,value2,     nil];
            NSArray *keys1 = [NSArray arrayWithObjects: code,name3,type,value,nil];
            questionDict55 = [NSDictionary dictionaryWithObjects:objects1 forKeys:keys1];
            NSLog(@"%@",questionDict55);
            strData=[strData stringByAppendingString:[NSString stringWithFormat:@"{ \"code\" : \"%@\", \"name\" : \"%@\", \"type\" : \"%@\", \"value\" : \"%@\" },",code2,name4,type2,value2]];
            

        }
        
        if ([[arr_fields_header_type objectAtIndex:i]isEqualToString:@"text"])
        {
            NSArray *object1=[NSArray arrayWithObjects:code2,name4,type2,value2, nil];
            NSArray *keys1 = [NSArray arrayWithObjects: code,name3,type,value,nil];
            questionDict55 = [NSDictionary dictionaryWithObjects:object1 forKeys:keys1];
            NSLog(@"%@",questionDict55);
            strData=[strData stringByAppendingString:[NSString stringWithFormat:@"{ \"code\" : \"%@\", \"name\" : \"%@\", \"type\" : \"%@\", \"value\" : \"%@\" },",code2,name4,type2,value2]];
        }
        
        
        if ([[arr_fields_header_type objectAtIndex:i]isEqualToString:@"sifg"])
        {
            NSArray *object1=[NSArray arrayWithObjects:code2,name4,type2,value2, nil];
            NSArray *keys1 = [NSArray arrayWithObjects: code,name3,type,value,nil];
            questionDict55 = [NSDictionary dictionaryWithObjects:object1 forKeys:keys1];
            NSLog(@"%@",questionDict55);
        }

        if ([[arr_fields_header_type objectAtIndex:i]isEqualToString:@"number"])
        {
            NSArray *object1=[NSArray arrayWithObjects:code2,name4,type2,value2, nil];
            NSArray *keys1 = [NSArray arrayWithObjects: code,name3,type,value,nil];
           questionDict55 = [NSDictionary dictionaryWithObjects:object1 forKeys:keys1];
            NSLog(@"%@",questionDict55);
        }
        
        if ([[arr_fields_header_type objectAtIndex:i]isEqualToString:@"date"])
        {
            NSArray *object1=[NSArray arrayWithObjects:code2,name4,type2,value2, nil];
            NSArray *keys1 = [NSArray arrayWithObjects: code,name3,type,value,nil];
           questionDict55 = [NSDictionary dictionaryWithObjects:object1 forKeys:keys1];
            NSLog(@"%@",questionDict55);
        }
        
        if ([[arr_fields_header_type objectAtIndex:i]isEqualToString:@"meeting"])
        {
            NSArray *object1=[NSArray arrayWithObjects:code2,name4,type2,value2, nil];
            NSArray *keys1 = [NSArray arrayWithObjects: code,name3,type,value,nil];
            questionDict55 = [NSDictionary dictionaryWithObjects:object1 forKeys:keys1];
            NSLog(@"%@",questionDict55);
        }

        if ([[arr_fields_header_type objectAtIndex:i]isEqualToString:@"referral"])
        {
            NSArray *object1=[NSArray arrayWithObjects:code2,name4,type2,value2, nil];
            NSArray *keys1 = [NSArray arrayWithObjects: code,name3,type,value,nil];
            questionDict55 = [NSDictionary dictionaryWithObjects:object1 forKeys:keys1];
            NSLog(@"%@",questionDict55);
        }*/


       // [arr_objects44 addObject:questionDict55];

    }
    NSLog(@"%@",strData);
    //NSLog(@"%@",arr_objects44);
    object44=[arr_objects44 mutableCopy];
   // NSLog(@"%@",object44);
    
//    NSArray *object1=[NSArray arrayWithObjects:@"name",@"Name",@"text",_txt_person.text, nil];
//    NSArray *keys1 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict1 = [NSDictionary dictionaryWithObjects:object1 forKeys:keys1];
//    NSLog(@"%@",questionDict1);
//    
//    NSArray *object2=[NSArray arrayWithObjects:@"company name",@"Company Name",@"text",_txt_companyName.text, nil];
//    NSArray *keys2 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict2 = [NSDictionary dictionaryWithObjects:object2 forKeys:keys2];
//    NSLog(@"%@",questionDict2);
//    
//    
//    
//    NSArray *objects3 = [NSArray arrayWithObjects: @"phone",@"mobile phone",@"phone",_txt_mobileNo.text,     nil];
//    NSArray *keys3 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict3 = [NSDictionary dictionaryWithObjects:objects3 forKeys:keys3];
//    NSLog(@"%@",questionDict3);
//    
//    NSArray *objects4 = [NSArray arrayWithObjects: @"designation",@"Designation",@"text",_txt_designation.text,     nil];
//    NSArray *keys4 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict4 = [NSDictionary dictionaryWithObjects:objects4 forKeys:keys4];
//    NSLog(@"%@",questionDict4);
//    
//    NSArray *objects5 = [NSArray arrayWithObjects: @"alternate phone",@"Alternate phone",@"phone",_txt_alternateNo1.text,     nil];
//    NSArray *keys5 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict5 = [NSDictionary dictionaryWithObjects:objects5 forKeys:keys5];
//    NSLog(@"%@",questionDict5);
//    
//    
//    NSArray *objects6 = [NSArray arrayWithObjects: @"alternate phone",@"Alternate phone",@"phone",_txt_alternateNo2.text,     nil];
//    NSArray *keys6 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict6 = [NSDictionary dictionaryWithObjects:objects6 forKeys:keys6];
//    NSLog(@"%@",questionDict6);
//    
//    NSArray *objects7 = [NSArray arrayWithObjects: @"email",@"Email",@"text",_txt_email.text,     nil];
//    NSArray *keys7 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict7 = [NSDictionary dictionaryWithObjects:objects7 forKeys:keys7];
//    NSLog(@"%@",questionDict7);
//    
//    NSArray *objects8 = [NSArray arrayWithObjects: @"assistant name",@"Assistant Name",@"text",_txt_AssistantName.text,     nil];
//    NSArray *keys8 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict8 = [NSDictionary dictionaryWithObjects:objects8 forKeys:keys8];
//    NSLog(@"%@",questionDict8);
//    
//    NSArray *objects9 = [NSArray arrayWithObjects: @"assistant phone",@"Assistant Phone",@"phone",_txt_AssistantNumber.text,     nil];
//    NSArray *keys9 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict9 = [NSDictionary dictionaryWithObjects:objects9 forKeys:keys9];
//    NSLog(@"%@",questionDict9);
//    
//    NSArray *objects10 = [NSArray arrayWithObjects: @"assistant email",@"Assistant Email",@"text",_txt_AssistantEmail.text,     nil];
//    NSArray *keys10 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict10 = [NSDictionary dictionaryWithObjects:objects10 forKeys:keys10];
//    NSLog(@"%@",questionDict10);
//    
//    NSArray *objects11 = [NSArray arrayWithObjects: @"city",@"City",@"text",_lbl_city.text,     nil];
//    NSArray *keys11 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict11 = [NSDictionary dictionaryWithObjects:objects11 forKeys:keys11];
//    NSLog(@"%@",questionDict11);
//    
//    NSArray *objects12 = [NSArray arrayWithObjects: @"city name",@"City Name",@"text",_txt_cityName.text,     nil];
//    NSArray *keys12 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict12 = [NSDictionary dictionaryWithObjects:objects12 forKeys:keys12];
//    NSLog(@"%@",questionDict12);
//    
//    NSArray *objects13 = [NSArray arrayWithObjects: @"personal contact",@"Personal Contact",@"text",_txt_personalContact.text,     nil];
//    NSArray *keys13 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict13 = [NSDictionary dictionaryWithObjects:objects13 forKeys:keys13];
//    NSLog(@"%@",questionDict13);
//    
//    NSArray *objects14 = [NSArray arrayWithObjects: @"birthday",@"Birthday",@"text",_lbl_Birthday.text,     nil];
//    NSArray *keys14 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict14 = [NSDictionary dictionaryWithObjects:objects14 forKeys:keys14];
//    NSLog(@"%@",questionDict14);
//    
//    NSArray *objects15 = [NSArray arrayWithObjects: @"anniversary",@"Anniversary",@"text",_lbl_Anniversary.text,     nil];
//    NSArray *keys15 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict15 = [NSDictionary dictionaryWithObjects:objects15 forKeys:keys15];
//    NSLog(@"%@",questionDict15);
//    
//    NSArray *objects16 = [NSArray arrayWithObjects: @"spouse name",@"Spouse Name",@"text",_txt_spouseName.text,     nil];
//    NSArray *keys16 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict16 = [NSDictionary dictionaryWithObjects:objects16 forKeys:keys16];
//    NSLog(@"%@",questionDict16);
//    
//    NSArray *objects17 = [NSArray arrayWithObjects: @"children",@"Children",@"text",_txt_Children.text,     nil];
//    NSArray *keys17 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict17 = [NSDictionary dictionaryWithObjects:objects17 forKeys:keys17];
//    NSLog(@"%@",questionDict17);
//    
//    NSArray *objects18 = [NSArray arrayWithObjects: @"source",@"Source",@"text",_lbl_Source.text,     nil];
//    NSArray *keys18 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict18 = [NSDictionary dictionaryWithObjects:objects18 forKeys:keys18];
//    NSLog(@"%@",questionDict18);
//    
//    NSArray *objects19 = [NSArray arrayWithObjects: @"client name",@"Client Name",@"text",_txt_clientName.text,     nil];
//    NSArray *keys19 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict19 = [NSDictionary dictionaryWithObjects:objects19 forKeys:keys19];
//    NSLog(@"%@",questionDict19);
//    
//    NSArray *objects20 = [NSArray arrayWithObjects: @"partner",@"Partner",@"text",_lbl_partner.text,     nil];
//    NSArray *keys20 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict20 = [NSDictionary dictionaryWithObjects:objects20 forKeys:keys20];
//    NSLog(@"%@",questionDict20);
//    
//    NSArray *objects21 = [NSArray arrayWithObjects: @"partner sales rep",@"Partner Sales Rep",@"text",_txt_partnersales_rep.text,     nil];
//    NSArray *keys21 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict21 = [NSDictionary dictionaryWithObjects:objects21 forKeys:keys21];
//    NSLog(@"%@",questionDict21);
//    
//    NSArray *objects22 = [NSArray arrayWithObjects: @"remarks",@"Remarks",@"text",_txt_remarks.text,     nil];
//    NSArray *keys22 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict22 = [NSDictionary dictionaryWithObjects:objects22 forKeys:keys22];
//    NSLog(@"%@",questionDict22);
//    
//    NSArray *objects23 = [NSArray arrayWithObjects: @"followup date",@"Followup Date",@"text",_lbl_followup_date.text,     nil];
//    NSArray *keys23 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict23 = [NSDictionary dictionaryWithObjects:objects23 forKeys:keys23];
//    NSLog(@"%@",questionDict23);
//    
//    NSArray *objects24 = [NSArray arrayWithObjects: @"time",@"Time",@"text",_lbl_time.text,     nil];
//    NSArray *keys24 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict24 = [NSDictionary dictionaryWithObjects:objects24 forKeys:keys24];
//    NSLog(@"%@",questionDict24);
//    
//    NSArray *objects25 = [NSArray arrayWithObjects: @"meeting duration",@"Meeting Duration",@"text",_lbl_meetingDuration.text,     nil];
//    NSArray *keys25 = [NSArray arrayWithObjects: @"code",@"name",@"type",@"value",nil];
//    NSDictionary *questionDict25 = [NSDictionary dictionaryWithObjects:objects25 forKeys:keys25];
//    NSLog(@"%@",questionDict25);
    
  //  NSString *aString = @"";
    NSString *name=@"Shub Test";
    NSString *name2=@" name ";
    NSLog(@"%@",name2);
    NSString *input=@" inputs ";
    NSArray *objects = [NSArray arrayWithObjects: name,object44, nil];
    NSArray *keys = [NSArray arrayWithObjects:name2,input,nil];
    
    NSString *strData2=@"";
    strData2=[strData2 stringByAppendingString:[NSString stringWithFormat:@"{\"name\":\"%@\",\"inputs\":[%@]}",name,strData]];
    NSLog(@"%@",strData2);
    NSDictionary *questionDict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    NSLog(@"%@",questionDict);
    NSError *error=nil;
   // NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:strData2 options:0 error:&error];
    NSData *data=[strData2 dataUsingEncoding:NSUTF8StringEncoding];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: data];
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
    NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:lookServerResponseData options:kNilOptions error:&errorJson];
    
    NSLog(@"responseDict=%@",responseDict);
    // [spinner stopAnimating];
}


- (IBAction)Btn_done_pick:(id)sender
{
    gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [_view_cover addGestureRecognizer:gestureRecognizer];

    if (isFirstPiker==YES)
    {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateStyle = NSDateFormatterMediumStyle;
        txtRef1.text = [NSString stringWithFormat:@"%@",[df stringFromDate:_picker_view.date]];
        
        _view_cover.hidden=YES;
        _view_table.hidden=YES;
        
        _view_picker.hidden=YES;
        
        isFirstPiker=NO;
        [arr_post replaceObjectAtIndex:j withObject:txtRef1.text];
        
        [txtRef1 resignFirstResponder];
    }
    
    if (isSecondPiker==YES)
    {
        NSDateFormatter *df1 = [[NSDateFormatter alloc] init];
        df1.dateStyle = NSDateFormatterMediumStyle;
        txtRef2.text = [NSString stringWithFormat:@"%@",[df1 stringFromDate:_picker_2.date]];
        
        _view_cover.hidden=YES;
        _view_table.hidden=YES;
        
        _view_picker.hidden=YES;
        
         [arr_post replaceObjectAtIndex:j withObject:txtRef2.text];
        isSecondPiker=NO;
        
        [txtRef2 resignFirstResponder];

    }
    
    
   
    
    NSLog(@"%@",arr_post);
    
    
    _view_cover.hidden=YES;
    _view_table.hidden=YES;
    
    _view_picker.hidden=YES;
    
    [txtRef1 resignFirstResponder];
    [txtRef2 resignFirstResponder];
}



-(void)LabelChange:(id)sender
{
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    df.dateStyle = NSDateFormatterMediumStyle;
//    txtRef1.text = [NSString stringWithFormat:@"%@",[df stringFromDate:_picker_view.date]];
   // [txtRef1 resignFirstResponder];
   // _second_view.hidden=YES;

    isFirstPiker=YES;
    
}

-(void)LabelChangeMeeting:(id)sender
{
//    NSDateFormatter *df1 = [[NSDateFormatter alloc] init];
//    df1.dateStyle = NSDateFormatterMediumStyle;
//    txtRef2.text = [NSString stringWithFormat:@"%@",[df1 stringFromDate:_picker_2.date]];
   // [txtRef2 resignFirstResponder];
    // _second_view.hidden=YES;
    
    isSecondPiker=YES;
}



- (IBAction)btn_back:(id)sender {
    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    EditLeadsVC *View = [storyboard instantiateViewControllerWithIdentifier:@"EditLeadsVC"];
//    [self.navigationController pushViewController:View animated:YES];
}

- (IBAction)btn_back2:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
