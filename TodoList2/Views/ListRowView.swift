//
//  ListRowView.swift
//  TodoList2
//
//  Created by Marcin Turek on 18/04/2025.
//

import SwiftUI

struct ListRowView: View {
    let item: itemModel
    
    var body: some View {
        
        HStack{
            Image(systemName:item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green: .black)
            Text(item.text)
        }
    }
}

#Preview {
    NavigationStack{
        var item1 = itemModel(text: "Test item 1", isCompleted: false)
         var item2 = itemModel(text: "Test item 2", isCompleted: true)
        
        Group {
                ListRowView(item: item1)
                ListRowView(item: item2)
        }
    }
    
        
    
    
}
