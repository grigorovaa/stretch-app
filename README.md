
# Stretch

A macOS menu bar app that reminds you to stretch every hour. Each reminder shows a different exercise with a 30-second countdown timer. Exercises are filtered by whether you're sitting or standing.

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
