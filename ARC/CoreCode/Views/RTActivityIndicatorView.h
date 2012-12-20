#import <UIKit/UIKit.h>

/**
 *通用等待消息框，可以添加文字提示，可以指定宽度
 @par 示例:
 @code
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      dispatch_sync(dispatch_get_main_queue(), ^{
        //出现等待指示灯
        [RTBezelActivityIndicatorView activityViewForView:self.viewController.view  withLabel:@"正在处理数据1，请稍后！"];
      });
 
      dispatch_sync(dispatch_get_main_queue(), ^{
        //处理耗时的过程1
      });
 
      dispatch_sync(dispatch_get_main_queue(), ^{
      //出现等待指示灯
      [RTBezelActivityIndicatorView setActivityLabel:@"正在处理数据2，请稍后！"];
      });

      dispatch_sync(dispatch_get_main_queue(), ^{
        //处理耗时的过程2
      });
 
      dispatch_sync(dispatch_get_main_queue(), ^{
        //等待耗时过程结束后，需要处理的工作
        [RTBezelActivityIndicatorView removeViewAnimated:YES];
      });
    });
 @endcode
*/
@interface RTActivityIndicatorView : UIView

/**掩盖层视图*/
@property (nonatomic, strong, readonly) UIView *borderView;

/**活动指示*/
@property (nonatomic, strong, readonly) UIActivityIndicatorView *activityIndicator;

/**提示信息*/
@property (nonatomic, strong, readonly) UILabel *activityLabel;

/**提示信息宽度，一般会自适应，也可以强制指定宽度*/
@property (nonatomic) NSUInteger labelWidth;

/**是否在状态栏显示网络活动指示灯，默认未开启*/
@property (nonatomic) BOOL showNetworkActivityIndicator;


/**获取当前活动视图*/
+ (RTActivityIndicatorView *)currentActivityView;

/**设置提示信息，通常在中途改变提示信息时用*/
+ (void) setActivityLabel:(NSString *)labelText;

/**创建并添加一个活动指示灯到指定的视图上显示，默认提示信息是“Loading”，返回当前视图*/
+ (RTActivityIndicatorView *)activityViewForView:(UIView *)addToView;

/**创建并添加一个活动指示灯到指定的视图上显示，指定提示文字*/
+ (RTActivityIndicatorView *)activityViewForView:(UIView *)addToView withLabel:(NSString *)labelText;

/**创建并添加一个活动指示灯到指定的视图上显示，指定提示文字和宽度*/
+ (RTActivityIndicatorView *)activityViewForView:(UIView *)addToView withLabel:(NSString *)labelText width:(NSUInteger)aLabelWidth;

/**类实例初始化方法，推荐使用类方法来创建活动指示灯*/
- (RTActivityIndicatorView *)initForView:(UIView *)addToView withLabel:(NSString *)labelText width:(NSUInteger)aLabelWidth;

/**移除活动指示灯动画*/
+ (void)removeView;

@end


// ----------------------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------------------


// These methods are exposed for subclasses to override to customize the appearance and behavior; see the implementation for details:

@interface RTActivityIndicatorView ()

- (UIView *)viewForView:(UIView *)view;
- (CGRect)enclosingFrame;
- (void)setupBackground;
- (UIView *)makeBorderView;
- (UIActivityIndicatorView *)makeActivityIndicator;
- (UILabel *)makeActivityLabelWithText:(NSString *)labelText;
- (void)animateShow;
- (void)animateRemove;

@end


// ----------------------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------------------


@interface RTWhiteActivityIndicatorView : RTActivityIndicatorView

@end


// ----------------------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------------------


@interface RTBezelActivityIndicatorView : RTActivityIndicatorView

// Animates the view out from the superview and releases it, or simply removes and releases it immediately if not animating:
+ (void)removeViewAnimated:(BOOL)animated;

@end


// ----------------------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------------------


@interface RTKeyboardActivityIndicatorView : RTBezelActivityIndicatorView

// Creates and adds a keyboard-style activity view, using the label "Loading...".  Returns the activity view, already covering the keyboard, or nil if the keyboard isn't currently displayed:
+ (RTKeyboardActivityIndicatorView *)activityView;

// Creates and adds a keyboard-style activity view, using the specified label.  Returns the activity view, already covering the keyboard, or nil if the keyboard isn't currently displayed:
+ (RTKeyboardActivityIndicatorView *)activityViewWithLabel:(NSString *)labelText;

@end


// ----------------------------------------------------------------------------------------
// MARK: -
// ----------------------------------------------------------------------------------------


@interface UIApplication (KeyboardView)

- (UIView *)keyboardView;

@end;

