//
//  ViewController.swift
//  100 Days Of Swift - Project 2
//
//  Created by Arda Büyükhatipoğlu on 30.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 2
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 2

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = "Score: \(score) | Flag: " + countries[correctAnswer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Your score is: \(score)"
        } else {
            title = "Wrong"
            score -= 1
            message = "Thats the flag of \(countries[sender.tag].capitalized)\n Your score is: \(score)"
        }
        
        questionNumber += 1
        
        //if user has answered the 10th question, its time to show the scores
        if questionNumber == 11 {
            title = "Game Over"
            let ac = UIAlertController(title: title, message: "Your final score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start Again", style: .default, handler: { UIAlertAction in
                self.score = 0
                self.questionNumber = 0
                self.askQuestion()
            } ))
            present(ac, animated: true)
            return
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion ))
        present(ac, animated: true)
    }
    
}

