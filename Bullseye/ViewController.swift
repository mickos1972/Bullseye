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
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        currentValue = Int(slider.value.rounded())
        startNewRound()
    }

    @IBAction func showAlert()
    {
        let message = "The current value of the slider is now : \(currentValue)" +
        "\nThe Target Value is: \(targetValue)"
        
        let alert = UIAlertController(title: "hello world", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider)
    {
        currentValue = Int(slider.value.rounded())
    }
    
    func startNewRound()
    {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
    }
}
