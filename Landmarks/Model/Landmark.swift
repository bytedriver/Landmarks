//
//  Landmark.swift
//  Landmarks
//
//  88                                                     88              88
//  88                          ,d                         88              ""
//  88                          88                         88
//  88,dPPYba,   8b       d8  MM88MMM  ,adPPYba,   ,adPPYb,88  8b,dPPYba,  88  8b       d8   ,adPPYba,  8b,dPPYba,
//  88P'    "8a  `8b     d8'    88    a8P_____88  a8"    `Y88  88P'   "Y8  88  `8b     d8'  a8P_____88  88P'   "Y8
//  88       d8   `8b   d8'     88    8PP"""""""  8b       88  88          88   `8b   d8'   8PP"""""""  88
//  88b,   ,a8"    `8b,d8'      88,   "8b,   ,aa  "8a,   ,d88  88          88    `8b,d8'    "8b,   ,aa  88
//  8Y"Ybbd8"'       Y88'       "Y888  `"Ybbd8"'   `"8bbdP"Y8  88          88      "8"       `"Ybbd8"'  88
//                   d8'
//                  d8'                 THE WORLD'S FIRST BYTE DNA ARCHITECT
//
//  Created by @bytedriver on 4/5/23.
//  Copyright © 2023 bytedriver. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
