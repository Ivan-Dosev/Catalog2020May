//
//  ContentView.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 29.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var buttonCatalog : Bool = false
    @State var index : [Double] = [1,0,0]

    
    var body: some View {
                GeometryReader { reader in
                    VStack {
                      
                        ZStack {
                            Tab10List00()
                                .zIndex(self.index[0])
                            Tab10List01()
                                .zIndex(self.index[1])
                            Tab10List02()
                                .zIndex(self.index[2])
                            }
                          
                     
                        HStack {
                            Button(action: {
                                            self.index[0] = 1
                                            self.index[1] = 0
                                            self.index[2] = 0
                            }) {
                                Text(self.index[0] == 1 ? "●" : "○")
                                .padding()
                                .foregroundColor(Color("greenCatallog"))
                                                           
                            }
                            Button(action: {
                                             self.index[0] = 0
                                             self.index[1] = 1
                                             self.index[2] = 0
                            }) {
                                Text(self.index[1] == 1 ? "●" : "○")
                                .padding()
                                .foregroundColor(Color("greenCatallog"))
                                                           
                            }
                            Button(action: {
                                             self.index[0] = 0
                                             self.index[1] = 0
                                             self.index[2] = 1
                            }) {
                            Text(self.index[2] == 1 ? "●" : "○")
                                .padding()
                                .foregroundColor(Color("greenCatallog"))
                                
                            }
                        }
                      Spacer(minLength: 50)

                        HStack {
                            Button(action: {self.buttonCatalog.toggle()}) {
                                 Text("Catalog")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(10)
                                    .padding(.horizontal, 60)
                                    .foregroundColor(Color.white)
                            }
                        }
                        .background(Color("greenCatallog"))
                        .clipShape(Capsule())
                        .shadow(color: Color.white, radius: 20, x: 15, y: 15)
                       
                    
                        Spacer(minLength:  100)
                    }
                }.background(Color.green.opacity(0.1))
                 .edgesIgnoringSafeArea(.all)
                 .sheet(isPresented: self.$buttonCatalog, content: {Tab10()})
            }
        }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
 @Environment(\.presentationMode) var pMode
   self.pMode.wrappedValue.dismiss()
 
 
 
 
 @ObservedObject var getModel               =  Model()
 @State          var txt        : String    = ""
 @State          var isShow     : Bool      = false

 
 var body: some View {
    
         VStack {
               
                     HStack {
                         Spacer()
                        // Text("catallog")
                          //   .padding(.top, 80)
                          //   .font(.custom("Sherlyn", size: 52))
                           //  .foregroundColor(.white)
                             
                         Spacer()
                     }   .background(Color("greenCatallog"))
                        
                     
                   VStack {
                     HStack {
                              TextField("search...", text: $txt)
                                  .padding()
                                 .textFieldStyle(RoundedBorderTextFieldStyle())
                              Spacer()
                         Button(action: { self.txt = ""}) {
                             Text("Cancel")
                                 .fontWeight(.bold)
                                 .foregroundColor(Color.white)
                                 .padding()
                         }
                     }
                    // .background(Color.green)
                     .padding(.top, 40)
                 
           
                 List {
                             ForEach (getModel.database.filter {self.txt.isEmpty ? true : $0.lekarstvo .lowercased().contains(self.txt.lowercased()) } , id: \.lekarstvo)  { item in
                                 Text("\(item.lekarstvo)")
                               //  Tab10Button(txt: item.lekarstvo, isShow: self.$isShow)
                                  .sheet(isPresented: self.$isShow, content: { Tab10Sheet(opis: item.opis , lek: item.lekarstvo , mjarka: item.mjarka , grupa: item.grupa , isShow: self.$isShow) })
                             
                             }
                      }
             }
                     
                     Spacer()
                     
           

             }.background(Color("greenCatallog"))
             .edgesIgnoringSafeArea(.all)
         }
     }
 */
