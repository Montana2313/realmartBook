//
//  Artist.swift
//  Artbook
//
//  Created by Özgür  Elmaslı on 8.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import Foundation
import RealmSwift

class Artist : Object
{
   @objc dynamic var ArtistX : String?
   @objc dynamic var ArtistName : String?
    @objc dynamic var ArtistDateTime : String?
   @objc dynamic var Artistimage : NSData?
}
