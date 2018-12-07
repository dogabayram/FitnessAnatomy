//
//  TableViewCell.swift
//  FitnessAnatomy
//
//  Created by Doğa Bayram on 5.12.2018.
//  Copyright © 2018 Doğa Bayram. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var exerciseImage: UIImageView!
    @IBOutlet weak var exerciseName: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        exerciseName.isEditable = false
        exerciseName.isUserInteractionEnabled = false
        exerciseName.isSelectable = false
        self.exerciseName.scrollRangeToVisible(NSMakeRange(0, 0))
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
