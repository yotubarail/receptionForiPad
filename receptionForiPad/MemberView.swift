//
//  MemberView.swift
//  receptionForiPad
//
//  Created by 滝浪翔太 on 2020/09/02.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct MemberView: View {
    
    @State private var isActive = false
    @Binding var isFirstViewActive: Bool
    
    var body: some View {
        HStack {
            NavigationLink(destination: LastView(isFirstViewActive: $isFirstViewActive), isActive: $isActive) {
                Button(action: {
                    self.isActive = true
                    self.slackTakinami()
                }, label: {
                    Text("滝浪　翔太")
                    .font(.system(size: 40))
                    .foregroundColor(Color.white)
                    .frame(width: screenWidth / 3.8, height: screenWidth / 3.8)
                    .background(Color.blue)
                    .compositingGroup()
                    .shadow(color: .gray, radius: 3, x: 0, y: 10)
                })
            }
            .isDetailLink(false)
        }
    }
    
    func slackTakinami() {
        guard let url = URL(string:
             "https://hooks.slack.com/services/"
            ) else { return }

        let body: [String: String] = ["username":"受付アプリ","text":"<@US4US505D>お客様です\n受付に向かってください"]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard data != nil else { return }
        }.resume()
    }
}
