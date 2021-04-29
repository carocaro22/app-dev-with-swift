//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Med Mohanna on 29.04.21.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let existingText = myLabel.text{
            myLabel.text = ("\(existingText) \n Event number \(eventNumber) was viewDidLoad")
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let existingText = myLabel.text{
            myLabel.text = ("\(existingText) \n Event number \(eventNumber) was viewWillAppear")
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let existingText = myLabel.text{
            myLabel.text = ("\(existingText) \n Event number \(eventNumber) was viewDidAppear")
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let existingText = myLabel.text{
            myLabel.text = ("\(existingText) \n Event number \(eventNumber) was viewWillDisappear")
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let existingText = myLabel.text{
            myLabel.text = ("\(existingText) \n Event number \(eventNumber) was viewDidDesappear")
            eventNumber += 1
        }
    }
}
