import Cocoa

class ReminderViewController: NSViewController {

    private let containerView  = NSView()
    private let emojiLabel     = NSTextField(labelWithString: "🧘")
    private let titleLabel     = NSTextField(labelWithString: "Time to stretch!")
    private let bodyLabel      = NSTextField(labelWithString: "Stand up, roll your shoulders,\nand take a few deep breaths.")
    private let dismissButton  = NSButton(title: "Got it", target: nil, action: nil)

    // MARK: - Lifecycle

    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 200))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupLabels()
        setupButton()
        layoutViews()
    }

    // MARK: - Setup Methods

    private func setupBackground() {
        // "wantsLayer = true" turns on Core Animation for this view.
        // You need this to set background color, corner radius, shadows, etc.
        containerView.wantsLayer = true
        
        containerView.layer?.backgroundColor = NSColor(white: 0.12, alpha: 0.95).cgColor
        containerView.layer?.cornerRadius = 16
        containerView.layer?.masksToBounds = true

        containerView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(containerView)
    }

    private func setupLabels() {

        // --- Emoji ---
        emojiLabel.font = .systemFont(ofSize: 36)
        emojiLabel.alignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false

        // --- Title ---
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.alignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // --- Body ---
        bodyLabel.font = .systemFont(ofSize: 13)
        bodyLabel.textColor = NSColor(white: 0.75, alpha: 1)  // Light gray
        bodyLabel.alignment = .center
        bodyLabel.maximumNumberOfLines = 3   // Wrap at 3 lines max
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

        // "$0" means "the current item in the loop"
        [emojiLabel, titleLabel, bodyLabel].forEach { containerView.addSubview($0) }
    }

    private func setupButton() {
        dismissButton.bezelStyle = .rounded
        dismissButton.contentTintColor = .white
        dismissButton.target = self
        dismissButton.action = #selector(dismissTapped)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(dismissButton)
    }

    // MARK: - Layout (Auto Layout Constraints)

    private func layoutViews() {

        NSLayoutConstraint.activate([

            // --- Container fills the entire view ---
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            // --- Emoji: 24px from top, horizontally centered ---
            emojiLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            emojiLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            // --- Title: 8px below emoji, pinned to side margins ---
            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            // --- Body: 8px below title ---
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),

            // --- Button: 16px below body, centered ---
            dismissButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 16),
            dismissButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            // "lessThanOrEqualTo" gives flexibility — the button won't get cut off
            // if the text is longer than expected
            dismissButton.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -16),
        ])
    }

    // MARK: - Actions

    @objc private func dismissTapped() {
        if let wc = view.window?.windowController as? ReminderWindowController {
            wc.dismiss()
        }
    }
}
