import Foundation

enum ExerciseCategory {
    case seated, standing
}

struct Exercise {
    let title: String
    let description: String
    let emoji: String
    let category: ExerciseCategory
}

// All 7 exercises for each category
let seatedExercises: [Exercise] = [
    Exercise(title: "Neck Roll", description: "Slowly roll your neck in a full circle, 3 times each way.", emoji: "🔄", category: .seated),
    Exercise(title: "Shoulder Shrugs", description: "Raise both shoulders to your ears, hold 3 seconds, release. Repeat 5 times.", emoji: "🤷", category: .seated),
    Exercise(title: "Wrist Stretch", description: "Extend one arm, pull fingers back gently. Hold 15 seconds each side.", emoji: "🖐️", category: .seated),
    Exercise(title: "Seated Spinal Twist", description: "Sit tall, twist gently to the right, hold 15s. Then left.", emoji: "🌀", category: .seated),
    Exercise(title: "Eye Rest", description: "Look at something 20 feet away for 20 seconds. Blink slowly.", emoji: "👁️", category: .seated),
    Exercise(title: "Chest Opener", description: "Interlace fingers behind your head, gently squeeze shoulder blades. Hold 15s.", emoji: "💪", category: .seated),
    Exercise(title: "Ankle Circles", description: "Lift both feet slightly, rotate ankles 5 times each direction.", emoji: "🦶", category: .seated),
]

let standingExercises: [Exercise] = [
    Exercise(title: "Calf Raises", description: "Rise onto your toes, hold 2 seconds, lower. Repeat 10 times.", emoji: "🦵", category: .standing),
    Exercise(title: "Shoulder Stretch", description: "Pull one arm across your chest, hold 15s. Switch sides.", emoji: "🤸", category: .standing),
    Exercise(title: "Forward Fold", description: "Stand tall, hinge at hips and reach toward the floor. Hold 20s.", emoji: "🙇", category: .standing),
    Exercise(title: "Side Stretch", description: "Raise one arm overhead, lean to the opposite side. Hold 15s each side.", emoji: "↔️", category: .standing),
    Exercise(title: "Hip Flexor Lunge", description: "Step one foot forward into a lunge, keep back knee low. Hold 15s each side.", emoji: "🏃", category: .standing),
    Exercise(title: "Torso Rotation", description: "Feet shoulder-width apart, rotate torso left and right slowly. 10 times.", emoji: "🔃", category: .standing),
    Exercise(title: "Quad Stretch", description: "Stand on one foot, pull the other heel to your glute. Hold 15s each side.", emoji: "🧘", category: .standing),
]
