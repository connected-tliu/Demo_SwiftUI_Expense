//
//  AddView.swift
//  Demo_SwiftUI_Expense
//
//  Created by Tak Liu on 2022-07-05.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var isError = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) { type in
                        Text(type)
                    }
                }
                .pickerStyle(.inline)
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let actualAmount = Int(amount) {
                            let item = ExpenseItem(name: name, type: type, amount: actualAmount)
                            expenses.items.append(item)
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            isError.toggle()
                        }
                        
                    }
                }
            }
            .alert("Wrong Amount", isPresented: $isError, actions: {
                Button("Reset", action: {})
            })

            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
