![FTIndicator](https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/FTIndicator.jpg)

# FTIndicator

[![Twitter](https://img.shields.io/badge/twitter-@liufengting-blue.svg?style=flat)](http://twitter.com/liufengting) 
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/liufengting/FTIndicator/master/LICENSE)
[![Version](https://img.shields.io/cocoapods/v/FTIndicator.svg?style=flat)](http://cocoapods.org/pods/FTIndicator)
[![Platform](https://img.shields.io/cocoapods/p/FTIndicator.svg?style=flat)](http://cocoapods.org/pods/FTIndicator)
[![Download](https://img.shields.io/cocoapods/dt/FTIndicator.svg?maxAge=2592000)](http://cocoapods.org/pods/FTIndicator)
[![CocoaPods](https://img.shields.io/cocoapods/at/FTIndicator.svg?maxAge=2592000)](http://cocoapods.org/pods/FTIndicator)
[![CocoaPods](https://img.shields.io/cocoapods/metrics/doc-percent/FTIndicator.svg?maxAge=2592000)](http://cocoapods.org/pods/FTIndicator)
[![CI Status](http://img.shields.io/travis/liufengting/FTIndicator.svg?style=flat)](https://travis-ci.org/liufengting/FTIndicator)
[![GitHub stars](https://img.shields.io/github/stars/liufengting/FTIndicator.svg)](https://github.com/liufengting/FTIndicator/stargazers)


A light wight UI package contains local notification, progress HUD, toast, with `blur effect`, `elegant API` and `themes Support` for iOS. Inspired by Apple's process HUD, notifications and Android's toast.


# 3 IN 1

 * If you want use all three of the indicators, use `FTIndicator` .
 * Also, `FTNotificationIndicator`, `FTProgressIndicator` and `FTToastIndicator` are able to work separately. Use them all your will.

---

> `FTIndicator`
>> `FTNotificationIndicator`
>> `FTProgressIndicator`
>> `FTToastIndicator`

---



# ScreenShots

## Portrait

| Style	| Light	| Dark	|
|:-------------:|:-------------:|:-------------:|
| Notification | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Portriat/notification_L_P.jpg" width="300"/> | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Portriat/notification_D_P.jpg" width="300"/> |
| Progress | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Portriat/progress_L_P.jpg" width="300"/> | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Portriat/progress_D_P.jpg" width="300"/> |
| Toast | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Portriat/toast_L_P.jpg" width="300"/> | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Portriat/toast_D_P.jpg" width="300"/> |

## Landscape

| Style	| Light	| Dark	|
|:-------------:|:-------------:|:-------------:|
| Notification | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Landscape/notification_L_L.jpg" width="300"/> | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Landscape/notification_D_L.jpg" width="300"/> |
| Progress | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Landscape/progress_L_L.jpg" width="300"/> | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Landscape/progress_D_L.jpg" width="300"/> |
| Toast | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Landscape/toast_L_L.jpg" width="300"/> | <img src="https://raw.githubusercontent.com/liufengting/FTResourceRepo/master/Resource/FTIndicator/ScreenShots/Landscape/toast_D_L.jpg" width="300"/> |


 

# Installation

## Manually

* clone this repo.
* Simply drop the '/FTIndicator' folder into your project.
* import 'FTIndicator.h'

## CocoaPods

`FTIndicator` is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:


⚠️ Notice：

Syntax error fix in 1.2.2: Syntax error fixed. May cause error to your projects, update it carefully.


⚠️ Notice：

major fix in 1.2.0: progress HUD doesn't show when app starts

`FTNotificationIndicator`, `FTProgressIndicator` and `FTToastIndicator` podfile stopped updating after v1.1.5. If you wanna use them separately, you should use them like this in your Podfile as a subPod:

```ruby
    pod 'FTIndicator/FTNotificationIndicator'
    pod 'FTIndicator/FTProgressIndicator'
    pod 'FTIndicator/FTToastIndicator'
```


### Use FTIndicator, all three of them 

* FTIndicator, 3 in 1 

```ruby
pod 'FTIndicator'
```

### Use separately

* FTNotificationIndicator

~~pod 'FTNotificationIndicator~~ is not available anymore, use this:

```ruby

# use as a subPod

pod 'FTIndicator/FTNotificationIndicator'

```

* FTProgressIndicator

~~pod "FTProgressIndicator"~~ is not available anymore, use this:


```ruby

# use as a subPod

pod 'FTIndicator/FTProgressIndicator'

```

* FTToastIndicator

~~pod 'FTToastIndicator'~~ is not available anymore, use this:

```ruby

# use as a subPod

pod 'FTIndicator/FTToastIndicator'

```

# Usage

## Use `FTIndicator`

### Notification

* show without image

```objective-c
[FTIndicator showNotificationWithTitle:@"Here is a notification title."
								message:@"Here is a notification message."]; 
```

* show with image

```objective-c
[FTIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
								   title:@"Here is a notification title."
                               message:@"Here is a notification message."]; 
```

* show with image, with tap handler and completion handler

```objective-c
[FTIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
                                 title:@"Here is a notification title."
                               message:@"Here is a notification message. Try to tap and see tap handling or do nothing to see completion"
                            tapHandler:^{
							// handle user tap
                            } completion:^{
							// handle completion
                            }];
```


* dismiss manually

```objective-c
[FTIndicator dismissNotification];
```

### Progress

* show progress

```objective-c

[FTIndicator showProgressWithMessage:@"Here is a progress message."];  

```

```objective-c

// or disable user interactions

[FTIndicator showProgressWithMessage:@"Here is a progress message." userInteractionEnable:NO]; 

```

* show success

```objective-c

[FTIndicator showSuccessWithMessage:@"Here is a success message."]; 

```

```objective-c

// or disable user interactions

[FTIndicator showSuccessWithMessage:@"Here is a success message." userInteractionEnable:NO]; 

```

* show info

```objective-c

[FTIndicator showInfoWithMessage:@"Here is a info message."]; 

```

```objective-c

// or disable user interactions

[FTIndicator showInfoWithMessage:@"Here is a info message." userInteractionEnable:NO]; 

```
	
* show error

```objective-c

[FTIndicator showErrorWithMessage:@"Here is a error message."];

```

```objective-c

// or disable user interactions

[FTIndicator showErrorWithMessage:@"Here is a error message." userInteractionEnable:NO];

```

* dismiss manually

```objective-c
[FTIndicator dismissProgress];
```

### Toast

* show with image

```objective-c
[FTIndicator showToastMessage:@"Short Toast."];  
```
								
* dismiss manually

```objective-c
[FTIndicator dismissToast];
```


## Use `FTNotificationIndicator`, `FTProgressIndicator`, `FTToastIndicator` separately

### FTNotificationIndicator

* show with image

```objective-c
[FTNotificationIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
                                             title:@"Here is a notification title."
                                           message:@"Here is a notification message."]; 
```

* show without image

```objective-c
[FTNotificationIndicator showNotificationWithTitle:@"Here is a notification title."
										     message:@"Here is a notification message."]; 
```
								
* dismiss manually

```objective-c
[FTNotificationIndicator dismiss];
```

### FTProgressIndicator

* show progress

```objective-c
[FTProgressIndicator showProgressWithmessage:@"Here is a progress message."]; 
```

```objective-c
// or disable user interactions
[FTProgressIndicator showProgressWithmessage:@"Here is a progress message." userInteractionEnable:NO]; 
```

* show success

```objective-c
[FTProgressIndicator showSuccessWithMessage:@"Here is a success message."]; 
```

```objective-c
// or disable user interactions
[FTProgressIndicator showSuccessWithMessage:@"Here is a success message." userInteractionEnable:NO]; 
```

* show info

```objective-c
[FTProgressIndicator showInfoWithMessage:@"Here is a info message."]; 
```

```objective-c
// or disable user interactions
[FTProgressIndicator showInfoWithMessage:@"Here is a info message." userInteractionEnable:NO]; 
```
	
* show error

```objective-c
[FTProgressIndicator showErrorWithMessage:@"Here is a error message."];
```

```objective-c
// or disable user interactions
[FTProgressIndicator showErrorWithMessage:@"Here is a error message." userInteractionEnable:NO];
```

* dismiss manually

```objective-c
[FTProgressIndicator dismiss];
```
							
### FTToastIndicator

* show with image

```objective-c
[FTToastIndicator showToastMessage:@"Short Toast."];  
```
								
* dismiss manually

```objective-c
[FTToastIndicator dismiss];
```

# CHANGELOG

[CHANGELOG](https://github.com/liufengting/FTIndicator/blob/master/CHANGELOG.md)

# License

`FTIndicator` is available under the MIT license. See the LICENSE file for more info. 



