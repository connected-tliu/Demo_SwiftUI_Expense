//
//  ContentView.swift
//  Demo_SwiftUI_Expense
//
//  Created by Tak Liu on 2022-07-04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var user = User()
    
    @State private var showingSheet = false
    
    
    
    var body: some View {
        VStack {
            Text("Name: \(user.firstName) \(user.lastName)")
                .padding()
            
            TextField("First Name", text: $user.firstName)
                .padding([.top, .leading, .trailing])
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $user.lastName)
                .padding([.leading, .trailing, .bottom])
                .textFieldStyle(.roundedBorder)
            
            Button("Show Sheet") {
                showingSheet.toggle()
            }
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(name: "\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
