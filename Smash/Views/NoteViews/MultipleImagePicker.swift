//
//  ImagePicker.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/08/11.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import UIKit
import SwiftUI
import Photos
import AssetsPickerViewController

struct ImagePicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode) private var presentationMode
    @Binding var selectedImages: [UIImage]
    @ObservedObject var noteVM: NoteViewModel

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        

    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, AssetsPickerViewControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func assetsPicker(controller: AssetsPickerViewController, selected assets: [PHAsset]) {
            for asset in assets {
                let image = getAssetThumbnail(asset: asset)
                self.parent.selectedImages.append(image)
            }
        }



    }

}

