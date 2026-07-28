import Cocoa

class ReminderWindowController: NSWindowController {

    var dismissTimer: Timer?

    convenience init() {
        let panel = NSPanel(
            contentRect: NSRect(x: 0, y: 0, width: 320, height: 200),

            styleMask: [
                .borderless,
                .nonactivatingPanel    // Appearing won't steal keyboard focus from your work
            ],
            backing: .buffered,   // The window is drawn offscreen first (smoother)
            defer: false          // Create it immediately, not lazily
        )

        panel.level = .floating          // Float above normal app windows
        panel.isOpaque = false           // Allow transparent backgrounds
        panel.backgroundColor = .clear   // Our view will handle the background color
        panel.hasShadow = true           // Drop shadow for a polished look
        panel.isMovableByWindowBackground = true  // User can drag it by clicking anywhere

        self.init(window: panel)

        let vc = ReminderViewController()
        panel.contentViewController = vc

        // Position the panel in the bottom-right corner, above the Dock.
        // We calculate this from the screen size so it works on any display.
        positionPanel(panel)
    }

    private func positionPanel(_ panel: NSPanel) {
        // NSScreen.main is the screen where the menu bar lives.
        // visibleFrame excludes the Dock and menu bar, so our panel won't overlap them.
        guard let screen = NSScreen.main else { return }

        let screenRect = screen.visibleFrame
        let panelSize  = panel.frame.size

        let x = screenRect.maxX - panelSize.width - 20
        let y = screenRect.minY + 20

        panel.setFrameOrigin(NSPoint(x: x, y: y))
    }

    func startDismissTimer(after seconds: TimeInterval = 20) {
        dismissTimer?.invalidate()
        dismissTimer = Timer.scheduledTimer(
            timeInterval: seconds,
            target: self,
            selector: #selector(dismiss),
            userInfo: nil,
            repeats: false
        )
    }

    func showAnimated() {
        guard let window = window else { return }

        let targetFrame = window.frame

        // Start position: off to the right, off screen
        var startFrame = targetFrame
        startFrame.origin.x = targetFrame.origin.x + targetFrame.width + 40

        window.setFrame(startFrame, display: false)  // move to start (no draw)
        window.alphaValue = 0
        window.orderFront(nil)  // make it exist on screen (still invisible)

        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.45
            context.timingFunction = CAMediaTimingFunction(name: .easeOut)
            window.animator().setFrame(targetFrame, display: true)  // slide left
            window.animator().alphaValue = 1                        // fade in
        }
    }
    
    @objc func dismiss() {
        dismissTimer?.invalidate()
        window?.orderOut(nil)
    }
}
