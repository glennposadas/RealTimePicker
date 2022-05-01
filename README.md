# RealTimePicker

### RealTimePicker is an elegant and customizable time picker written in Swift.
<!-- 
<p align="center">
    <img src="https://github.com/toure20/RealTimePicker/blob/master/Screenshots/hour_min_screen.png" width="35%" height="35%" alt="Screenshot Preview" />
</p> -->

| 12-h format | 24-h format | Black background | Example Usage |
| --- | --- | --- | --- |
| <img width=220px src="https://github.com/toure20/RealTimePicker/blob/master/Screenshots/example_screen_1.png" /> | <img width=220px src=https://github.com/toure20/RealTimePicker/blob/master/Screenshots/example_screen_2.png /> | <img width=220px src=https://github.com/toure20/RealTimePicker/blob/master/Screenshots/example_screen_3.png /> | <img width=220px src=https://github.com/toure20/RealTimePicker/blob/master/Screenshots/example_usage_1.png /> |

<p align="center">
    <img src="https://img.shields.io/badge/Platform-iOS_12+-green.svg" alt="Platform: iOS 12.0+" />
    <a href="https://developer.apple.com/swift" target="_blank"><img src="https://img.shields.io/badge/Language-Swift_5-blueviolet.svg" alt="Language: Swift 5" /></a>
    <a href="https://cocoapods.org/pods/RealTimePicker" target="_blank"><img src="https://img.shields.io/badge/CocoaPods-v1.0-red.svg" alt="CocoaPods compatible" /></a>
    <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT" />
</p>

## Installation

* <a href="https://guides.cocoapods.org/using/using-cocoapods.html" target="_blank">CocoaPods</a>:

```ruby
pod 'RealTimePicker'
```

## Usage

RealTimePickerView was designed over UIPickerView and can be used to pick time (hour, minute) with 24-h and 12-h format. Simply create `RealTimePickerView()` in the same way you would expect to present `UIPickerView` and use as a subview.

```swift
let view = RealTimePickerView(format: .h24, tintColor: .white)
view.rowHeight = 60 // default row height is 60
let fontSize = 44
view.timeLabelFont = UIFont.systemFont(ofSize: fontSize, weight: .semibold) // default size is 44
view.colonLabelFont = UIFont.systemFont(ofSize: fontSize * 0.75, weight: .bold) // default size
view.formatLabelFont = UIFont.systemFont(ofSize: 24, weight: .semibold) // default size is 24
view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
view.layer.cornerRadius = 24
```

### Sample App

Check out the [Sample App](https://github.com/toure20/RealTimePicker/tree/master/RealTimePickerExamples) for more complex configurations of `RealTimePickerView`, including how to change hour format, time components and apply layout constaints.

## License

<b>RealTimePicker</b> is released under a MIT License. See LICENSE file for details. Requires **iOS 12+** and is compatible with **Swift 5** projects.
