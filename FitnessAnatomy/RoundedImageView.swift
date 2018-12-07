//
//  RoundedImageView.swift
//  FitnessAnatomy
//
//  Created by Doğa Bayram on 5.12.2018.
//  Copyright © 2018 Doğa Bayram. All rights reserved.
//

import Foundation
import UIKit


class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = self.frame.width / 5
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
