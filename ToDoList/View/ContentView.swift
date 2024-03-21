//
//  ContentView.swift
//  ToDoList
//
//  Created by Maya Ghamloush on 19/03/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false
    @State private var showingSettingsView: Bool = false

 
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
 
    
    @Environment(\.managedObjectContext) private var viewContext
    
   
    
    
    var body: some View {
        NavigationView {
            ZStack {
                List  {
                    ForEach(self.todos, id: \.self){ todo in
                        HStack{
                            Text(todo.name ?? "Unknown" )
                            Spacer()
                            Text(todo.priority ?? "Unknown" )
                        }
                    }//:FOREACH
                    .onDelete(perform:deleteTodo)
                }//:LIST
                .navigationBarTitle("Todo", displayMode: .inline)
                .navigationBarItems(
                    leading:
                        EditButton(),
                    
                    
                    trailing:
                 Button(action: {
                    self.showingSettingsView.toggle()
                }, label: {
                 Image(systemName: "paintbrush")
                        .imageScale(.large)
                           })//:ADD BUTTON
                    .sheet(isPresented:$showingSettingsView, content: {
                        SettingsView().environment(\.managedObjectContext,self.viewContext)
                    })
            )
                //MARK: - NOTOITEMS
                if todos.count == 0 {
                  EmptyListView()
                }
                
                
            }//Zstack
            .overlay(
                ZStack{
                    Group{
                        Circle()
                            .fill(Color.blue)
                            .opacity(animatingButton ? 0.2 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 68, height: 58, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Circle()
                            .fill(Color.blue)
                            .opacity(animatingButton ? 0.15 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    
                Button(action: {
                    self.showingAddTodoView.toggle()
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .background(Circle().fill(Color.colorBAse))
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })//:BUTTON
                .onAppear(perform: {
                    animatingButton.toggle()
                })
                }//Zstack
                    .padding(.bottom,15)
                    .padding(.trailing,15)
                ,alignment: .bottomTrailing
            )//overlay
        }//NAVIGATION
    }
    
    //MARK: - functions
    func deleteTodo(at offsets: IndexSet){
        for index in offsets{
            let todo = todos[index]
            viewContext.delete(todo)
            do{
                try viewContext.save()
            }catch{
                print(error)
            }
        }
    }
}

 
//#Preview {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
