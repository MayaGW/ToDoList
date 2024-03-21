//
//  AddToDoView.swift
//  ToDo App
//
//  Created by Maya Ghamloush on 19/03/2024.
//

import SwiftUI
import CoreData
struct AddToDoView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) private var managedObjectContext
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    let priorities =  ["High", "Normal", "Low"]
    
    //MARK: - BODY
    var body: some View {
        
        
        NavigationView{
            VStack {
                VStack(alignment: .leading, spacing: 20){
                    //MARK: - TODO NAME
                 TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    //MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id:\.self){
                            Text($0)
                        }
                    }//PICKER
                    .pickerStyle(SegmentedPickerStyle())
                    //MARK: - SAVE BUTTON
                    
                    Button(action: {
                        if self.name != "" {
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            do{
                                try self.managedObjectContext.save()
                                 
                            }catch{
                                print(error)
                            }
                        }else{
                            self.errorShowing = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to ennter somethingfor \nthe new todo item"
                            return
                        }
                        self.presentationMode.wrappedValue.dismiss()
                       
                    }, label: {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(9)
                            .foregroundColor(.white)
                    })
                }//:VSTACK
                .padding(.horizontal)
                .padding(.vertical, 30)
                Spacer()
            }//:VSTACK
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
             Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                //CLOSDE the sheet
            }, label: {
                Image(systemName: "xmark")
            })
            )
            .alert(isPresented: $errorShowing, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            })
        }// : NAVIGATIONVIEW
    }
}
//MARK: - PREVIEW
#Preview {
    AddToDoView()
}
