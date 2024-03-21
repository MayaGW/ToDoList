//
//  FormRowStaticView.swift
//  ToDoList
//
//  Created by Maya Ghamloush on 21/03/2024.
//

import SwiftUI

struct FormRowStaticView: View {
    //MARK: - PROPERTIES
    var icon: String
    var firstText: String
    var secondText: String
    //MARK: - BODY
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(firstText)
                .foregroundColor(.gray)
            Spacer()
            Text(secondText)
                .foregroundColor(.gray)
            
            
        }//HSTACK
        .padding(.horizontal,5)
        
        
    }
}
//MARK: - PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 60)) {
    FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
}
