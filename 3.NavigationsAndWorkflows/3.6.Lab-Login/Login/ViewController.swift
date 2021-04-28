//
//  ViewController.swift
//  Login
//
//  Created by Med Mohanna on 27.04.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var forgotUsernameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        }
        else{
        segue.destination.navigationItem.title = username.text
        }
    }
    
    @IBAction func forgotUsername(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotUsernameButton)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: forgotPasswordButton)
    }
    
}

