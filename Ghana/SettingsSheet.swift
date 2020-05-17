//
//  BottomSheetView.swift
//  Ghanaian
//
//  Created by Tetra Apps on 5/17/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader{ (proxy : GeometryProxy) in
            VStack{
                HStack{
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                        Text("Done")
                            .font(.body)
                        .padding()
                    }
                }
                Spacer()
                
                HStack{
                    Text("Akan, Ewe, Ga, and Dagomba")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text("Hacking with Swift")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 4)
                    )
                }
                .frame(width: proxy.size.width)
                .background(Color(red:42/255, green: 44/255, blue: 44/255))
                Spacer()
                
                VStack{
                    Text("Test 1")
                    Text("Test 2")
                    Text("Test 3")
                }
                .frame(width: proxy.size.width)
            }
            .frame(width: proxy.size.width, height:proxy.size.height , alignment: .center)
        }
    }
}

// For testing purposes
struct BottomSheetView: View{
    @State var showingDetail = false

    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
        }) {
            Text("Show Detail")
        }.sheet(isPresented: $showingDetail) {
            SettingsView()
        }
    }
}

#if DEBUG
struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
#endif
