//
//  ContentView.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State var hideTabBar = false
    @StateObject private var bikeViewModel = BikeViewModel()
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $bikeViewModel.selectedTab) {
                DashboardView(onViewChanged: { status in
                    hideTabBar = status
                })
                    .tag(Tab.dashboard)
                Color._242C3B
                    .ignoresSafeArea()
                    .tag(Tab.map)
                CartView()
                    .ignoresSafeArea()
                    .tag(Tab.cart)
                Color._242C3B
                    .ignoresSafeArea()
                    .tag(Tab.persion)
                Color._242C3B
                    .ignoresSafeArea()
                    .tag(Tab.history)
            }
            .overlay(alignment: .bottom) {
                if !hideTabBar {
                    RoundedRectangle(cornerRadius: 0)
                        .frame(height: 103)
                        .foregroundStyle(LinearGradient(colors: [Color._363E51, Color._181C24], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .mask {
                            ProductShape(cornerRadius: 0, topDisplacement: 20, bottomDisplacement: 0)
                        }
                        .overlay {
                            HStack {
                                ForEach(Tab.allCases, id: \.self) { item in
                                    Image(item.rawValue)
                                        .renderingMode(.template)
                                        .foregroundStyle(.white.opacity(bikeViewModel.selectedTab == item ? 1 : 0.6))
                                        .frame(width: 60, height: 80)
                                        .background{
                                            if bikeViewModel.selectedTab == item {
                                                LinearGradient(colors: [Color._34C8E8, Color._4E4AF2], startPoint: .topLeading, endPoint: .bottomTrailing)
                                            } else {
                                                Color.clear
                                            }
                                        }
                                        .mask {
                                            ProductShape(cornerRadius: 10, topDisplacement: 11, bottomDisplacement: 11)
                                        }
                                        .onTapGesture {
                                            bikeViewModel.selectedTab = item
                                        }
                                }
                            }
                        }
                }
            }
        }
        .ignoresSafeArea()
        .environmentObject(bikeViewModel)
        
    }
}

#Preview {
    ContentView()
}
