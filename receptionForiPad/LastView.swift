//
//  LastView.swift
//  receptionForiPad
//
//  Created by 滝浪翔太 on 2020/09/02.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct LastView: View {
    
    @Binding var isFirstViewActive: Bool
    
    var body: some View {
        VStack {
            Text("担当を呼び出しています。\n少々お待ちください。")
                .font(.system(size: 80))
            Spacer()
            NavigationLink(destination: ContentView()) {
                Button(action: {
                    self.isFirstViewActive = false
                }, label: {
                    Text("TOPに戻る")
                    .foregroundColor(Color.white)
                    .font(.system(size: 60))
                    .frame(width: 500, height: 100)
                    .background(Color.blue)
                    .compositingGroup()
                    .shadow(color: .gray, radius: 3, x: 0, y: 10)
                })
            }
            Spacer()
        .navigationBarBackButtonHidden(true)
        }
        .onAppear() {
            self.timer()
        }
    }
    
    func timer() {
        _ = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
            self.isFirstViewActive = false
        }
    }
}
