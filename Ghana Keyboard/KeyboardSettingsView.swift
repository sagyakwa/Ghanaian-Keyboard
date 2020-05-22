//
//  KeyboardSettings.swift
//  Ghanaian Keyboard
//
//  Created by Samuel Agyakwa on 5/18/20.
//  Copyright © 2020 Tetra Apps. All rights reserved.
//

import SwiftUI

struct KeyboardSettingsView: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State var offset : CGFloat = UIScreen.main.bounds.height
    @State var keyboardToggle = UserDefaultsStorage.keyboardOn
    @State var akanToggle = UserDefaultsStorage.akan
    @State var eweToggle = UserDefaultsStorage.ewe
    @State var gaToggle = UserDefaultsStorage.ga
    @State var dagbaniToggle = UserDefaultsStorage.dagbani
    
    init(){
        UISwitch.appearance().onTintColor = .systemBlue
    }
    
    var body : some View{
        return
            VStack (spacing: 35){
                Text("Keyboard and Language")
                    .font(.title)
                
                VStack{
                    HStack{
                        Toggle(isOn: $keyboardToggle){
                            Text("Keyboard")
                                .font(.system(size: 20, weight: .medium, design: .default))
                        }
                        .onTapGesture {
                            self.keyboardToggle.toggle()
                            // Programatically toggle our bool values and store them
                            UserDefaultsStorage.keyboardOn.toggle()
                            
                            if !self.keyboardToggle{
                                UserDefaultsStorage.akan = false
                                self.akanToggle = false
                                UserDefaultsStorage.ewe = false
                                self.eweToggle = false
                                UserDefaultsStorage.ga = false
                                self.gaToggle = false
                                UserDefaultsStorage.dagbani = false
                                self.dagbaniToggle = false
                            }
                            else{
                                UserDefaultsStorage.akan = true
                                self.akanToggle = true
                            }
                        }
                    }
                    
                }
                .padding()
                .background(self.colorScheme == .dark ? Color(red: 42/255, green: 44/255, blue: 44/255) : Color(red: 230/255, green: 230/255, blue: 230/255))
                
                Divider()
                
                VStack (spacing: 15){
                    HStack{
                       Toggle(isOn: $akanToggle)
                       {
                            Text("Akan")
                                .font(.system(size: 20, weight: .medium, design: .default))
                        }
                       .onTapGesture {
                            UserDefaultsStorage.akan.toggle()
                        }
                        
                    }
                    
                    Divider()
                    
                    HStack{
                        Toggle(isOn: $eweToggle){
                            Text("Ewe")
                                .font(.system(size: 20, weight: .medium, design: .default))
                        }.onTapGesture{
                            UserDefaultsStorage.ewe.toggle()
                        }
                    }
                    
                    Divider()
                    
                    HStack{
                        Toggle(isOn: $gaToggle){
                            Text("Ga")
                                .font(.system(size: 20, weight: .medium, design: .default))
                        }.onTapGesture{
                            UserDefaultsStorage.ga.toggle()
                        }
                    }
                    
                    Divider()
                    
                    HStack{
                        Toggle(isOn: $dagbaniToggle){
                            Text("Dagbani")
                                .font(.system(size: 20, weight: .medium, design: .default))
                        }.onTapGesture{
                            UserDefaultsStorage.dagbani.toggle()
                        }
                    }
                    
                }
                .padding()
                .background(self.colorScheme == .dark ? Color(red: 42/255, green: 44/255, blue: 44/255) : Color(red: 230/255, green: 230/255, blue: 230/255))
                
                Spacer()
                
            }.padding(.top)
    }
}

struct KeyboardSettings_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardSettingsView()
    }
}
