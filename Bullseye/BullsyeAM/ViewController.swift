//
//  ViewController.swift
//  BullsyeAM
//
//  Created by AMStudent on 11/4/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
            currentValue = Int(roundedValue)
            startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Hightlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        
        let points = 100 - difference
        score += points
        
        let title: String
        if difference == 0 {
            title = "Among Us!"
        } else if difference < 5 {
            title = "Try Harder!"
        } else if difference < 10 {
            title = "Boo. you Stink."
        } else {
            title = "Zion is disappointed in you."
        }
        let message = "You scored \(points) points."
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
            
            alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
        @IBAction func sliderMoved(slider: UISlider) {
            let roundedValue = slider.value.rounded()
            currentValue = Int(roundedValue)
            
        }
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels() {
        targetLabel.text  = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    @IBAction func StartOver() {
        startNewGame()
    }
}
