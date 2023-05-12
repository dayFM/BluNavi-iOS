//
//  Tag.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import Foundation

struct Tag {
    var id: String
    var ssid: String
    var loc: String  // Toilet, ToiletPaper, Lock
    var battery: Float
    var positionX: Float
    var positionY: Float
    var positionZ: Float
}

struct TagForDemo {
    static let TAGS_ID_FOR_DEMO = [
        "99a8c3e5fd7b5ecbe61e91969cfc5605",
        "827239f64378a06c4aacf9a7b286ed30",
        "4fdff8d27d4e2c70d274b781710a1000",
    ]
}
