# Pre-work - *Tip the Help*

**Tip the Help** is a tip calculator application for iOS.

Submitted by: **Bryan Meyer**

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is complete:

* [ x ] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [ x ] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:
* [ x ] Added error checking/correction for tip settings such that if the % sign is missing it will assume it was referring to a percent and if invalid characters are typed (such as letters) then it will default to 0%
- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
With the recent release of new iOS 10, SWIFT 3.0 and new Xcode version, there were many differences and changes to libraries, calls, etc. Many of the self-help resources that I found were referring to older versions - so I had to dig through the noise to find useful help.  Overall, this forced me to learn to read through SWIFT library code and learn to use the auto-complete function definitions to write code.

I'm not sure why the Navigation Title of "Tip the Calc" stopped showing. I tried manually setting it using:
        self.navigationController?.navigationBar.topItem!.title = "Tip the Help"
However that didn't help in making it appear.  There may some issue with Xcode or the simulator - I read some forums discussing bugs with the simulator and navigation buttons.

LiceCap records a black screen and only cursor movements, even though I have a fully visible simulation running

## License

    Copyright [2016] [Bryan Meyer]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.