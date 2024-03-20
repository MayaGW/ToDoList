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
                    self.showingAddTodoView.toggle()
                }, label: {
                 Image(systemName: "plus")
                           })//:ADD BUTTON
                    .sheet(isPresented: $showingAddTodoView, content: {
                        AddToDoView().environment(\.managedObjectContext,self.viewContext)
                    })
            )
                //MARK: - NOTOITEMS
                if todos.count == 0 {
                  EmptyListView()
                }
                
                
            }//Zstack
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
