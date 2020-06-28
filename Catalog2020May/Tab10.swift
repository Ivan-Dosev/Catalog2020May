//
//  Tab10.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 29.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10: View {
     @Environment(\.presentationMode) var pMode
    
    @ObservedObject var getModel               =  Model()
    @State          var txt        : String    = ""
    @State          var isShow     : Bool      = false
    @State          var inButton               = 0
    
    var pickList : String {
        if inButton == 0 {
                   return "lekarstvo"
        }else{
                   return "grups"
        }
    }
    
    var body: some View {
        VStack {
                 HStack {
                              
                    Button(action: {  self.pMode.wrappedValue.dismiss()}) {
                     //   Text("exit")
                         Text("⏎")
                            .fontWeight(.bold)
                            .padding()
                            .padding(.top, 10)
                            .foregroundColor(.white)
                    }
                    

                                    
                                Spacer()
                            } .background(Color("greenCatallog"))
  // picker

            
    //        Text("\(pickList)")
            
          
                    VStack {
                            HStack{
                          
                            Picker(selection: self.$inButton, label: Text("")){
                                 Text(" Medicine ") .tag(0)
                                 Text("  Group   ") .tag(1)
                                
                            }.padding(.horizontal, 15)

                        }.pickerStyle(SegmentedPickerStyle())
                        
                        
                        
                      HStack {
                               TextField("search...", text: $txt)
                                   .padding()
                                  .textFieldStyle(RoundedBorderTextFieldStyle())
                               Spacer()
                          Button(action: { self.txt = ""}) {
                              Text(" Cancel ")
                                
                                  .fontWeight(.bold)
                                  
                                  .foregroundColor(Color.white)
                                  .background(Color("greenCatallog"))
                                  .clipShape(Rectangle())
                                  .cornerRadius(3)
                                .padding(.horizontal, 15)
                          }
                      }
                     // .background(Color.green)
                      //.padding(.top, 40)
                  
            
                  List {
                    ForEach (getModel.database.filter {self.txt.isEmpty ? true : self.inButton == 0 ?
                        $0.lekarstvo .lowercased().contains(self.txt.lowercased()) :
                        $0.grupa.lowercased().contains(self.txt.lowercased())
                        } ,
                             id: \.lekarstvo  )  { item in
                                //  Text("\(item.lekarstvo)")
                                Tab10Button(txt:  item.lekarstvo , isShow: self.$isShow)
                                   .sheet(isPresented: self.$isShow, content: { Tab10Sheet(opis: item.opis , lek: item.lekarstvo , mjarka: item.mjarka , grupa: item.grupa , isShow: self.$isShow) })
                             
                              }
                       }
              }
                      
                      Spacer()
                      
            
        }.background(Color.green.opacity(0.1))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Tab10_Previews: PreviewProvider {
    static var previews: some View {
        Tab10()
    }
}
/*
 What is the risk:
 What is the proper use:
 What is the dosage:
 Side effects:
 What should we be careful for:
 */
