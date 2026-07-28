import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    // These are instance variables — they persist for the life of the app.
    var statusItem: NSStatusItem?          // The icon in the menu bar
    var reminderWindowController: ReminderWindowController?
    var hourlyTimer: Timer?

    func applicationDidFinishLaunching(_ notification: Notification) {
        setupMenuBarIcon()
        setupTimer()
    }

    // MARK: - Menu Bar Icon

    func setupMenuBarIcon() {
        // NSStatusBar.system is the macOS menu bar.
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "figure.walk", accessibilityDescription: "Stretch Reminder")
        }

        let menu = NSMenu()
        // Each NSMenuItem needs a title, a selector (function to call), and an optional keyboard shortcut.
        menu.addItem(NSMenuItem(title: "Stretch Now!", action: #selector(showReminder), keyEquivalent: "s"))
        menu.addItem(.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

        statusItem?.menu = menu
        // When a menu is set, clicking the icon shows the menu.
        // When no menu is set, you can handle clicks with button.action instead.
    }

    // MARK: - Timer

    func setupTimer() {
        hourlyTimer = Timer.scheduledTimer(
            timeInterval: 3600,
            target: self,
            selector: #selector(showReminder),
            userInfo: nil,
            repeats: true
        )
    }

    // MARK: - Show Reminder

    @objc func showReminder() {
        if reminderWindowController == nil {
            reminderWindowController = ReminderWindowController()
        }
        reminderWindowController?.showAnimated()
        reminderWindowController?.startDismissTimer()
    }

    // Prevent the app from quitting when all windows are closed.
    // Without this, closing the panel would quit the app.
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }
}
