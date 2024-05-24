//
//  LockView.swift
//  Expense Tracker
//
//  Created by Billy Okoth on 23/05/2024.
//  link for the lockview  https://www.youtube.com/watch?v=H7LH5xYUn6s

import SwiftUI

struct LockView<Content:View>: View {
    //lock properties
    var lockType:LockType
    var lockPin:String
    var isEnabled:Bool
    var lockWhenAppGoesBackground: Bool = true
    
    //view properties
    @State private var pin:String = ""
    @ViewBuilder var content:Content
    var body: some View {
        
        GeometryReader{
            let size = $0.size
            content.frame(width: size.width ,height: size.height)
            
            if isEnabled {
                ZStack {
                    if lockType == .both || lockType == .biometric{
                        Rectangle()
                    } else {
                        //custom number pad
                        
                        NumberPadPinView()
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
    
    @ViewBuilder
    func NumberPadPinView () -> some View {
        VStack(spacing:15) {
            Text("Enter Pin")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
            
            HStack (spacing: 10) {
                ForEach( 0..<4, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10).frame(width: 50 ,height: 55)
                }
            }
            .frame(maxHeight: .infinity)
            
            //custom number pad
            
            GeometryReader {_ in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3) , content: {
                    ForEach(1...9 , id: \.self) { number in
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("\(number)")
                                .font(.title)
                                .frame(maxWidth:.infinity)
                                .padding(.vertical ,20)
                                .contentShape(.rect)
                        })
                    }
                })
                .frame(maxHeight:.infinity , alignment: .bottom)
                
            }
        }
        .padding()
        .environment(\.colorScheme , .dark)
    }
    enum LockType:String {
        case biometric = "Bio Metric Auth"
        case number = "Custom Number Lock"
        case both =  "First preference will be biometric, and if  it's not available , it will go for number lock."
    }
}

#Preview {
    ContentView()
}
