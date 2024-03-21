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
    @EnvironmentObject var iconSettings: IconNames
    //THEME
    let themes: [Theme] = themeData
    //
   //@ObservedObject var theme = ThemeSettings()
    @ObservedObject var theme = ThemeSettings.shared
    //MARK: - Body
    var body: some View {
        NavigationView {
            VStack(alignment:.center, spacing: 0){
                //MARK: - FORM
                Form{
                    //MARK: - SECTION 1
                    Section(header: Text("Choose the app icon")) {
                        Picker(selection: $iconSettings.currentIndex,  label: Text("App Icon")){}
                    }
                    .padding(.vertical, 3)
                    //MARK: - SECTION 2
                    Section(header: 
                                HStack {
                        
                        Text("Choose the app theme")
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(themes[self.theme.themeSettings].themeColor)
                    }
                    
                    ) {
                        List{
                            ForEach(themes, id:\.id){ item in
                                Button(action: {
                                    self.theme.themeSettings = item.id
                                    UserDefaults.standard.set(self.theme.themeSettings, forKey: "Theme")
                                }, label: {
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(item.themeColor)
                                        Text(item.themeName)
                                    }
                                }).accentColor(.primary)
                                
                          
                            }
                           
                        }
                    }//Section2
                    .padding(.vertical, 3)
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
        .environmentObject(IconNames())
}
