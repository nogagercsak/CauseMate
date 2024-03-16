//
//  NavBar.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/16/24.
//

import SwiftUI

struct NavBar: View {
    
    @Binding var showSignInView: Bool

    var body: some View {
        HStack {
            
            NavigationLink(destination: ProfileView(showSignInView: $showSignInView)
                            .navigationBarBackButtonHidden(true)) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
            }
            .padding(.leading, 90)
            
            Spacer()
            
            Spacer()
            
            NavigationLink(destination: SettingsView(showSignInView: $showSignInView)
                            .navigationBarBackButtonHidden(true)) {
                Image(systemName: "gearshape")
                    .font(.title)
            }
            .padding(.trailing, 90)
        }
        .foregroundColor(.primary)
        .padding(.top, 20)
        .frame(height: 60)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}


struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(showSignInView: .constant(true))
    }
}
