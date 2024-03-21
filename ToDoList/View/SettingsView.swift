//
//  SettingsView.swift
//  ToDoList
//
//  Created by Maya Ghamloush on 20/03/2024.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack(alignment:.center, spacing: 0){
                //MARK: - FORM
                Form{
                    
                    
                    //MARK: - Section 3
                    Section(header: Text("Follow us on social media")) {
                      FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
                      FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://twitter.com/robertpetras")
                      FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://www.udemy.com/user/robert-petras")
                    } //: SECTION 3
                    .padding(3)
                   //MARK: - section 4
                    
                    Section(header: Text("About the Application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "John / Jane")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.5.0")
                      }//:SECTION 4
                    .padding(3)
                    
                }//:FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
               //MARK: - FOOTER
                Text("Copyright © All rights reserved.\nBetter apps Less CodS")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top,6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
                
                
            }//:VSTACK
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(.colorBackground)
            .navigationBarItems(trailing:
                  Button(action: {
                presentationMode.wrappedValue.dismiss()
                                  }, label: {
                Image(systemName: "xmark")
            })
            )
            
            
        }//navigation view
        
    }
}
//MARK: -  Preview
#Preview {
    SettingsView()
}
