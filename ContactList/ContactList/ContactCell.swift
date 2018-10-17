//
//  ContactCell.swift
//  ContactList
//
//  Created by Alexandr Yanski on 11.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var contactPhotoList: UIImageView!
    @IBOutlet weak var contactLabelList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.contactPhotoList.layer.cornerRadius = self.contactPhotoList.bounds.size.width / 2.0
        self.contactPhotoList.clipsToBounds = true
    }
    
}
