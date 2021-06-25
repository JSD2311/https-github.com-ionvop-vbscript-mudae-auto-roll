# VBScript Mudae Auto-roll

## Introduction

This is basically a tool written in VBScript that helps sending slash command rolls like `/wx` on Mudae to be consistent under Discord's limitations of 2 slash commands per 5 seconds, so it's no longer needed to have to copy paste and having to wait around 4 seconds every after 2 commands

There are 2 windows that will pop up upon running this script.\
One is for starting the program, and the other one is for killing the script in case if it goes rogue since I have yet to find a way for the script to detect the which window is currently active

Upon starting the program, there will be a 3 second delay before it starts to give time for the preparations like putting the cursor onto the chatbox to type the command.\
There are currently 2 actions that can be done while it's rolling.\
If the key `c` is pressed, the program will stop rolling and waits for the next operation.\
If the key `space` is pressed, the program will stop rolling, and immediately claim the last rolled character as long as the `$perstogglereact` is set to 1

<br>

## Technical explanations

How this program works is it basically sends `/wx` every approximately 3 seconds to keep pace with Discord's limitations of 2 slash commands per 5 seconds until it receives an instruction to stop (like when the key `c` or `space` is pressed)

While the program is rolling, if the key `space` is pressed, it will stop rolling and immediately claim the last character that has been rolled.\
This is done by sending `+:heart:` which reacts to the last message with a heart emote.\
Though it will only work if `$perstogglereact` is set to 1 because if Mudae provided a react to its embed, it will ignore any other reacts other than the one provided for a few seconds, which makes it vulnerable to snipers if you rely on the `space` action

How the keys like `c` and `space` are detected is by copying what's on the chatbox every 100 milliseconds and performing an action depending on the value of the clipboard.\
I also have yet to find a way to use a key detector instead of the current method to make the code look more like what it was intended to be instead of relying on a workaround

<br>

## Planned updates

This project, like all my other projects, is just made for personal fun.\
This was not made to be practically used by others.\
But I am still going to add a few little features to make it convenient for myself whenever I use it

I'm planning on adding an optional setting menu to set up what commands it's going to send (like `/mx`, `/wa`, or `/hg`) every how many seconds (default is 3 seconds) for a set number of times (default is loop until the key `c` or `space` is pressed)

There are some known bugs like every first execution of the code `objShell.sendkeys("~")` (which basically simulates pressing the enter key) usually never works, and I honsetly don't know why.\
I also have to find a better failsafe whenever the window goes out of focus which causes the script to go rogue and do unexpected actions outside the window, like checking whether the current active window is the correct one.\
It would make the program much safer for myself, and incase if anyone for some reason decided to use this

<br>

## Questions I ask myself about this tool

#### Why use slash commands when you can just spam $w?
I like the double claim time and the bonus kakera that comes with it

#### Why the c key when stopping the program?
idk

#### Why VBScript?
i like to suffer
