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
            // せめてenumとかで持つべき
            if answerNumber != 0 {
                Button(action: {
                    answerNumber = 0
                }) {
                    Text("戻る")
                        
                }
            }
            Spacer()
            if answerNumber==0 {     // init
                Text("順番に手が出るよ").padding(.bottom)
                
            } else if answerNumber == 1 {// gu
                Image("gu")
                // リサイズ
                    .resizable()
                // 画面内に収まるようにアスペクト比（縦横比）を維持する設定
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("グー").padding(.bottom)
                
            } else if answerNumber == 2 {// choki
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("ちょき！").padding(.bottom)
                
            } else {// pa
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("パー").padding(.bottom)
            }
            
            Button(action: {
                var newAnswerNumber = 0
                // repeatとwhile 条件どっちも繰り返しはある。
                // repeatは最低一回、whileは条件に合わなければ1回もないって感じ
                // 後に判定するのか前で判定するのかって感じっぽい。
                repeat {
                    newAnswerNumber = Int.random(in: 1...3)
                    // このwhileで同じときずっとやから前回の結果と同じならrepeatか
                    
                } while answerNumber == newAnswerNumber
                answerNumber = newAnswerNumber
            }) {
                Text("じゃんけんをする")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
