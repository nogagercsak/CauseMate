//
//  AuthenticationView.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/16/24.
//

import SwiftUI
struct AuthenticationView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack{
            Text("Welcome to CauseMate")
                .font(Font.custom("SeH-CB", size: 40))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.34, green: 0.41, blue: 0.34))
                .offset(x: 0, y: -55)
            
            
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 233, height: 54)
                        .background(Color(red: 0.43, green: 0.51, blue: 0.42))
                        .cornerRadius(30)
                    Text("Sign Up with Email")
                        .font(Font.custom("Radio Canada", size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.98, green: 0.93, blue: 0.66))
                        .frame(width: 233, height: 54, alignment: .center)
                } //ZStack line 19.
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 233, height: 54)
                    .background(Color(red: 1, green: 0.96, blue: 0.89))
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .inset(by: 1)
                            .stroke(Color(red: 0.43, green: 0.51, blue: 0.42), lineWidth: 2)
                    )
                Text("Log In")
                    .font(Font.custom("Radio Canada", size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.43, green: 0.51, blue: 0.42))
                    .frame(width: 100, height: 35, alignment: .center)
            } //ZStack line 32.
        }
        .frame(width: 393, height: 852)
        .background(Color(red: 1, green: 0.96, blue: 0.89))
        .padding()
    }
}
struct AuthenticationView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            AuthenticationView(showSignInView: .constant(false ))
        }
    }
}

