# HIGuidePage

[![CI Status](https://img.shields.io/travis/hellohufan/HIGuidePage.svg?style=flat)](https://travis-ci.org/hellohufan/HIGuidePage)
[![Version](https://img.shields.io/cocoapods/v/HIGuidePage.svg?style=flat)](https://cocoapods.org/pods/HIGuidePage)
[![License](https://img.shields.io/cocoapods/l/HIGuidePage.svg?style=flat)](https://cocoapods.org/pods/HIGuidePage)
[![Platform](https://img.shields.io/cocoapods/p/HIGuidePage.svg?style=flat)](https://cocoapods.org/pods/HIGuidePage)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HIGuidePage is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HIGuidePage'
```
## Usege
(see sample Xcode project in /Demo)
Using 'HIGuidePage' in your app will usually look as simple as this:
```objc
NSArray *images = @[HIGUIDEPAGE_IMAGE(@"1.png"), HIGUIDEPAGE_IMAGE(@"2.png"), HIGUIDEPAGE_IMAGE(@"3.png")];
[HIGuidePage appearance].pageControlBottomSpace = @(20);
[HIGuidePage appearance].lastButtonBottmSpace = @(80);

HIGuidePage *guideView = [HIGuidePage instance];

__weak HIAppDelegate* weakDelegate = self;
[guideView showGuideViewWithImages:images withCompletionBlock:^(void){
    [weakDelegate.window makeKeyWindow];
}];
```

## Autho

hellohufan, hellohufan@gmail.com

## License

HIGuidePage is available under the MIT license. See the LICENSE file for more info.
