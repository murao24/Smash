//
//  NoteRepository.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/07/27.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

class NoteRepository: ObservableObject {

    let db = Firestore.firestore()
    let storage = Storage.storage()
    let userId = Auth.auth().currentUser?.uid

    @Published var notes: [Note] = []

    init() {
        loadDate()
    }

    func loadDate() {

        db.collection("notes")
            .order(by: "createdTime", descending: true)
            .whereField("userId", isEqualTo: userId as Any)
            .addSnapshotListener { (querySnapshot, error) in
                DispatchQueue.main.async {
                    if let querySnapshot = querySnapshot {
                        self.notes = querySnapshot.documents.compactMap { document in
                            do {
                                let x = try document.data(as: Note.self)
                                return x
                            } catch {
                                print(error.localizedDescription)
                            }
                            return nil
                        }
                    }
                }
        }

    }

    func addNote(note: Note) {
        do {
            var addedNote = note
            addedNote.userId = Auth.auth().currentUser?.uid
            let _ = try db.collection("notes").addDocument(from: addedNote)
        } catch {
            fatalError("Unable to encode note: \(error)")
        }
    }

    func deleteNote(noteID: String) {
        db.collection("notes").document(noteID).delete() { error in
            if let error = error {
                print("Error removing note: \(error)")
            } else {
                print("Note successfully removed!")
            }
        }
    }

    func updateNote(note: Note) {
        if let noteID = note.id {
            do {
                try db.collection("notes").document(noteID).setData(from: note)
            } catch {
                fatalError("Unable to encode note: \(error)")
            }
        }
    }

    // images methods

    func uploadImage(image: UIImage) -> String {
        guard let userId = userId else { return "" }
        let data = image.jpegData(compressionQuality: 0.5)! as Data
        let imageName = NSUUID().uuidString
        let outputData = imageName + ".jpg"

        let imageRef = storage.reference(forURL: "gs://smash-80661.appspot.com").child("\(userId)").child("\(imageName).jpg")
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"

        let uploadTask = imageRef.putData(data, metadata: meta) { (metadata, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
        }
        self.observeUploadTaskFailureCases(uploadTask: uploadTask)

        return "\(outputData)"
    }

    func observeUploadTaskFailureCases(uploadTask : StorageUploadTask) {
        uploadTask.observe(.failure) { snapshot in
            if let error = snapshot.error as NSError? {
                switch (StorageErrorCode(rawValue: error.code)!) {
                case .objectNotFound:
                    NSLog("File doesn't exist")
                    break
                case .unauthorized:
                    NSLog("User doesn't have permission to access file")
                    break
                case .cancelled:
                    NSLog("User canceled the upload")
                    break

                case .unknown:
                    NSLog("Unknown error occurred, inspect the server response")
                    break
                default:
                    NSLog("A separate error occurred, This is a good place to retry the upload.")
                    break
                }
            }
        }
    }


    /*
    func saveImages(imagesArray: [UIImage]) {
        guard let userId = userId else { return }
        uploadImages(userId: userId, imagesArray: imagesArray) { (uploadedImageUrlsArray) in
            print("uploadedImageUrlsArray: \(uploadedImageUrlsArray)")
        }

    }

    func uploadImages(userId: String, imagesArray: [UIImage], completionHandler: @escaping ([String]) -> ()) {

        var uploadedImageUrlsArray = [String]()
        var uploadCount = 0
        let imagesCount = imagesArray.count

        for image in imagesArray {
            let imageName = NSUUID().uuidString // Unique string to reference

            let storageRef = storage.child("\(userId)").child("").child("\(imageName).png")

            guard let uploadData = image.pngData() else { return }

            let uploadTask = storageRef.putData(uploadData, metadata: nil) { (metaData, error) in
                if error != nil {
                    print(error as Any)
                    return
                }

                storageRef.downloadURL { (url, error) in
                    if let url = url {
                        let urlString = url.absoluteString
                        self.imageURL.append(url)
                        uploadedImageUrlsArray.append(urlString)
                    }

                    uploadCount += 1
                    if uploadCount == imagesCount {
                        NSLog("All Images are uploaded successfully, uploadedImageUrlsArray: \(uploadedImageUrlsArray)")
                        completionHandler(uploadedImageUrlsArray)
                    }
                }
            }

            observeUploadTaskFailureCases(uploadTask: uploadTask)
        }

    }

    func observeUploadTaskFailureCases(uploadTask : StorageUploadTask) {
        uploadTask.observe(.failure) { snapshot in
            if let error = snapshot.error as NSError? {
                switch (StorageErrorCode(rawValue: error.code)!) {
                case .objectNotFound:
                    NSLog("File doesn't exist")
                    break
                case .unauthorized:
                    NSLog("User doesn't have permission to access file")
                    break
                case .cancelled:
                    NSLog("User canceled the upload")
                    break

                case .unknown:
                    NSLog("Unknown error occurred, inspect the server response")
                    break
                default:
                    NSLog("A separate error occurred, This is a good place to retry the upload.")
                    break
                }
            }
        }
    }
 */


}


// fetch image data from firebase storage
extension UIImage {
    static func contentOfFIRStorage(path: String?, callback: @escaping (UIImage?) -> Void) {
        guard let path = path else { return }

        let storage = Storage.storage()
        let host = "gs://smash-80661.appspot.com"
        let userId = Auth.auth().currentUser?.uid

        storage.reference(forURL: host).child(userId!).child(path)
            .getData(maxSize: 1 * 1024 * 1024) { (data, error) in
                if error != nil {
                    callback(nil)
                    return
                }
                if let data = data {
                    let image = UIImage(data: data)
                    callback(image)
                }
        }
    }
}
