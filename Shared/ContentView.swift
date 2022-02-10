//
//  ContentView.swift
//  Shared
//
//  Created by 後藤遥 on 2022/02/08.
//

import SwiftUI

struct ContentView: View {
    @State var answerNumber = 0
    // someはここで返すbodyの戻り値の型を抽象化してくれる
    // これないとImageとかTextとかいろんな戻り値を返すのに型対応させるのめんどくさいから
    // some Viewで抽象化すれば返せるって感じかな？
    // この場合のviewはプロトコルこういうのが定義されててこういうの返せよって感じ。
    // viewのbodyプロパティ（変数名body）には一つのレイアウトでしか表示できないよってのもプロトコルによるものだよってところ。
    // ちなみにswiftは単一の式で返す関数ならreturnいらんらしい
    var body: some View {
        // resizableとかaspectRatioはモディファイアModifierっていうやつら
        VStack {
            if answerNumber==0 {     // init
                Text("順番に手が出るよ")
                
            } else if answerNumber == 1 {// gu
                Image("gu")
                // リサイズ
                    .resizable()
                // 画面内に収まるようにアスペクト比（縦横比）を維持する設定
                    .aspectRatio(contentMode: .fit)
                Text("グー")
                
            } else if answerNumber == 2 {// choki
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("ちょき！")
                
            } else {// pa
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("パー")
            }

            Button(action: {
                answerNumber += 1
                if answerNumber > 3 {
                    answerNumber = 0
                }
            }) {
                Text("じゃんけんをする")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
