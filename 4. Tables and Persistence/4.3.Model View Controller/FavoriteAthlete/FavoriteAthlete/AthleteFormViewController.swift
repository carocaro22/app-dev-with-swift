//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Med Mohanna on 30.04.21.
//

import Foundation
import UIKit


class AthleteFormViewController: UIViewController {
    
    @IBOutlet weak var athleteName: UITextField!
    @IBOutlet weak var athleteAge: UITextField!
    @IBOutlet weak var athleteLeague: UITextField!
    @IBOutlet weak var athleteTeam: UITextField!
    
    var athlete: Athlete?
    func updateView () {
        if let athlete = athlete {
            athleteName.text = "\(athlete.name)"
            athleteAge.text = "\(athlete.age)"
            athleteLeague.text = "\(athlete.league)"
            athleteTeam.text = "\(athlete.team)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        guard let name = athleteName.text,
              let age = athleteAge.text,
              let league = athleteLeague.text,
              let team = athleteTeam.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "AthleteTable" , sender: self)
            
    }
}
