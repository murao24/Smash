//
//  RankingView.swift
//  Smash
//
//  Created by 村尾慶伸 on 2020/07/31.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import SwiftUI

struct RankingView: View {

    @ObservedObject var rankingVM = RankingViewModel()
    @State var rankingName: String = ""
    @State var kind: Kind

    var jaName = { (name: String) -> String in
        switch name {
        case "mario":
            return "マリオ"
        case "donkey_kong":
            return "ドンキーコング"
        case "link":
            return "リンク"
        case "samus":
            return "サムス"
        case "dark_samus":
            return "ダークサムス"
        case "yoshi":
            return "ヨッシー"
        case "kirby":
            return "カービー"
        case "fox":
            return "フォックス"
        case "pikachu":
            return "ピカチュウ"
        case "luigi":
            return "ルイージ"
        case "ness":
            return "ネス"
        case "captain_falcon":
            return "キャプテン・\nファルコン"
        case "jigglypuff":
            return "プリン"
        case "peach":
            return "ピーチ"
        case "daisy":
            return "デイジー"
        case "bowser":
            return "クッパ"
        case "ice_climber":
            return "アイスクライマー"
        case "sheik":
            return "シーク"
        case "zelda":
            return "ゼルダ"
        case "dr_mario":
            return "ドクターマリオ"
        case "pichu":
            return "ピチュー"
        case "falco":
            return "ファルコ"
        case "marth":
            return "マルス"
        case "lucina":
            return "ルキナ"
        case "young_link":
            return "こどもリンク"
        case "ganondorf":
            return "ガノンドロフ"
        case "mewtwo":
            return "ミュウツー"
        case "roy":
            return "ロイ"
        case "chrom":
            return "クロム"
        case "mr_game_and_watch":
            return "Mr.ゲーム&\nウォッチ"
        case "meta_knight":
            return "メタナイト"
        case "pit":
            return "ピット"
        case "dark_pit":
            return "ブラックピット"
        case "zero_suit_samus":
            return "ゼロスーツサムス"
        case "wario":
            return "ワリオ"
        case "snake":
            return "スネーク"
        case "ike":
            return "アイク"
        case "pt_squirtle":
            return "ゼニガメ"
        case "pt_ivysaur":
            return "フシギソウ"
        case "pt_charizard":
            return "リザードン"
        case "diddy_kong":
            return "ディディーコング"
        case "lucas":
            return "リュカ"
        case "sonic":
            return "ソニック"
        case "king_dedede":
            return "デデデ"
        case "olimar":
            return "ピクミン&オリマー"
        case "lucario":
            return "ルカリオ"
        case "rob":
            return "ロボット"
        case "toon_link":
            return "トゥーンリンク"
        case "wolf":
            return "ウルフ"
        case "villager":
            return "むらびと"
        case "mega_man":
            return "ロックマン"
        case "wii_fit_trainer":
            return "Wii Fit トレーナー"
        case "rosalina_and_luma":
            return "ロゼッタ&チコ"
        case "little_mac":
            return "リトル・マック"
        case "greninja":
            return "ゲッコウガ"
        case "palutena":
            return "パルテナ"
        case "pac_man":
            return "パックマン"
        case "robin":
            return "ルフレ"
        case "shulk":
            return "シュルク"
        case "bowser_jr":
            return "クッパJr."
        case "duck_hunt":
            return "ダックハント"
        case "ryu":
            return "リュウ"
        case "ken":
            return "ケン"
        case "cloud":
            return "クラウド"
        case "corrin":
            return "カムイ"
        case "bayonetta":
            return "ベヨネッタ"
        case "inkling":
            return "インクリング"
        case "ridley":
            return "リドリー"
        case "simon":
            return "シモン"
        case "richter":
            return "リヒター"
        case "king_k_rool":
            return "キングクルール"
        case "isabelle":
            return "しずえ"
        case "incineroar":
            return "ガオガエン"
        case "piranha_plant":
            return "パックンフラワー"
        case "joker":
            return "ジョーカー"
        case "hero":
            return "勇者"
        case "banjo_and_kazooie":
            return "バンジョー&カズーイ"
        case "terry":
            return "テリー"
        case "byleth":
            return "べレト/べレス"
        case "minmin":
            return "ミェンミェン"
        case "mii_brawler":
            return "格闘Mii"
        case "mii_gunner":
            return "射撃Mii"
        case "mii_swordfighter":
            return "剣術Mii"
        default:
            return ""
        }
    }

    var body: some View {
        List {
            ForEach(rankingVM.rankingData) { data in
                HStack(spacing: 20) {
                    FighterPNG(name: data.fighterName)
                        .frame(width: 80, height: 80)
                    Text(self.jaName(data.fighterName))
                        .font(.headline)
                    Spacer()
                    Text(data.value)
                        .font(.headline)
                }
                .padding(.trailing, 20)
            }
            //tabbarで隠れる
            Text("")
            Text("")
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle(kind.jaName)
        .onAppear {
            self.rankingVM.loadRankingData(rankingName: self.kind.fileName)
        }
    }
}