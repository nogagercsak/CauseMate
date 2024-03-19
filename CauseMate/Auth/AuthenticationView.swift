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
            Text("Welcome to CauseMate!")
                .font(.system(size: 50))
                .frame(alignment: .leading)
            Image("globe")
                .resizable()
                .scaledToFit()
                .padding()
            
            
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign Up")
                    .padding()
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding([.horizontal, .bottom])
                }
            }
        }
}
struct AuthenticationView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            AuthenticationView(showSignInView: .constant(false ))
        }
    }
}

