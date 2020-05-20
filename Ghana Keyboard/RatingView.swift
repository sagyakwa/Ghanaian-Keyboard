//
//  RatingView.swift
//  Ghana Keyboard
//
//  Created by Samuel Agyakwa on 5/20/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
//    @State var hasRated = false

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                        NSLog("Tapped!")
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(1))
    }
}



//if self.hasRated {
//                    withAnimation {
//                        HStack{
//                            Button(action: {}){
//                                Text("Write an appstore review")
//                                    .font(.headline)
//                                    .padding()
//                            }.transition(.scale)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .background(Color(UIColor.systemBlue))
//                        .cornerRadius(20)
//
//                    }
//                }
