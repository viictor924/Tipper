# Pre-work - TabMan

TabMan is a tip calculator application for iOS.

Submitted by: Victor Rodriguez

Time spent: 15 hours spent in total

## User Stories
The following **required** functionality is complete:
* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
* [X] Added a light/dark color theme to the settings view. In viewWillAppear, updated views with the correct theme colors.

## Video Walkthroughs 
Here's a walkthrough of implemented user stories:

Version 1
<img src='http://i.imgur.com/9TpITLH.gif' title='Version 1' width='' alt='Video Walkthrough' />


Version 2
<img src='http://i.imgur.com/Ql4hCew.gif' title='Version 2' width='' alt='Video Walkthrough' />


Version 3
<No gif since this change was remembering the bill amount across app restarts (if <10mins)


Version 4
<img src='http://imgur.com/LGTftCJ' title='Version 4' width='' alt='Video Walkthrough' />


Version 5
<img src='http://imgur.com/1GJ4Cki' title='Version 5' width='' alt='Video Walkthrough' />
GIFs created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
Screen flashes white when I go from settings view to the view controller. I think this happens because I'm getting the following error message: "Can't find keyplane that supports type 8 for keyboard iPhone-PortraitChoco-DecimalPad; using 3489728860_PortraitChoco_iPhone-Simple-Pad_Default" The error message has nothing to do with my code so I decided not to waste effort on trying to fix it. Honestly, I think it's an X-code bug, I tried unchecking the "Connect hardware keyboard" box on the simulator but that didn't fix it.

## License

    Copyright [2016] [Victor Rodriguez]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
