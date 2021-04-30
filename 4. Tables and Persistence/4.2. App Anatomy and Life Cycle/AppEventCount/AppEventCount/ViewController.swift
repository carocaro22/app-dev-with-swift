//
//  ViewController.swift
//  AppEventCount
//
//  Created by Med Mohanna on 30.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunching: UILabel!
    @IBOutlet weak var didBecomeActive: UILabel!
    @IBOutlet weak var didDisconnect: UILabel!
    @IBOutlet weak var willResignActive: UILabel!
    @IBOutlet weak var willEnterForeground: UILabel!
    @IBOutlet weak var didEnterBackground: UILabel!
    
    var launchCount = 0
    var becomeActiveCount = 0
    var disconnectCount = 0
    var resignActiveCount = 0
    var enterForegroungCount = 0
    var enterBackgroundCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func updateView () {
        didFinishLaunching.text = "The app has Launched \(launchCount) times."
        didBecomeActive.text = "The app has become active \(becomeActiveCount) times."
        didDisconnect.text = "The app has disconnected \(disconnectCount) times"
        willResignActive.text = "The app has Resigned Active \(resignActiveCount) times"
        willEnterForeground.text = "The app has entered Foreground \(enterForegroungCount) times"
        didEnterBackground.text = "The app has entered the background \(enterBackgroundCount) times"
    }


}

