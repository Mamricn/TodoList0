//
//  AddView.swift
//  TodoList2
//
//  Created by Marcin Turek on 18/04/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack(spacing:20){
            TextField("Add an item...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            Button {
                saveButtonPressed()
            } label: {
                Text("save".uppercased())
                    .font(.headline)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                
            }
            
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add and Item 🖊️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(){
        if textIsAppropriate( ){
            listViewModel.addItem(text: textFieldText)
            presentationMode.wrappedValue.dismiss()
            
            
        }
        
    }
    
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Text must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
       return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationStack {
        NavigationStack{
            AddView()
        }
        
    }
    .environmentObject(ListViewModel())
   
}
//do smth
