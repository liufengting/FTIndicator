# FTIndicator

[![Twitter](https://img.shields.io/badge/twitter-@liufengting-blue.svg?style=flat)](http://twitter.com/liufengting) 
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/liufengting/FTIndicator/master/LICENSE)
[![Version](https://img.shields.io/cocoapods/v/FTIndicator.svg?style=flat)](http://cocoapods.org/pods/FTIndicator)
[![Platform](https://img.shields.io/cocoapods/p/FTIndicator.svg?style=flat)](http://cocoapods.org/pods/FTIndicator)
[![CocoaPods](https://img.shields.io/cocoapods/dt/FTIndicator.svg?maxAge=2592000)](http://cocoapods.org/pods/FTIndicator)
[![CI Status](http://img.shields.io/travis/liufengting/FTIndicator.svg?style=flat)](https://travis-ci.org/liufengting/FTIndicator)
[![GitHub stars](https://img.shields.io/github/stars/liufengting/FTIndicator.svg)](https://github.com/liufengting/FTIndicator/stargazers)


A light wight UI package contains local notification, progress HUD, toast, with blur effect, elegant API and themes Support. Inspried by Apple's process indicator and notifications.

# ScreenShots

## Portriat

| Style	| Light	| Dark	|
|:-------------:|:-------------:|:-------------:|
| Notification | <img src="/ScreenShots/Portriat/notification_L_P.jpg" width="300"/> | <img src="/ScreenShots/Portriat/notification_D_P.jpg" width="300"/> |
| Progress | <img src="/ScreenShots/Portriat/progress_L_P.jpg" width="300"/> | <img src="/ScreenShots/Portriat/progress_D_P.jpg" width="300"/> |
| Toast | <img src="/ScreenShots/Portriat/toast_L_P.jpg" width="300"/> | <img src="/ScreenShots/Portriat/toast_D_P.jpg" width="300"/> |

## Landscape

| Style	| Light	| Dark	|
|:-------------:|:-------------:|:-------------:|
| Notification | <img src="/ScreenShots/Landscape/notification_L_L.jpg" width="300"/> | <img src="/ScreenShots/Landscape/notification_D_L.jpg" width="300"/> |
| Progress | <img src="/ScreenShots/Landscape/progress_L_L.jpg" width="300"/> | <img src="/ScreenShots/Landscape/progress_D_L.jpg" width="300"/> |
| Toast | <img src="/ScreenShots/Landscape/toast_L_L.jpg" width="300"/> | <img src="/ScreenShots/Landscape/toast_D_L.jpg" width="300"/> |

# 3 IN 1

 If you want use all three of the indicators, use `FTIndicator` .
 
 Also, `FTNotificationIndicator`, `FTProgressIndicator` and `FTToastIndicator` are able to work separately. Use them all your will.

 ---
 
* FTIndicator
	* FTNotificationIndicator
	* FTProgressIndicator
	* FTToastIndicator

---
 

# Installation

## Manually

* clone this repo.
* Simply drop the '/FTIndicator' folder into your project.
* import 'FTIndicator.h'
* Enjoy！ 

## Cocoapods

`FTIndicator` is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

### Use all three of them 

* FTIndicator, 3 in 1 

```ruby
pod 'FTIndicator'
```

### Use separately

* FTNotificationIndicator

```ruby
pod 'FTNotificationIndicator'
```

* FTProgressIndicator

```ruby
pod 'FTProgressIndicator'
```

* FTToastIndicator

```ruby
pod 'FTToastIndicator'
```

# Useage

## Use `FTIndicator`

* Notification

```objective-c

// show with image
[FTIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
								   title:@"Here is a notification title."
                               message:@"Here is a notification message."]; 

// show without image
[FTIndicator showNotificationWithTitle:@"Here is a notification title."
								message:@"Here is a notification message."]; 
								
// dismiss manually
[FTIndicator dismissNotification];
							
```
* Progress

```objective-c

// show progress
[FTIndicator showProgressWithmessage:@"Here is a progress message."]; 

// show success
[FTIndicator showSuccessWithMessage:@"Here is a success message."]; 

// show info
[FTIndicator showInfoWithMessage:@"Here is a info message."]; 
	
// show error
[FTIndicator showErrorWithMessage:@"Here is a error message."];

// dismiss manually
[FTIndicator dismissProgress];
							
```
* Toast

```objective-c

// show with image
[FTIndicator showToastMessage:@"Short Toast."];  
								
// dismiss manually
[FTIndicator dismissToast];
							
```


## Use `FTNotificationIndicator`, `FTProgressIndicator`, `FTToastIndicator` separately

* FTNotificationIndicator

```objective-c

// show with image
[FTNotificationIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
                                             title:@"Here is a notification title."
                                           message:@"Here is a notification message."]; 

// show without image
[FTNotificationIndicator showNotificationWithTitle:@"Here is a notification title."
										     message:@"Here is a notification message."]; 
								
// dismiss manually
[FTNotificationIndicator dismiss];
							
```
* FTProgressIndicator

```objective-c

// show progress
[FTProgressIndicator showProgressWithmessage:@"Here is a progress message."]; 

// show success
[FTProgressIndicator showSuccessWithMessage:@"Here is a success message."]; 

// show info
[FTProgressIndicator showInfoWithMessage:@"Here is a info message."]; 
	
// show error
[FTProgressIndicator showErrorWithMessage:@"Here is a error message."];

// dismiss manually
[FTProgressIndicator dismiss];
							
```
* FTToastIndicator

```objective-c

// show with image
[FTToastIndicator showToastMessage:@"Short Toast."];  
								
// dismiss manually
[FTToastIndicator dismiss];
							
```


# License

`FTIndicator` is available under the MIT license. See the LICENSE file for more info. 
`FTNotificationIndicator` is available under the MIT license. See the LICENSE file for more info. 
`FTProgressIndicator` is available under the MIT license. See the LICENSE file for more info. 
`FTToastIndicator` is available under the MIT license. See the LICENSE file for more info. 


