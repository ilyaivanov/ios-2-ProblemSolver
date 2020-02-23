import Foundation

struct ProblemSolverModel {
    var questions = [
        /* 0 */ Question(title: "Нет проблем", yesHint: "", noHint: "", yes: 0, no: 0),
        /* 1 */ Question(title: "Есть проблема?", yesHint: "Вот незадача...", noHint: "Ну и не парься", yes: 2, no: 0),
        /* 2 */ Question(title: "Ты тут замешан?", yesHint: "Ты идиот!", noHint: "Это хорошо, но...", yes: 3, no: 5),
        /* 3 */ Question(title: "Об этом кто-нибудь знает?", yesHint: "Трижды идиот!", noHint: "Концы в воду", yes: 4, no: 0),
        /* 4 */ Question(title: "Можешь на кого-нибудь это свалить?", yesHint: "Вот и славно", noHint: "Плохо, давай еще раз попробуем", yes: 0, no: 4),
        /* 5 */ Question(title: "На тебя это повесили?", yesHint: "Черт, это усложнит задачу", noHint: "Сиди тихо", yes: 4, no: 0),
    ]

    var currentQuestion = 1
    var finalQuestionId = 0

    func getCurrentQuestion() -> String {
        return questions[currentQuestion].title
    }

    mutating func asnwer(answer: Answer) -> String {
        if answer == Answer.yes {
            let result = questions[currentQuestion].yesHint
            currentQuestion = questions[currentQuestion].yes
            return result
        } else {
            let result = questions[currentQuestion].noHint
            currentQuestion = questions[currentQuestion].no
            return result
        }
    }

    func haveSolvedTheProblem() -> Bool {
        return currentQuestion == finalQuestionId
    }

    mutating func reset() {
        currentQuestion = 1
    }
}

struct Question {
    let title: String
    let yesHint: String
    let noHint: String
    let yes: Int
    let no: Int
}

enum Answer {
    case yes
    case no
}
