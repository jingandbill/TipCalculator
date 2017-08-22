# Pre-work - Tip Calculator

TipCalculator is a tip calculator application for iOS.

Submitted by: Jing Welch

Time spent: 6 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/a/EXJUs' title='Tip Calculator Walkthrough' width='' alt='Tip Calculator Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** The iOS app development platform is very similar to that of C#, which I have worked on professionally for a couple of years. Even though I had zero experience going into this pre-work, it was relatively easy to pick up. I would describe outlets as variable definitions of the UI objects that you can set and get in code. I would describe actions as events that are triggered by the user. They give an entry into the codebase on how to handle them.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** A strong reference cycle can occur for closures. If the closure accesses either the instance’s property or calls its method, a strong reference cycle can be created. The instance’s property will hold a strong reference to the closure, and the closure will hold a strong reference back to the instance. Thus, a strong reference cycle is created between the two. To fix the strong reference cycle problem, a capture list should be defined in the closure. Each captured reference should be declared as weak or unowned.


## License

    Copyright 2017 Jing Welch

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
