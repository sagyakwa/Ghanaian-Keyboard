//
//  ContentView.swift
//  Ghana
//
//  Created by Samuel Agyakwa on 5/15/20.
//  Copyright © 2020 Samuel Agyakwa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isShareSheetShowing = false
    
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 5){
                Button(action: {self.shareButton()}
                ){
                    Image(systemName: "square.and.arrow.up")
                        
                        .resizable()
                        .frame(width: 28, height: 35)
                        .aspectRatio(contentMode: .fit)
                        .offset(y: 15)
                        .padding(.horizontal, 15)
                    
                }
                
                Spacer()
                
                Button(action: {}){
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 33, height: 35)
                        .aspectRatio(contentMode: .fit)
                        .offset(y: 15)
                        .padding(.horizontal, 15)
                }
            }
            Spacer()
            
//            HStack(alignment: .center){
//                GIFView(gifName: "keyboard-demo")
//            }
            
            HStack(alignment: .bottom){
                Button(action: {UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!)}) {
                    Image(systemName: "keyboard")
                    Text("Add Keyboard")                  .background(Color.blue)
                        .foregroundColor(Color .white)
                        .font(.system(size: 18))
                        
                }
                    .background(Color .blue)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 29))
            }
            
            Spacer()
                .supportedOrientations(.portrait)
            
        }
    }
    
    func shareButton(){
        isShareSheetShowing.toggle()
        let url = URL(string: "https://google.com")
        let textToShare = "Check out this awesome Ghanaian keyboard!"
        let activityView = UIActivityViewController(activityItems: [url!, textToShare], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true, completion: nil)
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
