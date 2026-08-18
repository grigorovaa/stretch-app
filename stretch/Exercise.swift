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

// All 20 exercises for each category
let seatedExercises: [Exercise] = [
    Exercise(title: "Neck Roll", description: "Slowly roll your neck in a full circle, switch direction.", emoji: "🔄", category: .seated),
    Exercise(title: "Shoulder Shrugs", description: "Raise both shoulders to your ears, hold 3 seconds, release.", emoji: "🤷", category: .seated),
    Exercise(title: "Wrist Stretch", description: "Extend one arm, pull fingers back gently. Hold 15 seconds each side.", emoji: "🖐️", category: .seated),
    Exercise(title: "Seated Spinal Twist", description: "Sit tall, twist gently to the right, hold 15s. Then left.", emoji: "🌀", category: .seated),
    Exercise(title: "Eye Rest", description: "Look at something 20 feet away for 20 seconds. Blink slowly.", emoji: "👁️", category: .seated),
    Exercise(title: "Chest Opener", description: "Interlace fingers behind your head, gently squeeze shoulder blades. Hold 10s. Repeat.", emoji: "💪", category: .seated),
    Exercise(title: "Ankle Circles", description: "Lift both feet slightly, rotate ankles 5 times each direction.", emoji: "🦶", category: .seated),
    Exercise(title: "Seated Cat-Cow", description: "Arch your back and look up, then round your spine and tuck chin.", emoji: "🐱", category: .seated),
    Exercise(title: "Neck Side Stretch", description: "Tilt your head toward one shoulder, hold 15s. Switch sides.", emoji: "↕️", category: .seated),
    Exercise(title: "Seated Marching", description: "Lift knees alternately as if marching in place.", emoji: "🚶", category: .seated),
    Exercise(title: "Finger Stretch", description: "Spread fingers wide, hold 5 seconds, then make a fist. Repeat.", emoji: "✋", category: .seated),
    Exercise(title: "Seated Forward Fold", description: "Sit tall, hinge forward from your hips, let arms hang toward the floor. Repeat.", emoji: "🙇", category: .seated),
    Exercise(title: "Wrist Circles", description: "Rotate both wrists in circles 5 times, then switch direction.", emoji: "🔃", category: .seated),
    Exercise(title: "Seated Figure-4 Stretch", description: "Cross one ankle over the opposite knee, lean forward slightly. Hold 15s each side.", emoji: "🧘", category: .seated),
    Exercise(title: "Overhead Reach", description: "Interlace fingers, reach arms overhead, palms to the ceiling. Hold 10s, repeat.", emoji: "🙌", category: .seated),
    Exercise(title: "Seated Side Bend", description: "Raise one arm overhead and lean gently to the opposite side. Hold 15s each side.", emoji: "↔️", category: .seated),
    Exercise(title: "Jaw Release", description: "Drop your jaw open gently, move it side to side slowly. 30 seconds.", emoji: "😮", category: .seated),
    Exercise(title: "Seated Knee-to-Chest", description: "Pull one knee toward your chest, hold 15s. Switch sides.", emoji: "🦵", category: .seated),
    Exercise(title: "Deep Breathing", description: "Inhale deeply for 4 counts, hold for 4, exhale for 6. Repeat.", emoji: "🫁", category: .seated),
    Exercise(title: "Seated Toe Taps", description: "Tap toes on the floor alternately, keeping heels grounded. 20 total taps.", emoji: "👣", category: .seated),
]

let standingExercises: [Exercise] = [
    Exercise(title: "Calf Raises", description: "Rise onto your toes, hold 2 seconds, lower. Repeat.", emoji: "🦵", category: .standing),
    Exercise(title: "Shoulder Stretch", description: "Pull one arm across your chest, hold 15s. Switch sides.", emoji: "🤸", category: .standing),
    Exercise(title: "Forward Fold", description: "Stand tall, hinge at hips and reach toward the floor. Hold.", emoji: "🙇", category: .standing),
    Exercise(title: "Side Stretch", description: "Raise one arm overhead, lean to the opposite side. Hold 15s each side.", emoji: "↔️", category: .standing),
    Exercise(title: "Hip Flexor Lunge", description: "Step one foot forward into a lunge, keep back knee low. Hold 15s each side.", emoji: "🏃", category: .standing),
    Exercise(title: "Torso Rotation", description: "Feet shoulder-width apart, rotate torso left and right slowly.", emoji: "🔃", category: .standing),
    Exercise(title: "Quad Stretch", description: "Stand on one foot, pull the other heel to your glute. Hold 15s each side.", emoji: "🧘", category: .standing),
    Exercise(title: "Bodyweight Squats", description: "Feet shoulder-width apart, lower hips as if sitting back. Repeat.", emoji: "🏋️", category: .standing),
    Exercise(title: "Standing Cat-Cow", description: "Hands on thighs, arch and round your spine slowly. Repeat 5 times.", emoji: "🐱", category: .standing),
    Exercise(title: "Wall Chest Stretch", description: "Place arm on wall, gently rotate body away. Hold 15s each side.", emoji: "🚪", category: .standing),
    Exercise(title: "Heel-to-Toe Walk", description: "Walk in a straight line placing heel directly in front of toe.", emoji: "🚶", category: .standing),
    Exercise(title: "Standing Hamstring Stretch", description: "Place one heel on a low surface, hinge forward gently. Hold 15s each side.", emoji: "🦿", category: .standing),
    Exercise(title: "Standing Twist", description: "Feet planted, twist your upper body side to side gently.", emoji: "🌀", category: .standing),
    Exercise(title: "Arm Circles", description: "Extend arms out to the sides, make small circles. 10 forward, 10 backward.", emoji: "⭕", category: .standing),
    Exercise(title: "Standing Side Leg Raise", description: "Hold onto a chair, lift one leg out to the side. 15s each leg.", emoji: "🦵", category: .standing),
    Exercise(title: "Overhead Reach", description: "Reach both arms overhead, stretch tall through your fingertips. Hold 15s. Repeat.", emoji: "🙌", category: .standing),
    Exercise(title: "Standing Figure-4 Stretch", description: "Cross one ankle over the opposite knee, sit back slightly. Hold 15s each side.", emoji: "🧘", category: .standing),
    Exercise(title: "Marching in Place", description: "Lift knees high alternately while standing.", emoji: "🚶‍♂️", category: .standing),
    Exercise(title: "Standing Backbend", description: "Hands on lower back, gently arch backward and look up slightly. Hold 10s. Repeat.", emoji: "🤸‍♀️", category: .standing),
    Exercise(title: "Ankle Rolls", description: "Lift one foot, rotate ankle 5 times each direction. Switch feet.", emoji: "🦶", category: .standing),
]
