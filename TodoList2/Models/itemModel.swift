//
//  itemModel.swift
//  TodoList2
//
//  Created by Marcin Turek on 18/04/2025.
//

import Foundation


struct itemModel: Identifiable, Codable {
    var id: String
    let text: String
    let isCompleted: Bool
    
    
    
    init(id: String = UUID().uuidString, text: String, isCompleted: Bool = false){
        self.id = id
        self.text = text
        self.isCompleted = isCompleted
        
    }
    func updateCompletion()-> itemModel{
        return itemModel(id:id, text: text, isCompleted: !isCompleted)
    }
}
