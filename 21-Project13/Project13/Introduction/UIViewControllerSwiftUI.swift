//
//  UIViewControllerSwiftUI.swift
//  Project13
//
//  Created by clarknt on 2019-12-03.
//  Copyright © 2019 clarknt. All rights reserved.
//

import SwiftUI

struct UIViewControllerSwiftUI: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()

            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct UIViewControllerSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerSwiftUI()
    }
}