//
//  LPViewController.m
//  layerplayground
//
//  Created by captain on 8/2/14.
//  Copyright (c) 2014 exactly what it sounds like. All rights reserved.
//

#import "LPViewController.h"
#import "UIView+CGRectUtils.h"
#import "HRColorMapView.h"
#import "HRBrightnessSlider.h"

@interface LPViewController ()

@end

@implementation LPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.alphaSlider.value = self.testView.layer.shadowOpacity;
    self.verticalOffsetSlider.value = self.testView.layer.shadowOffset.height;
    self.horizontalOffsetSlider.value = self.testView.layer.shadowOffset.width;
    self.radiusSlider.value = self.testView.layer.shadowRadius;
    self.alphaLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowOpacity];
    self.vOffsetLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowOffset.height];
    self.hOffsetLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowOffset.width];
    self.radiusLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowRadius];
    
    self.colorPickerView = [[HRColorPickerView alloc] initWithFrame:self.view.bounds];
    self.colorPickerView.height = 500;
    self.colorPickerView.y = self.view.height;
    self.colorPickerView.brightnessSlider.brightnessLowerLimit = @0;
    [self.colorPickerView addTarget:self action:@selector(colorPickerChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.colorPickerView];
    
    [self setButtonFromColor:self.testView.layer.shadowColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alphaSliderChanged:(UISlider *)sender
{
    self.testView.layer.shadowOpacity = sender.value;
    self.alphaLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowOpacity];
}

- (IBAction)verticalOffsetSliderChanged:(UISlider *)sender
{
    self.testView.layer.shadowOffset = CGSizeMake(self.testView.layer.shadowOffset.width, sender.value);
    self.vOffsetLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowOffset.height];
}

- (IBAction)horizontalOffsetSliderChanged:(UISlider *)sender
{
    self.testView.layer.shadowOffset = CGSizeMake(sender.value, self.testView.layer.shadowOffset.height);
    self.hOffsetLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowOffset.width];
}

- (IBAction)radiusSliderChanged:(UISlider *)sender
{
    self.testView.layer.shadowRadius = sender.value;
    self.radiusLabel.text = [NSString stringWithFormat:@"%.04f",self.testView.layer.shadowRadius];
}

- (IBAction)colorButtonTapped:(UIButton *)sender
{
 
    if (self.colorPickerView.y == 568) {
        [UIView animateWithDuration:0.3 animations:^{
            self.colorPickerView.y = 50;
            self.colorView.y = 0;
        } completion:^(BOOL finished) {
            [self.colorButton setTitle:@"Done" forState:UIControlStateNormal];
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.colorPickerView.y = 568;
            self.colorView.y = 518;
        } completion:^(BOOL finished) {
            
            [self setButtonFromColor:self.colorPickerView.color.CGColor];
        }];
    }
    
}

- (void)colorPickerChanged:(HRColorPickerView *)colorPicker
{
    self.testView.layer.shadowColor = colorPicker.color.CGColor;
}


- (void)setButtonFromColor:(CGColorRef)color
{
    int numComponents = CGColorGetNumberOfComponents(color);
    
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        CGFloat red = components[0];
        CGFloat green = components[1];
        CGFloat blue = components[2];
        CGFloat alpha = components[3];
        
        
        NSString *string = [NSString stringWithFormat:@"(%.02f,%.02f,%.02f,%.02f)",red,green,blue, alpha];
        [self.colorButton setTitle:string forState:UIControlStateNormal];
    }
}

@end
