//
//  ContentView.swift
//  MyFamilyBook
//
//  Created by emi oiso on 2023/10/17.
//

import SwiftUI

class Ponta: ObservableObject{
    @Published var name = ""
    @Published var age = ""
    @Published var wight = ""
}

struct ContentView: View {
    //キーボード等の外部入力から値の初期値
    @ObservedObject var ponta = Ponta()
    @State var isShowInfoView = false
    
    var body: some View {
        VStack {
            Text("ぽんちゃんの情報を入力してください。")
                .font(.headline)
            //キーボード等の外部入力から値を受け取り、TextFieldの枠内に表示させる。
            TextField("名前",text:$ponta.name)
                //キーボード等の外部入力から英字を入力する際、小文字で入力できるようにしている。
                .autocapitalization(.none)
                //TextFieldの枠のコーナーを丸くなるようにしている。
                .textFieldStyle(.roundedBorder)
            
            //キーボード等の外部入力から値を受け取り、TextFieldの枠内に表示させる。
            TextField("年齢",text:$ponta.age)
                //TextFieldの枠のコーナーを丸くなるようにしている。
                .textFieldStyle(.roundedBorder)
                //数字のみが入力できるキーパッドを出力している
                .keyboardType(.numberPad)
            
            //キーボード等の外部入力から値を受け取り、TextFieldの枠内に表示させる。
            TextField("体重",text:$ponta.wight)
                //キーボード等の外部入力から英字を入力する際、小文字で入力できるようにしている。
                .autocapitalization(.none)
                //TextFieldの枠のコーナーを丸くなるようにしている。
                .textFieldStyle(.roundedBorder)
                //数字のみが入力できるキーパッドを出力している
                .keyboardType(.numberPad)
            
            Button("決定"){
                isShowInfoView = true
            }
            .sheet(isPresented: $isShowInfoView){
                InfoView(ponta: ponta)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}


struct InfoView: View {
    @ObservedObject var ponta: Ponta
//    @Binding var name :String
//    @Binding var age  :String
//    @Binding var wight :String
    
    var body: some View{
        VStack{
            Text("【 ぽんちゃん情報 】")
                .padding()
            Text("名前:\(ponta.name)")
            Text("年齢:\(ponta.age)")
            Text("体重:\(ponta.wight)")
            Button("決定"){
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}
#Preview {
    ContentView()
}
