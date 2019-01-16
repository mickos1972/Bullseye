//
//  ViewController.swift
//  Bullseye
//
//  Created by Mick M on 30/12/2018.
//  Copyright © 2018 Mick M. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var startOver: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        currentValue = Int(slider.value.rounded())
        targetLabel.text = String(Int.random(in: 1...100))

        startNewGame()
    }

    @IBAction func showAlert()
    {
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
        
        var title: String = ""
        if difference == 0
        {
            title = "Perfect!!"
            points += 100
        } else if difference < 5
        {
            title = "Almost ..."
        } else if difference < 10
        {
            title = "No chance!"
        }
        else if difference == 1
        {
            points += 50
        }
        
        let message = "You Hit:\(String(currentValue))\n\n You Scored: \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        score += points
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        //startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        currentValue = Int(slider.value.rounded())
    }
    
    func startNewRound()
    {
        round += 1

        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame()
    {
        score = 0
        round = 0
        startNewRound()
    }
}
