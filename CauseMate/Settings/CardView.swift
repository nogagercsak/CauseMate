//
//  CardView.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/18/24.
//

import SwiftUI

struct CardView: View {
    
    var nonprofit: String
    var nonprofitsMission: String
    
    @State private var offset = CGSize.zero
    @State private var color: Color = .blue
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 320, height: 420)
                .cornerRadius(40)
                .foregroundColor(color)
            
            VStack{
                Text(nonprofit)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(nonprofitsMission)
                    .font(.title2)
                    .foregroundColor(.white)

            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                    withAnimation{
                        changeColor(width: offset.width)
                    }
                }
                .onEnded{_ in
                    withAnimation(){
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
    }
    
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150):
            print("\(nonprofit) removed")
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(nonprofit) added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        if width < -130 {
            color = Color(red: 240/255, green: 91/255, blue: 99/255)
        } else if width > 130 {
            color = Color(red: 112/255, green: 173/255, blue: 71/255)
        } else {
            color = Color(red: 50/255, green: 50/255, blue: 50/255)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(nonprofit: "Cake", nonprofitsMission: "we ehdoe and this so amaxinf becosh")
    }
}
