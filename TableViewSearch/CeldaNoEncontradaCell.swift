//
//  CeldaNoEncontradaCell.swift
//  TableViewSearch
//
//  Created by Marco Alonso on 13/05/24.
//

import UIKit

class CeldaNoEncontradaCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UIStackView!
    
    @IBOutlet weak var subtitleLabel: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
