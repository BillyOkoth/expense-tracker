//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Billy Okoth on 15/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isFirstTime") private var isFirstTime:Bool = false
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = true
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    @State private var activeTab:Tab = .recents
    
    var body: some View {
//        LockView(lockType:.biometric, lockPin:"", isEnabled: isAppLockEnabled) {
//            TabView(selection: $activeTab){
//                Recents().tabItem { Tab.recents.tabContent }.tag(Tab.recents)
//                Search().tabItem { Tab.search.tabContent }.tag(Tab.recents)
//                Graphs().tabItem { Tab.charts.tabContent }.tag(Tab.recents)
//                Settings().tabItem { Tab.settings.tabContent }.tag(Tab.recents)
//            }
//            .tint(appTint)
//            .sheet(isPresented: $isFirstTime, content: {
//                IntroScreen().interactiveDismissDisabled()
//            })
//        }
        TabView(selection: $activeTab){
            Recents().tabItem { Tab.recents.tabContent }.tag(Tab.recents)
            Search().tabItem { Tab.search.tabContent }.tag(Tab.recents)
            Graphs().tabItem { Tab.charts.tabContent }.tag(Tab.recents)
            Settings().tabItem { Tab.settings.tabContent }.tag(Tab.recents)
        }
        .tint(appTint)
        .sheet(isPresented: $isFirstTime, content: {
            IntroScreen().interactiveDismissDisabled()
        })
        
    }
}

#Preview {
    ContentView()
}
