//
//  ContentView.swift
//  Ghana
//
//  Created by Tetra Apps on 5/15/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // For toggling settings sheet view
    @State private var isShareSheetShowing = false
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        GeometryReader{ (proxy : GeometryProxy) in
            // VStack that occupies the whole screen exluding the safe space
            VStack{
                // HStack for the top where the share button and Settings button lives
                HStack(alignment: .top){
                    // Share button
                    Button(action: {self.shareButton()}
                    ){
                        // Apply iOS stock share image
                        Image(systemName: "square.and.arrow.up")
                            
                            // resize image to fit and offset it a little bit so it's not touching the literal edge
                            .resizable()
                            .frame(width: 28, height: 35)
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 10, y: 8)
                    }
                    
                    // This gives us our end to end look
                    Spacer()
                    
                    
                    // Settings button
                    Button(action: {self.isShareSheetShowing.toggle()}){
                        // Apply iOS stock settings image
                        Image(systemName: "gear")
                            
                            // resize image to fit and offset it a bit so it's not touching the edge
                            .resizable()
                            .frame(width: 33, height: 35)
                            .aspectRatio(contentMode: .fit)
                            .offset(x: -8, y: 8)
                            
                    }
                        // toggle sheet view
                    .sheet(isPresented: self.$isShareSheetShowing) {
                        SettingsView()
                    }
                }
                    // set the width of our HStack to the width of the device
                    .frame(width: proxy.size.width)
                    .padding()
                
                
                Spacer()
                
                // VStack for our gif
                
                VStack{
                    GIFView(gifName: "keyboard-demo")
                }
                    // Make VStack have rounded edges like iPhone X and up
                    .padding(.all, -1.0)
                    .frame(width: proxy.size.width - 125.0)
                    .cornerRadius(50)
                
                // HStack for our button to add the keyboard
                HStack(alignment: .center){
                        // Add keyboard button
                        Button(action: {UIApplication.shared.open(URL.init(string: "App-prefs:General&path=Keyboard")!)}) {
                            // add a little stock keyboard image and make it white
                            Image(systemName: "keyboard")
                                .resizable()
                                .frame(width: 53, height: 30)
                                
                                .foregroundColor(Color.white)
                            Text("Add Keyboard")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                        }
                            // Set the min and max width for our button (fine on iPhone 6 and up)
                                     .frame(minWidth: 85, maxWidth: 325, minHeight: 35, maxHeight: 42)
                                     .padding()
                                     .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                     
                                     .cornerRadius(28)
                            
                    }
                    .padding(.bottom, proxy.safeAreaInsets.top)
                .padding(.top, 43.0)
                .frame(width: proxy.size.width)
                    .edgesIgnoringSafeArea(.all)
                .background(self.colorScheme == .dark ? Color(red: 42/255, green: 44/255, blue: 44/255) : Color(red: 230/255, green: 230/255, blue: 230/255))
                        
                    
                    
                    // Only support portrait...no reason to rotate
                    .supportedOrientations(.portrait)
                
            }
            // Make our VStack that occupies the whole screen equal to the dimension of the specific device. Excluding the safe space.
                .edgesIgnoringSafeArea(.bottom)
            .frame(width: proxy.size.width, height:proxy.size.height , alignment: .center)
        }
    }
    
    // Function to bring up the share sheet
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
