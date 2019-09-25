//
//  imagesData.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import Foundation

struct ImageArrayData: Decodable {
    
    private enum CodingKeys: CodingKey {
        case images
    }
    
    var images: [ImageData] = []
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        images = try container.decode([String: ImageData].self, forKey: .images).map { $0.1 }
    }
}
