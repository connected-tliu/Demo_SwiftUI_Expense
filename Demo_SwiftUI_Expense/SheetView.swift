//
//  SheetView.swift
//  Demo_SwiftUI_Expense
//
//  Created by Tak Liu on 2022-07-04.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var name: String

    var body: some View {
        VStack {
            Text("Hello, \(name)")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(name: "")
    }
}
