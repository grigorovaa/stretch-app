import Cocoa

class ReminderViewController: NSViewController {

    private let containerView  = NSView()
    private let emojiLabel     = NSTextField(labelWithString: "🧘")
    private let titleLabel     = NSTextField(labelWithString: "Time to stretch!")
    private let bodyLabel      = NSTextField(labelWithString: "Stand up, roll your shoulders,\nand take a few deep breaths.")
    private let dismissButton  = NSButton(title: "Got it", target: nil, action: nil)

    // MARK: - Lifecycle
    
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 320, height: 220))
        view.wantsLayer = true
        view.layer?.masksToBounds = true
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
        bodyLabel.textColor = NSColor(white: 0.75, alpha: 1)
        bodyLabel.alignment = .center
        bodyLabel.maximumNumberOfLines = 0
        bodyLabel.lineBreakMode = .byWordWrapping
        bodyLabel.cell?.wraps = true
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
    
    func update(with exercise: Exercise) {
        emojiLabel.stringValue = exercise.emoji
        titleLabel.stringValue = exercise.title
        bodyLabel.stringValue = exercise.description
    }

    // MARK: - Layout (Auto Layout Constraints)

    private func layoutViews() {

        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 320),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            emojiLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -60),

            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 260),

            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            bodyLabel.widthAnchor.constraint(equalToConstant: 260),

            dismissButton.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 16),
            dismissButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
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
