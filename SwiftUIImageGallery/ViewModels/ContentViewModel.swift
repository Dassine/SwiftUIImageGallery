//
//  ContentViewModel.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import Foundation
import Combine


class ContentViewModel: ObservableObject {
    
    @Published private(set) var images: [ImageData] = []
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init() {
        self.url = URL(string: APIConfig.url + APIConfig.allImagesPath + APIConfig.key)!
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        cancellable = URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap { data, _ in
                let imagesArrayData = try JSONDecoder().decode(ImageArrayData.self, from: data)
                return imagesArrayData.images
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { completion in print(completion) },
            receiveValue: { [weak self] images in
                self?.images = images
            }
        )
        
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
}
