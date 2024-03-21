//
//  FormRowLinkView.swift
//  ToDoList
//
//  Created by Maya Ghamloush on 21/03/2024.
//

import SwiftUI

struct FormRowLinkView: View {
    //MARK: - PRoperties
    var icon: String
    var color: Color
    var text: String
    var link: String
    //MARK: - Body
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(.white)
            }//Zstack
            .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(text).foregroundColor(.gray)
            
            Spacer()
            
            Button(action: {
                //:OPEN A LINK
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else{
                    return
                }
                UIApplication.shared.open(url as URL)
            }, label: {
               Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            })
            .accentColor(Color(.systemGray2))
        }//HSTACK
        .padding(.horizontal, 5)
    }
}
//MARK: - PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 60)) {
    FormRowLinkView(icon: "globe", color: .pink, text: "website", link: "www.google.com")
}
