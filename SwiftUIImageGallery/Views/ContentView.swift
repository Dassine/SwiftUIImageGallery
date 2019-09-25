//
//  ContentView.swift
//  SwiftUIImageGallery
//
//  Created by Lilia Dassine BELAID on 9/25/19.
//  Copyright © 2019 Lilia Dassine BELAID. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.images) { image in
                NavigationLink(destination: ImageDetailView(viewModel: .init(imageData: image))) {
                    ImageRowView(name: image.name, filename: image.image)
                }
            }
            .navigationBarTitle("Image Gallery")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: viewModel.load)
        .onDisappear(perform: viewModel.cancel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([
            "iPad mini 4",
            "iPad mini (5th generation)",
            "iPad (5th generation)",
            "iPad (6th generation)",
            "iPad Air 2",
            "iPad Air (3rd generation)",
            "iPad Pro (9.7-inch)",
            "iPad Pro (10.5-inch)",
            "iPad Pro (11-inch)",
            "iPad Pro (12.9-inch)",
            "iPad Pro (12.9-inch) (2nd generation)",
            "iPad Pro (12.9-inch) (3rd generation)"
        ],id: \.self){ deviceName in
            NavigationView {
                ContentView(viewModel: ContentViewModel())
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
