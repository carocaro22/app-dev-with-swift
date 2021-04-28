//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Med Mohanna on 23.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toogle: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was Tapped")
        
        if toogle.isOn {
            print("the switch is on")
        }
        else {
            print("the switch is off")
        }
        
        print("the slider is set to \(slider.value)")
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {print("the switch is on")}
        else{print("the switch is off")}
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {print(text)}
    }
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in :view)
        print(location)
    }
    
 //   @IBAction func textChanged(_ sender: UITextField) {
 //       if let text = sender.text {print(text)}
 //   }
    
}

