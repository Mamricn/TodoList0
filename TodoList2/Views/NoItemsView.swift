//
//  NoItemsView.swift
//  TodoList2
//
//  Created by Marcin Turek on 22/04/2025.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let SecondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items!!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a prodactive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add something 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? SecondaryAccentColor: Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50 )
                .shadow(color: animate ? SecondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7)
                        , radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
       
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle(Text("No items"))
    }
}

//2
