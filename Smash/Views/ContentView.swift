//
//  ContentView.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/07/20.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var index = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            if self.index == 0 {
                RecordView()
            } else if self.index == 1 {
                AnalysisView()
            } else if self.index == 2 {
                NoteView()
            } else {
                FrameView()
            }
            CustomTabs(index: $index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
            ContentView()
                .environment(\.colorScheme, .dark)
        }

    }
}

struct CustomTabs: View {

    @Environment (\.colorScheme) var colorScheme:ColorScheme
    @Binding var index: Int

    var body: some View {

        HStack(alignment: .top) {
            // 記録
            VStack(spacing: 10) {
                EdgeBorder(width: 6, edge: .top)
                    .frame(width: 40, height: 3)
                    .cornerRadius(1)
                    .foregroundColor(index == 0 ? Color.gray : Color.reverseBackgroundColor(for: colorScheme))
                Button(action: {
                    self.index = 0
                }) {
                    Image("battle")
                        .renderingMode(.template)
                }
                .foregroundColor(index == 0 ? Color.gray : Color.backgroundColor(for: colorScheme))
            }
            .padding(.top, -13)
            Spacer(minLength: 0)

            // 分析
            VStack(spacing: 10) {
                EdgeBorder(width: 6, edge: .top)
                    .frame(width: 40, height: 3)
                    .cornerRadius(1)
                    .foregroundColor(index == 1 ? Color.gray : Color.reverseBackgroundColor(for: colorScheme))
                Button(action: {
                    self.index = 1
                }) {
                    Image("analysis")
                        .renderingMode(.template)
                }
                .foregroundColor(index == 1 ? Color.gray : Color.backgroundColor(for: colorScheme))
            }
            .padding(.top, -13)
            Spacer(minLength: 0)

            // メモ
            VStack(spacing: 10) {
                EdgeBorder(width: 6, edge: .top)
                    .frame(width: 40, height: 3)
                    .cornerRadius(1)
                    .foregroundColor(index == 2 ? Color.gray : Color.reverseBackgroundColor(for: colorScheme))
                Button(action: {
                    self.index = 2
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 23))
                }
                .foregroundColor(index == 2 ? Color.gray : Color.backgroundColor(for: colorScheme))
            }
            .padding(.top, -13)
            Spacer(minLength: 0)

            // フレーム
            VStack(spacing: 12) {
                EdgeBorder(width: 6, edge: .top)
                    .frame(width: 40, height: 3)
                    .cornerRadius(1)
                    .foregroundColor(index == 3 ? Color.gray : Color.reverseBackgroundColor(for: colorScheme))
                Button(action: {
                    self.index = 3
                }) {
                    Image(systemName: "text.justify")
                        .font(.system(size: 23))
                }
                .foregroundColor(index == 3 ? Color.gray : Color.backgroundColor(for: colorScheme))
            }
            .padding(.top, -13)
        }
        .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 35))
        .cornerRadius(5)
        .frame(width: UIScreen.main.bounds.width * 0.95)
        .border(Color(UIColor.tertiarySystemGroupedBackground), width: 2)
        .background(Color.reverseBackgroundColor(for: colorScheme))
        .shadow(color: Color(UIColor.systemGray3), radius: 8, x: 0, y: 12)
    }

}

extension Color {
    static let black = Color.black
    static let white = Color.white

    static func backgroundColor(for colorScheme: ColorScheme) -> Color {
        if colorScheme == .dark {
            return white
        } else {
            return black
        }
    }

    static func reverseBackgroundColor(for colorScheme: ColorScheme) -> Color {
        if colorScheme == .dark {
            return black
        } else {
            return white
        }
    }
}
