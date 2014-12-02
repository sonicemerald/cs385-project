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

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextField;
@property (weak, nonatomic) IBOutlet UISwitch *favoritesSwitch;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (nonatomic,strong) Location *locationToEdit;

//thinking we need these, instead of UITextFields.
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic,weak) id<QuickAddViewControllerDelegate> delegate;

-(IBAction) done:(id) sender;
-(IBAction) cancel:(id) sender;

-(BOOL) validate:(Location *) l;
-(id) initWithLatitude:(NSString *)lat andLongitude:(NSString *)longitude;

@end
