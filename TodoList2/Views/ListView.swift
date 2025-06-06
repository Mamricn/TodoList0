//
//  ListView.swift
//  TodoList2
//
//  Created by Marcin Turek on 18/04/2025.
//

import SwiftUI

struct ListView: View {
    
   
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listViewModel.items){item in
                        ListRowView(item: item)
                        
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationTitle("Todo List 📝")
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}
#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
}
