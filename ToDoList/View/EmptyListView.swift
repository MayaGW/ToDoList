//
//  EmptyListView.swift
//  ToDoList
//
//  Created by Maya Ghamloush on 20/03/2024.
//

import SwiftUI

struct EmptyListView: View {
    //MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    @State private  var randomNumber: Int = Int.random(in: 0...2)
 
    
    let tips: [String] = [
      "Use your time wisely.",
      "Slow and steady wins the race.",
      "Keep it short and sweet.",
      "Put hard tasks first.",
      "Reward yourself after work.",
      "Collect tasks ahead of time.",
      "Each night schedule for tomorrow."
    ]
 
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            VStack(alignment:.center, spacing: 20) {
                Image("illustration-no\(randomNumber)")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .layoutPriority(1)
                Text(tips.randomElement() ?? tips[0])
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
                
            }//:VSTACK
            .opacity(isAnimated ? 1 : 0)
            .offset(y: isAnimated ? 0 : -50)
            .animation(.easeOut(duration: 1.5))
            .onAppear(perform: {
                isAnimated.toggle()
            })
 
            
            
            .padding(.horizontal)
        }//:ZSTACK
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,  maxWidth: .infinity, minHeight: 0, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(.colorBAse)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
//MARK: - PREVIEW
#Preview {
    EmptyListView()
}
