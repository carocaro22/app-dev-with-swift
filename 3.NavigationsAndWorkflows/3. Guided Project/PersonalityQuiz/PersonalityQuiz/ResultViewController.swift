//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Med Mohanna on 29.04.21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult (){
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        
        for response in responseTypes {
            let newCount: Int
            
            if let oldCount = frequencyOfAnswers[response] {
                newCount = oldCount + 1
            } else {
                newCount = 1
            }
            frequencyOfAnswers[response] = newCount
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) -> Bool in return pair1.value > pair2.value})
        
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
