//
//  ImageDetailView.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import SwiftUI

struct ImageDetailView: View {
    
    @ObservedObject var viewModel: ImageDetailViewModel
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage())
                .resizable()
        }
        .navigationBarTitle(Text("\(viewModel.imageData.name)"),  displayMode: .inline)
        
    }
}
