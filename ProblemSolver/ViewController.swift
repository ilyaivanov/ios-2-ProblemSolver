import UIKit

class ViewController: UIViewController {
    var problemSolver = ProblemSolverModel()

    @IBOutlet var questionTitle: UILabel!
    @IBOutlet var messageTitle: UILabel!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTitle.text = ""
        updateTitle()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func onNo(_ sender: Any) {
        handleAnswer(answer: Answer.no)
    }

    @IBAction func onYes(_ sender: Any) {
        if problemSolver.haveSolvedTheProblem() {
            problemSolver.reset()
            updateTitle()
            messageTitle.text = ""
            noButton.isHidden = false
            yesButton.setTitle("Да", for: .normal)
            yesButton.backgroundColor = UIColor.systemGreen
        } else {
            handleAnswer(answer: Answer.yes)
        }
    }

    func handleAnswer(answer: Answer) {
        questionTitle.text = ""
        messageTitle.text = problemSolver.asnwer(answer: answer)
        messageTitle.font = messageTitle.font.withSize(45)

        if problemSolver.haveSolvedTheProblem() {
            noButton.isHidden = true
            yesButton.setTitle("Заново", for: .normal)
            yesButton.backgroundColor = UIColor.systemYellow
            showTitleForNextQuestion()
        } else {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                self.showTitleForNextQuestion()
            }
        }
    }

    func showTitleForNextQuestion() {
        messageTitle.font = messageTitle.font.withSize(35)
        updateTitle()
    }

    func updateTitle() {
        questionTitle.text = problemSolver.getCurrentQuestion()
    }
}
