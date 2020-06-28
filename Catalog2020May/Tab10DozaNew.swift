//
//  Tab10DozaNew.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 7.06.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10DozaNew: View {
        var isbor : String
        var dossi : String
        var lek   : String
        var vid   : String
        var isBor : [String] {
                             self.isbor.components(separatedBy: " ")
        }
        var words :[String] {
                            self.dossi.components(separatedBy: " ")
        }
       @State var inOn : Bool = false
       @State var alo : String = ""
       @State var isWordI  : Bool = false
       @State var isWordII : Bool = false


        
    var body: some View {
    var width = CGFloat.zero
    var height = CGFloat.zero
       return    GeometryReader { g in
                VStack {
                    HStack {
                        Spacer()
                        Text("\(self.vid)")
                          .padding()
                        Spacer()
                    }.background(Color.green)
                    ScrollView(.vertical, showsIndicators: true) {
                        ZStack(alignment: .topLeading) {
                            ForEach(0..<self.words.count, id: \.self) { i in
                                               
                              Text(self.words[i])
                                .foregroundColor(Color(self.treeInOne(wordI: self.words[i], i: i) as! Bool ? .red : .black))
                              //  .foregroundColor(Color(self.pravo(word: self.words[i]) as! Bool ? .red : .black))

                                .padding([.horizontal, .vertical], 3)
                                .onAppear() {
                                    self.alo = self.words[i]
                                 }
                                .alignmentGuide(.leading, computeValue: { d in
                                    if (abs(width - d.width) >= g.size.width / 1.2)
                                    {
                                        width = 0
                                        height -= d.height
                                    }
                                  
                                    if self.words[i] == "*" {
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
                    Spacer()
                    Divider()
                    Text("\(self.lek)")
                    .padding()
                }
                .frame(width: UIScreen.main.bounds.width - 20, height: 500)
                .background(Color.white)
                .cornerRadius(25)
            }
           
        }
    func pravo(word: String) -> Bool {
        var inOnOff : Bool = false
        if word == isBor[0]  {
            inOnOff = true
        }
        if word == isBor[1] {
            inOnOff = true
        }
        if word == isBor[2] {
            inOnOff = true
        }
   
        
        return inOnOff
    }
    func treeInOne(wordI : String, i : Int ) -> Bool {
        var isWord : Bool = false

        
        if wordI == isBor[0] && words[i + 1] == isBor[1] && words[i + 2] == isBor[2] {
                 isWord  = true
          

        }else {
            if wordI == isBor[1] && words[i + 1] == isBor[2] && words[i - 1] == isBor[0] {
                 isWord  = true
            }else {
                if wordI == isBor[2] && words[i - 1] == isBor[1] && words[i - 2] == isBor[0] {
                     isWord  = true
                }
            }
        }

        return isWord
    }
    
    }
struct Tab10DozaNew_Previews: PreviewProvider {
    static var previews: some View {
        Tab10DozaNew(isbor: "00", dossi: "11", lek: "22", vid: "33")
    }
}
