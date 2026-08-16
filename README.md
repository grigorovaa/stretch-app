
# Stretch

A macOS menu bar app that reminds you to stretch every hour. Each reminder shows a different exercise with a 30-second countdown timer. Exercises are filtered by whether you're sitting or standing.

<img width="300" alt="standing" src="https://github.com/user-attachments/assets/f8214678-5ec1-48d6-ae53-e6cd11609632" />
<img width="300" alt="seated" src="https://github.com/user-attachments/assets/a919bbf8-d5e8-4ef8-93f7-bf401a3efaf7" />
<img width="300" alt="timer" src="https://github.com/user-attachments/assets/e2d4c39b-08e9-4e55-9fe7-7549bc848d6c" />
<img width="300" alt="done" src="https://github.com/user-attachments/assets/54b66798-c25a-4b0c-a8df-e8af9fd84225" />
<img width="300" alt="icon" src="https://github.com/user-attachments/assets/e71160d2-c732-44d4-ac90-881130d342d6" />
<img width="300" alt="mode_switch" src="https://github.com/user-attachments/assets/1ad40e2c-3e12-4372-9693-0de806611acc" />

## Features

- Appears in the menu bar, no Dock icon
- 7 seated and 7 standing exercises, cycling hourly
- Toggle between seated/standing mode from the menu bar
- 30-second countdown timer per exercise
- Slides in from the right with a fade animation
- Start, Skip, and Done buttons

## Requirements

- macOS 12 or later
- Xcode 15 or later

## Setup

1. Clone the repo
2. Open `stretch.xcodeproj` in Xcode
3. Press `Cmd+R` to build and run
4. Look for the walking figure icon in your menu bar

## Testing

To test without waiting an hour, temporarily add `showReminder()` at the end of `applicationDidFinishLaunching` in `AppDelegate.swift`, or use right-click on the menu bar icon and select "Stretch Now!".

## Project Structure

| File | Description |
|---|---|
| `AppDelegate.swift` | App entry point, menu bar icon, hourly timer |
| `Exercise.swift` | Exercise data model and exercise lists |
| `ReminderWindowController.swift` | Floating panel setup, position, animation |
| `ReminderViewController.swift` | UI layout and state machine (idle, counting, complete) |

## Planned

- Animated illustrations for each exercise
- Streak tracking
- Customisable reminder interval
- Sound or haptic feedback on completion
- Onboarding flow
