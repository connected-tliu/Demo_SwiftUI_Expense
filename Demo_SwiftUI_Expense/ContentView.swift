//
//  ContentView.swift
//  Demo_SwiftUI_Expense
//
//  Created by Tak Liu on 2022-07-04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var user = User()
    
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
