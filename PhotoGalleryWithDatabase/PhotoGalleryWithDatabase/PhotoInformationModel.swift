//
//  PhotoInformationModel.swift
//  PhotoGalleryWithDatabase
//
//  Created by Alexandr Yanski on 13.11.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoInformationModel: Object {
    @objc dynamic var picture: Data? = nil
    @objc dynamic var name = ""
    @objc dynamic var likes = 0
    @objc dynamic var photoDescription = ""
    @objc dynamic var tags = ""
    
}
