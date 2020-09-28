//
//  ContentView.swift
//  CardApp
//
//  Created by 杉山　栄彦 on 2020/08/20.
//  Copyright © 2020 蓮田よ. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var cards = [
        "かばん": "bag" ,
        "自動車": "car" ,
        "誕生日":"birthday"
    ]
    @State var japanese = "かばん"
    @State var isJapanese = true
    var body: some View {
        ZStack{
            Color(red: 0.97, green: 0.96 ,blue: 0.56)
                .edgesIgnoringSafeArea(.all)
            Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
        VStack {
            ZStack{
                Image("card")
                    .resizable()
                    .frame(width:300.0, height: 133.0)
                    .shadow(radius: 3)
                    .rotation3DEffect(.degrees(isJapanese ? 0 : 180),
                                        axis : (x: 0, y: 1, z: 0))
                    .animation(.spring())
                    .onTapGesture {
                        self.isJapanese.toggle()
                }
                Text(isJapanese ? japanese :cards[japanese]!)
                    .font(.largeTitle)
            }.padding()
            
            HStack {
                Group{
                    
                Button(action: {
                    self.isJapanese.toggle()}) {
                    Image(systemName: "arrow.2.circlepath")
                    Text("裏返す")
                }
                Button(action: {
                    self.isJapanese = true
                    self.japanese = self.cards.randomElement()!.key
                }) {
                    Image(systemName: "forward.fill")
                    Text(/*@START_MENU_TOKEN@*/"次へ"/*@END_MENU_TOKEN@*/)
                }
                }.padding()
                    .foregroundColor(.white)
                    .background(Color(red: 0.86, green: 0.45, blue: 0.33))
                    .cornerRadius(10)
            }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
