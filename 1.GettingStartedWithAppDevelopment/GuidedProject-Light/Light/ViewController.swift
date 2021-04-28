//
//  ViewController.swift
//  Light
//
//  Created by Med Mohanna on 22.04.21.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    func updateUI (){
        if lightOn {
            view.backgroundColor = .white
        }
        else {
            view.backgroundColor = .black
        }
    }
}

