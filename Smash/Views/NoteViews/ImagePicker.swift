//
//  ImagePicker.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/08/11.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import UIKit
import SwiftUI
import AssetsPickerViewController
import Photos


/*
struct ImagePicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode) private var presentationMode
    @Binding var selectedImages: [UIImage]
    @ObservedObject var noteVM: NoteViewModel

    var sourceType: UIImagePickerController.SourceType = .photoLibrary

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                self.parent.selectedImages.append(image)
                self.parent.noteVM.uploadImages(images: self.parent.selectedImages)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

    }

}
 */

struct MultipleImagePicker: UIViewControllerRepresentable {

    @Environment(\.presentationMode) private var presentationMode
    @Binding var selectedImages: [UIImage]
    @ObservedObject var noteVM: NoteViewModel

    func makeUIViewController(context: Context) -> AssetsPickerViewController {
        let picker = AssetsPickerViewController()
        picker.delegate = context.coordinator

        return picker
    }

    func updateUIViewController(_ uiViewController: AssetsPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, AssetsPickerViewControllerDelegate, UINavigationControllerDelegate {

        var parent: MultipleImagePicker

        init(_ parent: MultipleImagePicker) {
            self.parent = parent
        }

        func assetsPicker(controller: AssetsPickerViewController, selected assets: [PHAsset]) {
            print(assets)
        }

        

    }

}
