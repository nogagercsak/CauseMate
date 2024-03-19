//
//  SwipeView.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/18/24.
//

import SwiftUI

struct SwipeView: View {
    
    @Binding var showSignInView: Bool

    var nonprofits: [String] = ["Families Forward Charlotte",
                                "Second Harvest FoodBank of Metrolina",
                                "Sustain Charlotte",
                                "Ascend Nonprofit Solutions",
                                "TreesCharlotte",
                                "Mental Health America of the Central Carolinas"].reversed()
    
    var nonprofitsMission: [String] = [
"We partner with families experiencing poverty to achieve lasting economic stability. We provide educational opportunities, offer essential support, and foster long-term relationships through individualized mentoring.",
"We provide a regional distribution warehouse and branches that supply food and grocery items to charitable agencies that assist people in need. We provide training, technical assistance and hunger education to our partner agencies.",

"A nonprofit organization helping to advance local sustainability through smart growth. Our dedicated staff and volunteers work collaboratively with residents, neighborhood organizations, government agencies, nonprofits, and businesses to solve the most important challenges to the long-term social, economic, and environmental health of our community.",

"Ascend Nonprofit Solutions partners with fellow nonprofit organizations to provide high-quality, affordable office space and finance, HR and IT solutions.",

                                       "A nonprofit made to grow and diversify Charlotte’s urban forest by promoting tree stewardship, growing Charlotte’s tree canopy and educating how to plant and preserve trees.",

                                       "Mental Health America of Central Carolinas (MHA) mission is to provide help, offer hope and promote mental wellness through advocacy, education and prevention in Mecklenburg and Cabarrus Counties."].reversed()

    
    var body: some View {
        VStack{
            ZStack{
                ForEach(Array(zip(nonprofits, nonprofitsMission)), id: \.0) { nonprofit, mission in
                    CardView(nonprofit: nonprofit, nonprofitsMission: mission)
                }
            }
            
            Text("Instructions")
                .font(.title)
            Text("Swipe right for nonprofits you are  interested in and swipe left for ones you are not interested in!")
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            NavBar(showSignInView: $showSignInView)
        }
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView(showSignInView: .constant(true))
    }
}
