//
//  SecondViewController.swift
//  LifeCicle
//
//  Created by Med Mohanna on 29.04.21.
//

import UIKit

class SecondViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            print("SecondViewController - View Did Load")
        }
            
        override func viewWillAppear (_ animated: Bool) {
            super.viewWillAppear(animated)
            print("SecondViewController - View Will Appear")
        }
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("SecondViewController - View Did Appear")
        }
    
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("SecondViewController - View Will Desappear")
        }
    
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("SecondViewController - View Did Desappear")
        }
    
}
