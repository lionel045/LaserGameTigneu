//
//  Firebase course.swift
//  LaserGameTIgneu
//
//  Created by Lion on 15/07/2024.
//

import SwiftUI

struct Firebase_course: View {
    
    var body: some View {
        @State var email = "Contoso"
        @State var passWord = "Mot de passe"
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.pink,.red], startPoint: .topLeading, endPoint:  .bottomTrailing))
                .frame(width: 1000,height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
        
            VStack(spacing : 20){
                
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -80,y: -160)
                
                    TextField("Mail", text: $email, prompt: Text("Mail"))
                    .foregroundStyle(.white)
                    .textFieldStyle(.plain)
                    .bold()
                    .padding(.leading, 20)
                    Rectangle()
                    .frame(width: 320, height: 2)
                    .foregroundStyle(.white)   
                    .padding(.bottom, 25)
                TextField("Mdp", text: $passWord, prompt: Text("Mot de passe"))
                    .foregroundStyle(.whi)
                    .textFieldStyle(.plain)
                    .bold()
                    .padding(.leading, 20)
                    Rectangle()
                    .frame(width: 320, height: 2)
                    .foregroundStyle(.white)
                    .padding(.bottom, 100)
                Button {
                } label: {
                    Text("SignUp")
                    .foregroundStyle(.white)
                    .frame(width: 200)
                    .padding()
                    .background
                    {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .foregroundStyle(.linearGradient(colors: [.pink,.red], startPoint: .topLeading, endPoint:  .bottomTrailing))
                    }
                }
                
                Button("Already registred ? Login") {
                    
                }
                .foregroundStyle(.white)
            
                
                
                    
                
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()

    }
}

#Preview {
    Firebase_course()
}
