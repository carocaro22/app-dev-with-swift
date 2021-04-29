import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: String {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
            case .dog:
                return "You're a dog!"
            case .cat:
                return "You're a cat!"
            case .rabbit:
                return "You're a rabbit!"
            case .turtle:
                return "You're a turtle"
        }
    }
}
