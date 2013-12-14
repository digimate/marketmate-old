//
//  Slider.h
//  MarketMate.0.1
//
//  Created by KhoaVu on 11/15/13.
//  Copyright (c) 2013 KhoaVu. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, KASlideShowTransitionType) {
    KASlideShowTransitionFade,
    KASlideShowTransitionSlide
};

typedef NS_ENUM(NSInteger, KASlideShowGestureType) {
    KASlideShowGestureTap,
    KASlideShowGestureSwipe,
    KASlideShowGestureAll
};

@class Slider;
@protocol SlideDelegate <NSObject>
@optional
- (void) kaSlideShowDidNext:(Slider *) slideShow;
- (void) kaSlideShowDidPrevious:(Slider *) slideShow;
@end


@interface Slider : UIView

@property (nonatomic, unsafe_unretained) IBOutlet id <SlideDelegate> delegate;

@property  float delay;
@property  float transitionDuration;
@property  (readonly, nonatomic) NSUInteger currentIndex;
@property  (atomic) KASlideShowTransitionType transitionType;
@property  (atomic) UIViewContentMode imagesContentMode;
@property  (strong,nonatomic) NSMutableArray * images;

- (void) addImagesFromResources:(NSArray *) names;
- (void) emptyAndAddImagesFromResources:(NSArray *)names;
- (void) addGesture:(KASlideShowGestureType)gestureType;
- (void) addImage:(UIImage *) image;
- (void) start;
- (void) stop;
- (void) previous;
- (void) next;

@end
