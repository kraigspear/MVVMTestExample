# MVVMTestExample
Simple example of testing in iOS using the MVVM pattern

The general idea is to offload as much as possible out of UIViewController and into a ViewModel. 
A ViewModel is more testable and is not tied to any specfic UI Toolkit, such as UIKit, AppKit ext...

It is worth considering that a ViewModel should not handle more logic that was is needed for a view presentation. 
(This example actually violates this, but I'm going for simplicty) 

As code is moved from Objective-C to Swift, this pattern could be used to make an App more testable. 



