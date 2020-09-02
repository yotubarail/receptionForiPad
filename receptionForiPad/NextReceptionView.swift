//
//  NextReceptionView.swift
//  receptionForiPad
//
//  Created by 滝浪翔太 on 2020/09/02.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

struct NextReceptionView: View {
    
    @State private var isActive = false
    @State private var isAll = false
    @State private var isInterview = false
    @State private var isDelivery = false
    @Binding var isFirstViewActive: Bool
    @Binding var isSecondViewActive: Bool
    @Binding var isThirdViewActive: Bool
    @Binding var isFourceViewActive: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink(destination: MemberView(isFirstViewActive: $isFirstViewActive), isActive: $isActive) {
                    Button(action: {
                        self.isActive = true
                    }, label: {
                        Text("担当者名で探す")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                        .frame(width: screenWidth / 3.8, height: screenWidth / 3.8)
                        .background(Color.blue)
                        .compositingGroup()
                        .shadow(color: .gray, radius: 3, x: 0, y: 10)
                    })
                }
                .isDetailLink(false)
                
                Spacer()
                
                NavigationLink(destination: LastView(isFirstViewActive: $isSecondViewActive), isActive: $isAll) {
                    Button(action: {
                        self.isAll = true
                        self.slackAll()
                    }, label: {
                        Text("総合受付")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                        .frame(width: screenWidth / 3.8, height: screenWidth / 3.8)
                        .background(Color.blue)
                        .compositingGroup()
                        .shadow(color: .gray, radius: 3, x: 0, y: 10)
                    })
                }
                .isDetailLink(false)
                
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                NavigationLink(destination: LastView(isFirstViewActive: $isThirdViewActive), isActive: $isInterview) {
                    Button(action: {
                        self.isInterview = true
                        self.slackInterview()
                    }, label: {
                        Text("面接の方は\nこちら")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                        .frame(width: screenWidth / 3.8, height: screenWidth / 3.8)
                        .background(Color.blue)
                        .compositingGroup()
                        .shadow(color: .gray, radius: 3, x: 0, y: 10)
                    })
                }
                .isDetailLink(false)
                
                Spacer()
                
                NavigationLink(destination: LastView(isFirstViewActive: $isFourceViewActive), isActive: $isDelivery) {
                    Button(action: {
                        self.isDelivery = true
                        self.slackDelivery()
                    }, label: {
                        Text("宅配業者の方は\nこちら")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                            .frame(width: screenWidth / 3.8, height: screenWidth / 3.8)
                        .background(Color.blue)
                        .compositingGroup()
                        .shadow(color: .gray, radius: 3, x: 0, y: 10)
                    })
                }
                .isDetailLink(false)
                
                Spacer()
            }
            Spacer()
        }
    }
    
    // 総合受付の時の動作
    func slackAll() {
        guard let url = URL(string: "https://hooks.slack.com/services/") else { return }

        let body: [String: String] = ["username":"受付","text":"<!here>IT事業部にご用の方が来られました。\n対応をお願いします",  "icon_emoji": ":office:"]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard data != nil else { return }
        }.resume()
    }
    
    
    // 面接の人が来たときの動作
    func slackInterview() {
        guard let url = URL(string: "https://hooks.slack.com/services/") else { return }

        let body: [String: String] = ["username":"受付_面接","text":"<!channel>面接予定の方が来られました\n対応をお願いします",  "icon_emoji": ":bust_in_silhouette:"]

        let finalBody = try! JSONSerialization.data(withJSONObject: body)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard data != nil else { return }
        }.resume()
    }
    
    // 宅配便が来たときの動作
    func slackDelivery() {
        guard let url = URL(string: "https://hooks.slack.com/services/"
            ) else { return }

        let body: [String: String] = ["username":"宅配便","text":"<!here>宅配が届きました\n受け取りに行ってください",  "icon_emoji": ":package:"]

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
