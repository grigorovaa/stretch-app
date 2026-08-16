import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem?
    var reminderWindowController: ReminderWindowController?
    var hourlyTimer: Timer?
    var exerciseIndex: Int = 0
    var isSeated: Bool = true
    
    let timeInterval: TimeInterval = 3600
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupMenuBarIcon()
        setupTimer()
    }

    // MARK: - Menu Bar

    func setupMenuBarIcon() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "figure.walk", accessibilityDescription: "Stretch Reminder")
        }
        updateMenu()
    }

    func updateMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Stretch Now!", action: #selector(showReminder), keyEquivalent: "s"))
        menu.addItem(.separator())
        let toggleTitle = isSeated ? "📍 Seated mode (tap to switch)" : "🚶 Standing mode (tap to switch)"
        menu.addItem(NSMenuItem(title: toggleTitle, action: #selector(toggleMode), keyEquivalent: "t"))
        menu.addItem(.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem?.menu = menu
    }

    @objc func toggleMode() {
        isSeated.toggle()
        updateMenu()
    }

    // MARK: - Timer

    func setupTimer() {
        hourlyTimer = Timer.scheduledTimer(
            timeInterval: timeInterval,
            target: self,
            selector: #selector(showReminder),
            userInfo: nil,
            repeats: true
        )
    }

    // MARK: - Show Reminder

    @objc func showReminder() {
        let exercises = isSeated ? seatedExercises : standingExercises
        let exercise = exercises[exerciseIndex % exercises.count]
        exerciseIndex += 1

        reminderWindowController?.dismiss()  // close existing window first
        reminderWindowController = ReminderWindowController()
        reminderWindowController?.update(with: exercise)
        reminderWindowController?.showAnimated()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }
}
