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
    
    private let title: String
    private let subtitle: String
    private let placeholder: Image = Image(systemName: "photo")
    
    var body: some View {
        HStack {
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.white, lineWidth: 1.0))
                .frame(width: 200, height: 200)
            
            VStack {
                Text("\(title)")
                    .bold()
                    .foregroundColor(Color.black)
                    .padding()
                Text("\(subtitle)")
                    .italic()
                    .foregroundColor(Color.black)
            }
            .font(.headline)
            .foregroundColor(Color.white)
            .frame(minWidth: 130)
            
            Spacer()
            
            
        }
        .padding(.all)
        .onAppear(perform: viewModel.load)
        .onDisappear(perform: viewModel.cancel)
    }
    
    init(name: String, filename: String) {
        self.viewModel = ImageRowViewModel(name: filename)
        self.title = name
        self.subtitle = filename
    }
}
