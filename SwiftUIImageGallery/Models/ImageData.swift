//
//  Image.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import Foundation

struct ImageData: Codable, Identifiable {
    let id: Int
    let name: String
    let number: String
    let image: String
    let category: String
    let version: String
    let data: Data?
    let tags: Tags
    
    enum CodingKeys: String, CodingKey {
        case id = "index"
        case name
        case number
        case image
        case category
        case version
        case data
        case tags
    }
    
    struct Tags: Codable {
        let sizeDescription: String
        let sizeScale: String
        let sizeWidth: String
        let sizeWidthArc: String
        let sizeHeight: String
        let sizeHeightArc: String
        let sizeDepth: String
        let sizeDepthArc: String
        let sizeUnits: String
        
        enum CodingKeys: String, CodingKey {
            case sizeDescription = "sizedescription"
            case sizeScale = "sizescale"
            case sizeWidth = "sizewidth"
            case sizeWidthArc = "sizewidtharc"
            case sizeHeight = "sizeheight"
            case sizeHeightArc = "sizeheightarc"
            case sizeDepth = "sizedepth"
            case sizeDepthArc = "sizedeptharc"
            case sizeUnits = "sizeunits"
        }
    }
}
