//
//  SignInEmailView.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/16/24.
//

import SwiftUI
struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack{
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            TextField("Name", text: $viewModel.name)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                .padding()
            
            TextField("Zip Code", text: $viewModel.zipCode)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            Toggle("Interested in Remote", isOn: $viewModel.interestedInRemote)
                .padding()
            
            // Here, you would have a list of interests to choose from
            // For demonstration, assuming a simple text field
            TextField("Interests (comma-separated)", text: $viewModel.interests)
                .padding()
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
            
            Button{
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView =  false
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Sign Up With Email")
    }
}


struct SignInWithEmail: PreviewProvider{
    static var previews: some View{
        NavigationStack{
            SignInEmailView(showSignInView: .constant(false))
        }
    }
}

