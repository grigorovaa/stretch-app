import Cocoa

enum ExerciseState {
    case idle, counting, complete
}

class ReminderViewController: NSViewController {

    private let containerView  = NSView()
    private let emojiLabel     = NSTextField(labelWithString: "🧘")
    private let titleLabel     = NSTextField(labelWithString: "Time to stretch!")
    private let bodyLabel      = NSTextField(labelWithString: "")
    private let countdownLabel = NSTextField(labelWithString: "30")
    private let startButton    = NSButton(title: "Start", target: nil, action: nil)
    private let skipButton     = NSButton(title: "Skip", target: nil, action: nil)
    private let doneButton     = NSButton(title: "Done", target: nil, action: nil)
    private var idleConstraints: [NSLayoutConstraint] = []
    private var countingConstraints: [NSLayoutConstraint] = []

    private var countdownTimer: Timer?
    private var secondsLeft: Int = 30
    private var state: ExerciseState = .idle

    // MARK: - Lifecycle

    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 300, height: 260))
        view.wantsLayer = true
        view.layer?.masksToBounds = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupLabels()
        setupButtons()
        layoutViews()
        applyState(.idle)
    }

    // MARK: - Setup

    private func setupBackground() {
        containerView.wantsLayer = true
        containerView.layer?.backgroundColor = NSColor(white: 0.12, alpha: 0.95).cgColor
        containerView.layer?.cornerRadius = 16
        containerView.layer?.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
    }

    private func setupLabels() {
        emojiLabel.font = .systemFont(ofSize: 36)
        emojiLabel.alignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textColor = .white
        titleLabel.alignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        bodyLabel.font = .systemFont(ofSize: 14)
        bodyLabel.textColor = NSColor(white: 0.75, alpha: 1)
        bodyLabel.alignment = .center
        bodyLabel.preferredMaxLayoutWidth = 260
        bodyLabel.maximumNumberOfLines = 0
        bodyLabel.lineBreakMode = .byWordWrapping
        bodyLabel.cell?.wraps = true
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.cell?.alignment = .center


        // Big countdown number
        countdownLabel.font = .boldSystemFont(ofSize: 48)
        countdownLabel.textColor = .white
        countdownLabel.alignment = .center
        countdownLabel.translatesAutoresizingMaskIntoConstraints = false

        [emojiLabel, titleLabel, bodyLabel, countdownLabel].forEach { containerView.addSubview($0) }
    }

    private func setupButtons() {
        startButton.bezelStyle = .rounded
        startButton.title = "Start"
        startButton.target = self
        startButton.action = #selector(startTapped)
        startButton.translatesAutoresizingMaskIntoConstraints = false

        skipButton.bezelStyle = .rounded
        skipButton.title = "Skip"
        skipButton.target = self
        skipButton.action = #selector(skipTapped)
        skipButton.translatesAutoresizingMaskIntoConstraints = false

        doneButton.bezelStyle = .rounded
        doneButton.title = "Done"
        doneButton.target = self
        doneButton.action = #selector(doneTapped)
        doneButton.translatesAutoresizingMaskIntoConstraints = false

        [startButton, skipButton, doneButton].forEach { containerView.addSubview($0) }
    }

    func update(with exercise: Exercise) {
        emojiLabel.stringValue = exercise.emoji
        titleLabel.stringValue = exercise.title
        bodyLabel.stringValue = exercise.description
        secondsLeft = 30
        applyState(.idle)
    }

    // MARK: - State

    private func applyState(_ newState: ExerciseState) {
        state = newState
        switch state {
        case .idle:
            NSLayoutConstraint.deactivate(countingConstraints)
            NSLayoutConstraint.activate(idleConstraints)
            countdownLabel.isHidden = true
            bodyLabel.isHidden = false
            startButton.isHidden = false
            skipButton.isHidden = false
            doneButton.isHidden = true

        case .counting:
            NSLayoutConstraint.deactivate(idleConstraints)
            NSLayoutConstraint.activate(countingConstraints)
            countdownLabel.isHidden = false
            bodyLabel.isHidden = true
            startButton.isHidden = true
            skipButton.isHidden = false
            doneButton.isHidden = true

        case .complete:
            countdownLabel.isHidden = true
            bodyLabel.isHidden = false
            bodyLabel.stringValue = "Great job! 💪"
            startButton.isHidden = true
            skipButton.isHidden = true
            doneButton.isHidden = false
        }
    }

    // MARK: - Actions

    @objc private func startTapped() {
        secondsLeft = 30
        countdownLabel.stringValue = "\(secondsLeft)"
        applyState(.counting)

        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.secondsLeft -= 1
            self.countdownLabel.stringValue = "\(self.secondsLeft)"

            if self.secondsLeft <= 0 {
                self.countdownTimer?.invalidate()
                self.applyState(.complete)
            }
        }
    }

    @objc private func skipTapped() {
        countdownTimer?.invalidate()
        dismiss()
    }

    @objc private func doneTapped() {
        dismiss()
    }

    private func dismiss() {
        if let wc = view.window?.windowController as? ReminderWindowController {
            wc.dismiss()
        }
    }

    // MARK: - Layout

    private func layoutViews() {
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 260),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            emojiLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            emojiLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 260),

            bodyLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10),
            bodyLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            bodyLabel.widthAnchor.constraint(equalToConstant: 260),

            countdownLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            countdownLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),

            doneButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -34),
        ])

        idleConstraints = [
            startButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -34),
            startButton.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -8),
            skipButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -34),
            skipButton.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 8),
        ]

        countingConstraints = [
            skipButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -34),
            skipButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ]

        NSLayoutConstraint.activate(idleConstraints)
    }
}
