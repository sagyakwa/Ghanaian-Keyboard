//
//  About.swift
//  Ghanaian Keyboard
//
//  Created by Samuel Agyakwa on 5/18/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    let twitterUrl: NSURL = URL(string: "https://twitter.com/tetra_apps")! as NSURL
    
    var body: some View {
        VStack(spacing: 40){
            HStack(alignment: .center){
                Text("About Ghana Keyboard")
                    .font(.custom("copperplate", size: 28))
            }
            
            HStack(spacing: 15){
                Text("This keyboard is intended to make the lives of many people, especially Ghanaians easier. We rarely see things made for, or tailored to us in the Western world. Without further adieu, I present to you a keyboard containg characters from Akan, Ewe, Ga, and Dagbani. Many more dialects and languages unknown to the world will come soon. Our African languages not only allow us to connect with one another, but it allows us to appreciate the sweat and history of our ancestors. It cultivates an appreciation and understanding that is beyond beneficial for us. Enjoy the experience!")
                    .font(.headline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
            }.padding()
            
            Spacer()
            
            VStack{
                LogoView()
                // HStack for "follow me text" and twitter logo.
                HStack(alignment: .center){
                    // Twitter logo. Clickable and leads to company twitter
                 Image("twitter-logo")
                     .resizable()
                     .padding(.leading, -4)
                     .padding(.trailing, -1)
                     .frame(width: 25, height: 25)
                     .aspectRatio(contentMode: .fit)
                    Button(action: {UIApplication.shared.open(self.twitterUrl as URL)}){
                        // Button Text
                        Text("Follow us")
                         .font(.headline)
                         .fontWeight(.semibold)
                         .padding(.leading, -3)
                        }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
