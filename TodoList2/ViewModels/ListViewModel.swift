//
//  ListViewModel.swift
//  TodoList2
//
//  Created by Marcin Turek on 19/04/2025.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [itemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    
    init(){
        getItem()
    }
    
    func getItem(){
//        let newItem = [
//            itemModel(text: "First item", isCompleted: true),
//            itemModel(text: "Second item", isCompleted: false),
//            itemModel(text: "Third item", isCompleted: false),
//        ]
//        
//        items.append(contentsOf: newItem)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([itemModel].self , from: data)
        else {return}
        self.items = savedItems
    }

    func deleteItem(indexSet: IndexSet){
            items.remove(atOffsets: indexSet)
        }
        func moveItem(from: IndexSet, to: Int ){
            items.move(fromOffsets: from, toOffset: to)
        }
    
    func addItem(text: String){
        let newItem = itemModel(text: text, isCompleted: false)
        items.append(newItem)
    }
    
    
    func updateItem(item: itemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
}
/*
 firstly
 we have to encode items and use UserDefaults to set the encodeddata and key the best option is to set the key in begining of the code to not lose it
 secondly
 we have to load the encoded data saveItems() to all of the items for exmaple addItem removeItem
 we do that by adding to didSet{ saveItems()} to the array
 */


/*//
 // MARK: - 🔐 Notatka: Jak działa zapisywanie i wczytywanie danych z UserDefaults w SwiftUI (krok po kroku)
 //
 // 1️⃣ Stwórz unikalny klucz – pod nim będą zapisane dane w pamięci urządzenia
 let itemsKey: String = "items_list"

 //
 // 2️⃣ Lista zadań ma @Published i didSet – co oznacza: za każdym razem, gdy coś w niej zmienimy (dodamy, usuniemy, edytujemy),
 //     automatycznie wykona się funkcja saveItems() i zapisze dane do UserDefaults
 @Published var items: [ItemModel] = [] {
     didSet {
         saveItems()
     }
 }

 //
 // 3️⃣ W init() uruchamiamy getItems() – czyli przy uruchomieniu aplikacji próbujemy odczytać dane zapisane wcześniej
 init() {
     getItems()
 }

 //
 // 📥 Funkcja: getItems() – czyli odczyt danych z UserDefaults
 func getItems() {
     // Próbujemy pobrać dane typu Data spod klucza "items_list"
     guard
         let data = UserDefaults.standard.data(forKey: itemsKey),
         let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
     else {
         // Jeśli nie uda się nic pobrać – kończymy
         return
     }

     // Jeśli się udało – przypisujemy zapisane dane do naszej listy zadań
     self.items = savedItems
 }

 //
 // 📤 Funkcja: saveItems() – czyli zapis danych do UserDefaults
 func saveItems() {
     // Próbujemy zakodować tablicę zadań do formatu JSON (Data)
     if let encodedData = try? JSONEncoder().encode(items) {
         // Jeśli się udało – zapisujemy dane do pamięci (UserDefaults) pod naszym kluczem
         UserDefaults.standard.set(encodedData, forKey: itemsKey)
     }
 }

 //
 // 🧠 Podsumowanie działania:
 // - Przy starcie aplikacji getItems() odczytuje dane z UserDefaults i ładuje je do listy
 // - Każda zmiana w liście zadań automatycznie uruchamia saveItems(), które zapisuje listę z powrotem do pamięci
 // - Dzięki temu dane są zapamiętane nawet po zamknięciu aplikacji 🚀
*/
