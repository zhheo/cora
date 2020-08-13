//
//  ContentView.swift
//  challenge2-mora
//
//  Created by 张洪Heo on 2020/8/12.
//  Copyright © 2020 张洪Hoo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let mora = ["✌🏻","✊🏻","🤚🏻"]
    @State private var robot = 4
    @State private var result = 0
    @State private var resulttxt = ["还未开始","你获胜了","你输了","打平了"]
    @State private var score = 0
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("猜拳")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Text(self.resulttxt[self.result])
                
                Text("当前分数为 \(self.score)")
                
                ZStack {
                    Circle()
                        .frame(width: geo.size.width / 2, height: geo.size.width / 2)
                        .foregroundColor(.blue)
                    
                    Text(self.robot == 4 ? "?" : self.mora[self.robot])
                        //如果机器值为4显示问号
                        .foregroundColor(.white)
                        .font(.system(size: 60, weight: .bold, design: .default))
                    
                }
                
                HStack {
                    ForEach(0 ..< self.mora.count) { item in
                        choiceBtn(geo: geo, item: self.mora[item])
                            .onTapGesture {
                                self.play(user: item)
                        }
                    }
                }
            
            }
        }
        
    }
    
    //开始运行
    func play(user: Int) {
        let robot = Int.random(in: 0 ... 2)
        self.robot = robot
        
        //判断猜拳胜负
        if robot == user {
            self.result = 3
        }else if (robot - user == 1 || robot - user == -2) {
            self.result = 2
            self.score += -1
        }else {
            self.result = 1
            self.score += 1
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct choiceBtn: View {
    let geo: GeometryProxy
    let item: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: geo.size.width / 4, height: geo.size.width / 4)
            Text(item)
                .font(.system(size: 30))
        }
    }
}
