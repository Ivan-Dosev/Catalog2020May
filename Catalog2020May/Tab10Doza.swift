//
//  Tab10Doza.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 7.06.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10Doza: View {
        var dossi : String
        var lek   : String
        var vid   : String
    var words :[String] {
        self.dossi.components(separatedBy: " ")
    }
            @State var inOn : Bool = false
            @State var alo : String = ""

            var body : some View {
                var width = CGFloat.zero
                var height = CGFloat.zero
                //
                return GeometryReader { g in

                    ZStack(alignment: .topLeading) {
                      
                        ForEach(0..<self.words.count, id: \.self) { i in
                      
                            Text(self.words[i])
                                .foregroundColor(Color(self.words[i] == "adults"  ||  self.words[i] == "cleanser" ? .red : .black))
                                .padding(.horizontal,2)
                               
                               // .padding([.horizontal, .vertical], 4)
                                .onAppear() {
                                       self.alo = self.words[i]
                                 }
                                .onTapGesture {
                                    self.inOn.toggle()
                                    // print("word tapped=\(self.words[i])")
         
                            }
                                .alignmentGuide(.leading, computeValue: { d in
                                    if (abs(width - d.width) >= g.size.width / 1.2)
                                    {
                                        width = 0
                                        height -= d.height
                                    }
                                    let result = width
                                    if i < self.words.count-1 {
                                        width -= d.width
                                    } else {
                                        width = 0 //last item
                                    }
                                    return result
                                })
                                .alignmentGuide(.top, computeValue: {d in
                                    let result = height
                                    if i >= self.words.count-1 {
                                        height = 0 // last item
                                    }
                                    return result
                                })
                           
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: 500)
                    .background(Color.white)
                    .cornerRadius(25)
                
                 
                }
            }

        }

struct Tab10Doza_Previews: PreviewProvider {
    static var previews: some View {
        Tab10Doza(dossi: "11", lek: "22", vid: "33")
    }
}
/*
     @State var inOn : Bool = false
     @State var alo : String = ""

     var body : some View {
         var width = CGFloat.zero
         var height = CGFloat.zero
         //
         return GeometryReader { g in
             ZStack(alignment: .topLeading) {
                 ForEach(0..<self.words.count, id: \.self) { i in

                     Text(self.words[i])
                         .foregroundColor(Color(self.words[i] == "harns"  ||  self.words[i] == "cleanser" ? .red : .black))
                     
                         .padding([.horizontal, .vertical], 4)
                         .onAppear() {
                                self.alo = self.words[i]
                          }
                         .onTapGesture {
                             self.inOn.toggle()
                             // print("word tapped=\(self.words[i])")
  
                     }
                         .alignmentGuide(.leading, computeValue: { d in
                             if (abs(width - d.width) > g.size.width)
                             {
                                 width = 0
                                 height -= d.height
                             }
                             let result = width
                             if i < self.words.count-1 {
                                 width -= d.width
                             } else {
                                 width = 0 //last item
                             }
                             return result
                         })
                         .alignmentGuide(.top, computeValue: {d in
                             let result = height
                             if i >= self.words.count-1 {
                                 height = 0 // last item
                             }
                             return result
                         })
                 }
             }
         }

     }

 }
 */
