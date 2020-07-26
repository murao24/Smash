//
//  FrameView.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/07/21.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import SwiftUI
import WaterfallGrid

struct FrameView: View {

    var body: some View {

        NavigationView {
            VStack {
                WaterfallGrid(0..<S.frameFighterArray.count, id: \.self) { index in
                    NavigationLink(destination: FrameDetaleView(fighterName: S.frameFighterArray[index])) {
                        FighterPNG(name: S.frameFighterArray[index])
                            .frame(width: 100, height: 100)
                            .background(Color.orange.opacity(0.8))
                            .cornerRadius(5)
                    }
                }
                .gridStyle(
                    columns: 3,
                    spacing: 20,
                    padding: EdgeInsets(top: 10, leading: 10, bottom: 40, trailing: 10)
                )
                    .scrollOptions(
                        direction: .vertical,
                        showsIndicators: false
                )
            }
            .navigationBarTitle("一覧")
        }
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
