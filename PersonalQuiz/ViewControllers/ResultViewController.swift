//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var responses: [Answer]!
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        updateUI()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func updateUI() {
        let mostFrequentAnimal = findMostFrequentAnimal()
        resultAnswerLabel.text = "Вы - \(mostFrequentAnimal.rawValue)"
        resultTextLabel.text = mostFrequentAnimal.definition
    }
    
    private func findMostFrequentAnimal() -> Animal {
        var animalCounts = [Animal: Int]()
        
        for response in responses {
            let animal = response.animal
            if animalCounts[animal] == nil {
                animalCounts[animal] = 1
            } else {
                animalCounts[animal]! += 1
            }
        }
        
        return animalCounts.max(by: { $0.1 < $1.1 })!.key
    }
}
    
