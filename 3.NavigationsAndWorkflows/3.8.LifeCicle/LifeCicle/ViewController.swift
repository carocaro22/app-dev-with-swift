//
//  ViewController.swift
//  LifeCicle
//
//  Created by Med Mohanna on 28.04.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - View Did Load")
    }
        
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController - View Will Appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController - View Did Appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController - View Will Desappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController - View Did Desappear")
    }
}

