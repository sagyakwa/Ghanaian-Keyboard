//
//  SettingsView.swift
//  Ghanaian Keyboard
//
//  Created by Samuel Agyakwa on 5/18/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI
import Combine

struct SettingsView : View {
    @ObservedObject var setting = Settings()
    let twitterUrl: NSURL = URL(string: "https://twitter.com/tetra_apps")! as NSURL
    @State private var isShareSheetShowing = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            NavigationView {
                Form {
                    ForEach(Option.options, id: \.id) { settingOption in OptionRow(option: settingOption)
                    }
                    
                    Spacer()
                    
                    // Footer "follow me text" and twitter logo.
                    Section(footer:
                               HStack(alignment: .center){
                                   // Twitter logo. Clickable and leads to company twitter
                                Image("twitter-logo")
                                    .resizable()
                                    .padding(.leading, 12)
                                    .padding(.trailing, -17)
                                    .frame(width: 25, height: 25)
                                    .aspectRatio(contentMode: .fit)
                                
                               Button(action: {UIApplication.shared.open(self.twitterUrl as URL)}){
                                       Text("Follow us")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .padding(.leading, 19)
                                }.buttonStyle(PlainButtonStyle())
                               }){
                                LogoView()
                                }
                                .padding()
                                .padding(.leading, 85)
                    
                }
                .animation(.easeOut(duration: 0.5))
                .padding()
                .navigationBarTitle(Text("Settings")).font(.largeTitle)
                .navigationBarItems(trailing: Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                        Text("Done")
                            .font(.body)
                            .padding()
                })
            } //end NavigationView
        }
        // Only support portrait...no reason to rotate
        .supportedOrientations(.portrait)
        
        
    }
}

struct OptionRow: View {
    let option: Option
    var body: some View {
        Group() {
            if option.isAddSection {
                Section {
                    OptionSettingsView(option: option)
                }.cornerRadius(25)
            }
            else {
                OptionSettingsView(option: option)
            }
        }
    }
}

struct OptionSettingsView : View {
    let option: Option
    
    var body: some View {
        return NavigationLink(destination: self.option.view) {
            HStack {
                Image(systemName: self.option.imageName)
                    .resizable()
                    .font(.body)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
                Text(option.title)
                    .font(.system(size: 22))
                    .padding(.horizontal)
            }
        }
    }
}

struct LogoView: View {
    let twitterUrl: NSURL = URL(string: "https://twitter.com/tetra_apps")! as NSURL
    
    var body: some View {
        // VStack for bottom of the screen
        VStack(alignment: .center){
            // Make our logo clickable
            Button(action: {UIApplication.shared.open(self.twitterUrl as URL)}){
                Image("rocket")
                    .resizable()
                    .frame(width: 87.0, height: 135)
            }.buttonStyle(PlainButtonStyle()) // button fills everything as blue without this. We just want our logo

            // Text of company name
            Text("TETRA APPS")
                .foregroundColor(Color(UIColor.systemIndigo))
                .multilineTextAlignment(.center)
                .padding(.vertical, -40.0)
                .font(.custom("copperplate", size: 23))
        }
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif
