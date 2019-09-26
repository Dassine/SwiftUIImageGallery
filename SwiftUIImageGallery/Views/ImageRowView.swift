//
//  ImageRowView.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//


import SwiftUI

struct ImageRowView: View {
    
    @ObservedObject private var viewModel: ImageRowViewModel
    
    private let imageData: ImageData
    
    var body: some View {
        NavigationLink(destination: ImageDetailView(imageData: self.imageData, image: viewModel.image ?? UIImage())) {
            HStack {
                Image(uiImage: viewModel.image ?? UIImage())
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width: 200, height: 200)
                
                VStack {
                    Text("\(self.imageData.name)")
                        .bold()
                        .padding()
                    Text("\(self.imageData.image)")
                        .italic()
                }
                .font(.headline)
                .foregroundColor(Color.white)
                .frame(minWidth: 100)
                
                Spacer()
                
            }
            .background(Color.black)
            .cornerRadius(5.0)
            .padding(.all)
            .onAppear(perform: viewModel.load)
            .onDisappear(perform: viewModel.cancel)
        }
    }
    
    init(imageData: ImageData) {
        self.viewModel = ImageRowViewModel(name: imageData.image)
        self.imageData = imageData
    }
}
