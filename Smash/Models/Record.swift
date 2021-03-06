//
//  Record.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/07/21.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Record: Codable, Identifiable {
    @DocumentID var id: String?
    var result: String
    var myFighter: String
    var opponentFighter: String
    var stage: String
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}


#if DEBUG
let testDatas = [
    Record(result: "win", myFighter: "mario", opponentFighter: "minmin", stage: "senjou"),
    Record(result: "lose", myFighter: "wario", opponentFighter: "joker", stage: "syuten"),
    Record(result: "win", myFighter: "dedede", opponentFighter: "wario", stage: "syuten"),
    Record(result: "win", myFighter: "wario", opponentFighter: "purin", stage: "sumamura"),
    Record(result: "win", myFighter: "wario", opponentFighter: "kamui", stage: "pokesuta2"),
    Record(result: "win", myFighter: "yoshi", opponentFighter: "cloud", stage: "senjou"),
    Record(result: "lose", myFighter: "terry", opponentFighter: "pac_man", stage: "syuten"),
    Record(result: "win", myFighter: "king_k_rool", opponentFighter: "daisy", stage: "syuten"),
    Record(result: "lose", myFighter: "ike", opponentFighter: "sonic", stage: "sumamura"),
    Record(result: "win", myFighter: "lucario", opponentFighter: "dr_mario", stage: "pokesuta2"),
    Record(result: "win", myFighter: "ness", opponentFighter: "luigi", stage: "pokesuta2"),
    Record(result: "lose", myFighter: "banjo_and_kazooie", opponentFighter: "banjo_and_kazooie", stage: "syuten"),
    Record(result: "win", myFighter: "king_k_rool", opponentFighter: "daisy", stage: "syuten"),
    Record(result: "lose", myFighter: "ike", opponentFighter: "sonic", stage: "sumamura"),
    Record(result: "win", myFighter: "lucario", opponentFighter: "dr_mario", stage: "pokesuta2"),
    Record(result: "win", myFighter: "ness", opponentFighter: "luigi", stage: "pokesuta2"),
    Record(result: "lose", myFighter: "banjo_and_kazooie", opponentFighter: "banjo_and_kazooie", stage: "syuten"),
    Record(result: "win", myFighter: "mario", opponentFighter: "minmin", stage: "senjou"),
    Record(result: "lose", myFighter: "wario", opponentFighter: "joker", stage: "syuten"),
    Record(result: "win", myFighter: "dedede", opponentFighter: "wario", stage: "syuten"),
    Record(result: "win", myFighter: "wario", opponentFighter: "purin", stage: "sumamura"),
    Record(result: "win", myFighter: "wario", opponentFighter: "kamui", stage: "pokesuta2"),
    Record(result: "win", myFighter: "yoshi", opponentFighter: "cloud", stage: "senjou"),
    Record(result: "lose", myFighter: "terry", opponentFighter: "pac_man", stage: "syuten"),
    Record(result: "win", myFighter: "king_k_rool", opponentFighter: "daisy", stage: "syuten"),
    Record(result: "lose", myFighter: "ike", opponentFighter: "sonic", stage: "sumamura"),
    Record(result: "win", myFighter: "lucario", opponentFighter: "dr_mario", stage: "pokesuta2"),
    Record(result: "win", myFighter: "ness", opponentFighter: "luigi", stage: "pokesuta2"),
    Record(result: "lose", myFighter: "banjo_and_kazooie", opponentFighter: "banjo_and_kazooie", stage: "syuten"),
    Record(result: "win", myFighter: "king_k_rool", opponentFighter: "daisy", stage: "syuten"),
    Record(result: "lose", myFighter: "ike", opponentFighter: "sonic", stage: "sumamura"),
    Record(result: "win", myFighter: "lucario", opponentFighter: "dr_mario", stage: "pokesuta2"),
    Record(result: "win", myFighter: "ness", opponentFighter: "luigi", stage: "pokesuta2"),
    Record(result: "lose", myFighter: "banjo_and_kazooie", opponentFighter: "banjo_and_kazooie", stage: "syuten"),
    Record(result: "win", myFighter: "mario", opponentFighter: "minmin", stage: "senjou"),
    Record(result: "lose", myFighter: "wario", opponentFighter: "joker", stage: "syuten"),
    Record(result: "win", myFighter: "dedede", opponentFighter: "wario", stage: "syuten"),
    Record(result: "win", myFighter: "wario", opponentFighter: "purin", stage: "sumamura"),
    Record(result: "win", myFighter: "wario", opponentFighter: "kamui", stage: "pokesuta2"),
    Record(result: "win", myFighter: "yoshi", opponentFighter: "cloud", stage: "senjou"),
    Record(result: "lose", myFighter: "terry", opponentFighter: "pac_man", stage: "syuten"),
    Record(result: "win", myFighter: "king_k_rool", opponentFighter: "daisy", stage: "syuten"),
    Record(result: "lose", myFighter: "ike", opponentFighter: "sonic", stage: "sumamura"),
    Record(result: "win", myFighter: "lucario", opponentFighter: "dr_mario", stage: "pokesuta2"),
    Record(result: "win", myFighter: "ness", opponentFighter: "luigi", stage: "pokesuta2"),
    Record(result: "lose", myFighter: "banjo_and_kazooie", opponentFighter: "banjo_and_kazooie", stage: "syuten"),
    Record(result: "win", myFighter: "king_k_rool", opponentFighter: "daisy", stage: "syuten"),
    Record(result: "lose", myFighter: "ike", opponentFighter: "sonic", stage: "sumamura"),
    Record(result: "win", myFighter: "lucario", opponentFighter: "dr_mario", stage: "pokesuta2"),
    Record(result: "win", myFighter: "ness", opponentFighter: "luigi", stage: "pokesuta2"),
    Record(result: "lose", myFighter: "banjo_and_kazooie", opponentFighter: "banjo_and_kazooie", stage: "syuten")
]
#endif


