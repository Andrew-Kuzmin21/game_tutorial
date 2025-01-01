//
//  ViewController.swift
//  game_tutorial
//
//  Created by Андрей on 01.01.2025.
//

import UIKit

class ViewController: UIViewController {
    var previousCardValue = 0
    var currentCardValue = 0
    var score = 0

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeCard()
        getRecord()
    }
    
    func randomizeCard() {
        previousCardValue = currentCardValue
        currentCardValue = Int.random(in: 1 ... 13)
        cardImageView.image = UIImage(named: String(currentCardValue))
    }
    
    func increaseScore() {
        score = score + 1
        scoreLabel.text = "Score: " + String(score)
    }
    
    func saveRecord() {
        let defaults = UserDefaults.standard
        let record = defaults.integer(forKey: "record")
        
        if score > record {
            defaults.set(score, forKey: "record")
            recordLabel.text = "Record: " + String(score)
        }
    }
    
    func getRecord() {
        let defaults = UserDefaults.standard
        let record = defaults.integer(forKey: "record")
        recordLabel.text = "Record: " + String(record)
    }
    
    func gameOver() {
        scoreLabel.text = "Game Over!"
        score = 0
    }

    @IBAction func highButtonPressed(_ sender: Any) {
        randomizeCard()
        if currentCardValue >= previousCardValue {
            increaseScore()
            saveRecord()
        } else {
            gameOver()
        }
    }
    
    @IBAction func lowButtonPressed(_ sender: Any) {
        randomizeCard()
        if currentCardValue <= previousCardValue {
            increaseScore()
            saveRecord()
        } else {
            gameOver()
        }
    }
    
}

