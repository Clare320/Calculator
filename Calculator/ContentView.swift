//
//  ContentView.swift
//  Calculator
//
//  Created by lingjie on 2021/1/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: CalculatorModel
    
    @State private var editingHistory = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作履历：\(model.history.count)") {
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory, content: {
                HistoryView(model: self.model)
            })
            Text(model.brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    self.showAlert = true
                })
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text(model.historyDetail), message: Text(model.brain.output), dismissButton: Alert.Button.cancel(Text("OK")))
                })
            CalculatorPad()
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CalculatorModel())
    }
}
