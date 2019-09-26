//
//  ImageDetailView.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import SwiftUI

struct ImageDetailView: View {
    
    @Environment(\.editMode) var mode
    @ObservedObject var viewModel: ImageDetailViewModel
    
    var body: some View {
        VStack {
            if self.mode!.wrappedValue != .active {
                ImageDetail(viewModel: self.viewModel)
            } else {
                ImageEditor(viewModel: self.viewModel)
            }
        }
        .navigationBarTitle(Text("\(viewModel.imageData.name)"),  displayMode: .inline)
        .navigationBarItems(trailing: EditButton())
        .accentColor(Color("Light Green"))
    }
    
    
    init(imageData: ImageData, image: UIImage) {
        self.viewModel = ImageDetailViewModel(imageData: imageData, image: image)
    }
}

struct ImageDetail: View {
    
    @ObservedObject var viewModel: ImageDetailViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Image(uiImage: self.viewModel.image)
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width: 500, height: 500)
            }
            .padding()
        }
        .background(Color.black)
    }
}

struct ImageEditor: View {
    
    @ObservedObject var viewModel: ImageDetailViewModel
    
    var body: some View {
        HStack {
            VStack {
                Image(uiImage: self.viewModel.image)
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width: 500, height: 500)
                HStack {

                    Button(action: {
                        self.viewModel.applyFilter(with: "CISepiaTone")
                    }) {
                        Text("Sepia Tone")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.yellow)
                    .cornerRadius(5)
                    .border(Color.yellow, width: 2)
                    
                    Button(action: {
                        self.viewModel.applyFilter(with: "CIPhotoEffectChrome")
                    }) {
                        Text("Chrome Effect")
                        .fontWeight(.semibold)
                        .font(.title)
                    }
                    .padding()
                    .foregroundColor(.purple)
                    .cornerRadius(5)
                    .border(Color.purple, width: 2)
                }
            }
            .padding()
        }
        .background(Color.black)
    }
}

