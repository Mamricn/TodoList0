//
//  TodoList2App.swift
//  TodoList2
//
//  Created by Marcin Turek on 18/04/2025.
//

import SwiftUI

@main
struct TodoList2App: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}
