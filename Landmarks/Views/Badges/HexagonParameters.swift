//
//  HexagonParameters.swift
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
//  Created by @bytedriver on 4/6/23.
//  Copyright © 2023 bytedriver. All rights reserved.
//

import CoreGraphics

struct HexagonParameters {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let adjustment: CGFloat = 0.085
    
    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
