//
//  ContentView.swift
//  Demo_SwiftUI_Expense
//
//  Created by Tak Liu on 2022-07-04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var expenses = Expenses()
    
    @State private var isShowingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()

                        let fontColor = fontColor(by: item.amount)
                        Text("$\(item.amount)")
                            .foregroundColor(fontColor)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .sheet(isPresented: $isShowingAddView, content: {
                AddView(expenses: expenses)
            })
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }            
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func fontColor(by amount: Int) -> SwiftUI.Color {
        switch amount {
        case ...10:
            return .green
        case 11...100:
            return .blue
        default:
            return .red
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
