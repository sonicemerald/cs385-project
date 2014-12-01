//
//  QuickAddViewController.h
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "Utility.h"

@class Location;
@class QuickAddViewController;

@protocol QuickAddViewControllerDelegate<NSObject>

-(void) addQuickAddViewController:(QuickAddViewController *) controller
                   didAddLocation:(Location *) location;

-(void) addQuickAddViewController:(QuickAddViewController *)controller didEditLocation:(Location *)location;

-(void) addQuickAddViewControllerDidCancel:(QuickAddViewController *) controller;

@end

@interface QuickAddViewController : UIViewController<UITextFieldDelegate>
{
    
}

@property (nonatomic,strong) Location *locationToEdit;
@property (nonatomic,strong) IBOutlet UITextField *nameTextField;
@property (nonatomic,strong) IBOutlet UITextField *latitudeTextField;
@property (nonatomic,strong) IBOutlet UITextField *longitudeTextField;
@property (nonatomic,weak) id<QuickAddViewControllerDelegate> delegate;

-(IBAction) done:(id) sender;
-(IBAction) cancel:(id) sender;

-(BOOL) validate:(Location *) l;


@end
