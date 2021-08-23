//
//  HoloTableViewCell.swift
//  MVVM
//
//  Created by 井民全 on 2021/8/23.
//

import UIKit

class HoloTableViewCell: UITableViewCell {

    @IBOutlet var holoLabel: UILabel!
    
    static let cellIdentifier = "HoloTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HoloTableViewCell", bundle: nil)
    }
    
    public func configure(with viewModel: CellViewModel){
        holoLabel.text = "\(viewModel.lastname) \(viewModel.firstname)"
    }
    
}
