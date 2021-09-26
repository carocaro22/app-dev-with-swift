//
//  ProgramTableViewCell.swift
//  BelegStoryboard
//
//  Created by Med Mohanna on 25.05.21.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {

    @IBOutlet weak var programImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var programDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
