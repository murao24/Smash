//
//  AnalysisRepository.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/08/01.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseAuth

class AnalysisRepository: ObservableObject {

    let db = Firestore.firestore()
    @Published var records = [Record]()

    init() {
        loadData()
    }

    func loadData() {

        let userId = Auth.auth().currentUser?.uid

        db.collection("records")
            .whereField("userId", isEqualTo: userId as Any)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    DispatchQueue.main.async {
                        self.records = querySnapshot.documents.compactMap { document in
                            do {
                                let x = try document.data(as: Record.self)
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
}
