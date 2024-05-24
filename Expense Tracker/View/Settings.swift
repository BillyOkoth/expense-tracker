//
//  Settings.swift
//  Expense Tracker
//
//  Created by Billy Okoth on 15/05/2024.
//

import SwiftUI

struct Settings: View {
    
    /// user propertirs
    @AppStorage("userName") private var userName:String = ""
    //applock properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    var body: some View {
       
        NavigationStack {
            List {
                Section("User Name") {
                    TextField("isJustine", text: $userName)
                }
                Section("App Lock") {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                    
                    if isAppLockEnabled {
                        Toggle( "Lock When App Goes Background", isOn: $lockWhenAppGoesBackground)
                    }
                }
            }
            
        }.navigationTitle("Settings")
    }
}

#Preview {
    Settings()
}
