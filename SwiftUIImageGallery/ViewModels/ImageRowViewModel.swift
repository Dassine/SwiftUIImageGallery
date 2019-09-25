//
//  ImageRowViewModel.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import UIKit
import Combine

enum ImageLoadingError: Error {
    case incorrectData
}

class ImageRowViewModel: ObservableObject {
    
    @Published private(set) var image: UIImage?
    
    private let name: String
    private let url: URL
    private var cancellable: AnyCancellable?
    
    private let cache: NSCache<NSString, UIImage> = NSCache()
    
    init(name: String) {
        self.url = URL(string: APIConfig.url + APIConfig.imagePath)!.appendingPathComponent(name)
        self.name = name
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        if let image = cache.object(forKey: name as NSString) {
            self.image = image
        } else {
            cancellable = URLSession
                .shared
                .dataTaskPublisher(for: url)
                .tryMap { [weak self] data, _ in
                    guard let image = UIImage(data: data) else {
                        throw ImageLoadingError.incorrectData
                    }
                    
                    if let self = self {
                        self.cache.setObject(image, forKey: self.name as NSString)
                    }

                    return image
                }
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: { [weak self] image in
                        self?.image = image
                    }
                )
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
