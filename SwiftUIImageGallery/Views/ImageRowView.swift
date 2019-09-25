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
    
    var body: some View {
        HStack {
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .clipShape(Rectangle())
                .frame(width: 200, height: 200)
            
            VStack {
                Text("\(title)")
                    .bold()
                    .padding()
                Text("\(subtitle)")
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
    
    init(name: String, filename: String) {
        self.viewModel = ImageRowViewModel(name: filename)
        self.title = name
        self.subtitle = filename
    }
}
