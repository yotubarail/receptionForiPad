//
//  ContentView.swift
//  receptionForiPad
//
//  Created by 滝浪翔太 on 2020/09/02.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.size.width

struct ContentView: View {
    
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.opacity(0.2).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("IT事業部用受付")
                        .font(.system(size: screenWidth / 10))
                        Spacer()
                    Text("IT事業部にご用の方は矢印をタッチしてください")
                        .font(.system(size: screenWidth / 34))
                        .padding(.bottom, 70)
                        Spacer()
                    NavigationLink(destination: NextReceptionView(isFirstViewActive: $isActive, isSecondViewActive: $isActive, isThirdViewActive: $isActive, isFourceViewActive: $isActive), isActive: $isActive) {
                        Button(action: {
                            self.isActive = true
                        }, label: {
                            Text("→")
                        })
                        .frame(width: screenWidth / 5, height: screenWidth / 8)
                        .font(.system(size: screenWidth / 8))
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .compositingGroup()
                        .shadow(color: .gray, radius: 3, x: 0, y: 10)
                    }
                    Spacer()
                }
            }
        }
        .environment(\.horizontalSizeClass, .compact)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
