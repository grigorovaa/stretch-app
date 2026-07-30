import Cocoa

class ReminderWindowController: NSWindowController {

    var dismissTimer: Timer?

    convenience init() {
        let panel = NSPanel(
            contentRect: NSRect(x: 0, y: 0, width: 320, height: 220),
            styleMask: [.borderless, .nonactivatingPanel], // Appearing won't steal keyboard focus from your work
            backing: .buffered,
            defer: false
        )

        panel.level = .floating          // Float above normal app windows
        panel.isOpaque = false           // Allow transparent backgrounds
        panel.backgroundColor = .clear   // Our view will handle the background color
        panel.hasShadow = true           // Drop shadow for a polished look
        panel.isMovableByWindowBackground = true  // User can drag it by clicking anywhere
        panel.minSize = NSSize(width: 320, height: 220)
        panel.maxSize = NSSize(width: 320, height: 220)

        self.init(window: panel)

        let vc = ReminderViewController()
        panel.contentViewController = vc

        positionPanel(panel)
    }

    private func positionPanel(_ panel: NSPanel) {
        guard let screen = NSScreen.main else { return }

        let screenRect = screen.visibleFrame
        let panelWidth: CGFloat = 320
        let panelHeight: CGFloat = 220

        let x = screenRect.maxX - panelWidth - 20
        let y = screenRect.minY + 20

        panel.setFrame(NSRect(x: x, y: y, width: panelWidth, height: panelHeight), display: false)
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
        
        positionPanel(window as! NSPanel)

        let targetFrame = window.frame

        // Start position: off to the right, off screen
        var startFrame = targetFrame
        startFrame.origin.x = targetFrame.origin.x + targetFrame.width + 40

        window.setFrame(startFrame, display: false)
        window.alphaValue = 0
        window.orderFront(nil)  // make it exist on screen (still invisible)

        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.45
            context.timingFunction = CAMediaTimingFunction(name: .easeOut)
            window.animator().setFrame(targetFrame, display: true)  // slide left
            window.animator().alphaValue = 1                        // fade in
        }
    }
    
    func update(with exercise: Exercise) {
        if let vc = contentViewController as? ReminderViewController {
            vc.update(with: exercise)
        }
    }
    
    @objc func dismiss() {
        dismissTimer?.invalidate()
        window?.orderOut(nil)
    }
}
