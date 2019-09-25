//
//  ImageDetailViewModel.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import SwiftUI
import Combine
import CoreImage

final class ImageDetailViewModel: ObservableObject {
    let imageData: ImageData
    
    init(imageData: ImageData) {
        self.imageData = imageData
    }
    
    func edit() {
        //TODO: Add Filters
    }

}
