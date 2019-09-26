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
    @Published private(set) var image: UIImage
    let imageData: ImageData
    
    private var context: CIContext!
    private var filter: CIFilter!
    private var beginImage: CIImage!
    
    init(imageData: ImageData, image: UIImage) {
        self.imageData = imageData
        self.image = image
    }
    
    func applyFilter(with filterName: String) {
        beginImage = CIImage(image: self.image)
        filter = CIFilter(name: filterName)!
        
        switch filterName {
        case "CIPhotoEffectChrome":
            filter?.setValue(beginImage, forKey: "inputImage")
        case "CISepiaTone":
            filter.setValue(beginImage, forKey: kCIInputImageKey)
            filter.setValue(1, forKey: kCIInputIntensityKey)
        default: break
        }
        
        context = CIContext(options: nil)
        let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        self.image = UIImage(cgImage: cgImage!)
    }
    
}
