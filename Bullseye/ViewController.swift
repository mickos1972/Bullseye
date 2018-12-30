//
//  ViewController.swift
//  Bullseye
//
//  Created by Mick M on 30/12/2018.
//  Copyright © 2018 Mick M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert()
    {
        let alert = UIAlertController(title: "hello work", message: "first app", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

