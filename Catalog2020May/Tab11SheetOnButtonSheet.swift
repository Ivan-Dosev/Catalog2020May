//
//  Tab11SheetOnButtonSheet.swift
//  CatallogGreenView
//
//  Created by Ivan Dosev Dimitrov on 20.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab11SheetOnButtonSheet: View {
    
    @Binding var isOnButton : Bool
    
    @State   var isPro         : Bool = false
    @State   var isMaxDoza     : Bool = false
    
    @Binding var value         : Float
             var detaill       : String
             var lek           : String
             var mjarka        : String
             var grupa         : String
    
 
       var stepI : [String]{
                        self.detaill.components(separatedBy: " ")
       }
   
    
    // mg/day
    
    var priemD : [String] {
                            priemDay()
    }
    var dayOT : String {
        if self.priemD.count >= 2 {
            return self.priemD[0]
        }
        return "0"
    }
    var dayDO : String {
        if self.priemD.count == 3 {
                              return self.priemD[1]
        }
        if self.priemD.count == 2 {
                               return self.priemD[0]
        }
        return "0"
    }
    var dayOTfloat : Float {
                              Float ( String( self.dayOT)) ??  0
    }
    var dayDOfloat : Float {
                              Float ( String( self.dayDO)) ??  0
    }
    
    

    var priem : [String] {
                           prieM()
    }

    
    var priemOt : String {
        if self.priem.count >= 2 {
            return self.priem[0]
        }
        return "0"
    }
    var priemDo : String {
        if self.priem.count == 3 {
                              return self.priem[1]
        }
        if self.priem.count == 2 {
                               return self.priem[0]
        }
        return "0"
    }
// kantar
    var kantar : String {
                         kantarPazient()
    }
    var kantarFloat : Float {
                         Float ( String (self.kantar)) ?? 0
    }
    @State var isKanter : Bool = false
    
    
// max dosa
    var maxDosa : String {
                         maxdosa()
    }
    var maxDosaFloat : Float {
                        Float ( String( self.maxDosa)) ??  0
    }
    
  //  kraj  max dosa
    
    
    var timesOfDay : String {
                           tootime()
    }
    
 //  2_3_time_a_day
    
    var timesToDays : [String] {
                               toTimes()
    }
    var timeOt : String {
        if self.timesToDays.count >= 4 {
                                     return self.timesToDays[0]
        }
        return "0"
    }
    var timeDo : String {
        if self.timesToDays.count == 5 {
                                     return self.timesToDays[1]
        }
        if self.timesToDays.count == 4 {
                                     return self.timesToDays[0]
        }
        return "0"
    }
    var timeOtFloat : Float {
                            Float (String(self.timeOt)) ?? 1
    }
    var timeDoFloat : Float {
                            Float (String(self.timeDo)) ?? 1
    }
    // краи
    
   // tit-tit
    var titOTtit : String {
                                   loadTit()
    }
    // краи
    
    // Lday
    
    var ldayOTlday : String {
                           loadLday()
    }
    
    // краи
    
    // парва доза
    var fierstDoze : String {
                             primDozze()
    }
    var fierstDozeFloat : Float {
                        Float ( String( self.fierstDoze)) ??  0
    }
    //краи парва доза
    
       var otFloat : Float {
                        Float ( String( self.priemOt)) ??  0
         }
       var doFloat : Float {
                        Float ( String( self.priemDo)) ??  0
       }
      var timeFloat : Float {
                         Float ( String( self.timesOfDay)) ??  1
       }
 
    var isShow : Bool {
        if self.otFloat == self.doFloat {
                           return true
        }else {
                           return false
        }
    }
    var isRawno : Bool {
        if self.otFloat == self.doFloat {
                    return false
        }else{
                    return true
        }
    }
    
    var otForTxt : Float {
        (otFloat * value ) / timeFloat
    }
    var doForTxt : Float {
        (doFloat * value ) / timeFloat
    }

    @State var indexButton = 0
     
    @State var im : [Double] = [1,0,0,0,0,0]
    
            var timer : Timer {
         Timer.scheduledTimer(withTimeInterval: 1 , repeats: true) { _ in
             self.update()
             self.isMaxDoza.toggle()
         }
     }
    
 
    
     @ObservedObject var recModel               =  Recarstvo()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.isOnButton = false
                    
                }) {
                    Text("⏎")
                    .padding(.top)
                    .foregroundColor(.white)
                }
               
                   
                    
                Spacer()
                Button(action: {
                                 self.isPro.toggle()
                            }) {
                                Text("💊")
                                .padding(.top)
                                .foregroundColor(.white)
                                
                                //.sheet(isPresented: self.$isPro, content:{ Tab10Sheet(isPro: self.$isPro, txt: self.lek)})
                            }
            }.padding()
            .background(Color("greenCatallog"))
            
            
                HStack{
              
                Picker(selection: self.$indexButton, label: Text("")){
                     Text("Calc") .tag(0)
                     Text("Dose")  .tag(1)
                     Text("Risk")  .tag(2)
                     Text("Use") .tag(3)
                     Text("Alert") .tag(4)
                     Text("Side-E") .tag(5)
                    
                    }.padding()
                .onAppear(){
                    self.timer
                   
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            ZStack {
                  
                ForEach(recModel.database200.filter{ $0.lekarstvo.lowercased() == (lek.lowercased())} ,id: \.lekarstvo) { item in
                  
                        ZStack {
                            Tab10DozaNew(isbor: self.detaill  , dossi: item.dosage, lek: item.lekarstvo, vid: " What is the dosage:")
                                     .zIndex(Double(self.im[1]))
                         
                            Tab10Card(dossi: item.risk, lek: item.lekarstvo, vid: "What is the risk:")
                                     .zIndex(Double(self.im[2]))
                            Tab10Card(dossi: item.proper, lek: item.lekarstvo, vid: "What is the proper use:")
                                     .zIndex(Double(self.im[3]))
                            Tab10Card(dossi: item.careful, lek: item.lekarstvo, vid: "What should we be careful for:")
                                     .zIndex(Double(self.im[4]))
                            Tab10Card(dossi: item.effects, lek: item.lekarstvo, vid: "Side effects:")
                                     .zIndex(Double(self.im[5]))
                           
                                
                            Tab10CardCalculator(titOTtit: self.titOTtit, ldayOTlday: self.ldayOTlday, dayOTfloat: self.dayOTfloat, dayDOfloat: self.dayDOfloat, kgOTfloat: self.otFloat, kgDOfloat: self.doFloat, timeOTfloat: self.timeOtFloat, timeDOfloat: self.timeDoFloat, fierstDozeFloat: self.fierstDozeFloat, maxDozeFloat: self.maxDosaFloat, lek: self.lek, mjarka: self.mjarka, value: self.value, kantar: self.kantarFloat)
                                          .zIndex(Double(self.im[0]))
                           
                                
                       

                        
                    }
                      
                   /*
                     What is the risk:
                     What is the proper use:
                     What is the dosage:
                     Side effects:
                     What should we be careful for:
                     */
                          
                  }
            }
            
   /*
            if self.maxDosa != "0" {
                                     HStack {
                                                Spacer()
                                                Text("max doza \(maxDosa)")
                                                   .padding()
                                                    .background(Color.green)
                                                   .clipShape(Capsule())
                                                   .scaleEffect(isMaxDoza ? 1 : 1.25)
                                                   .foregroundColor(Color(isMaxDoza ? .red : .blue))
                                                Spacer()
                                            }
            }
            
           
            Text("\(titOTtit)")
          
            Text("...\(dayOTfloat) - \(dayDOfloat)...")
            if self.ldayOTlday == "1000" {
                           Text("lechenieto e prezenka na lekarja")
            }else {
                           Text("lechenie - \(ldayOTlday) dena")
            }
            
               
            if self.timeOtFloat == self.timeDoFloat {
                        
                        HStack {
                                    Spacer()
                                    Text(" \((timeDoFloat), specifier: "%.0f") times of day")
                                    Spacer()
                        }
                    } else {
                        HStack {
                                   Spacer()
                                   Text("\((timeOtFloat), specifier: "%.0f") -")
                                   Text(" \((timeDoFloat), specifier: "%.0f") times of day")
                                   Spacer()
                        }
                        
            }
            

            
            
            if self.doFloat != 0 {
                VStack {
                 
                    if isRawno {
                        HStack {
                            Spacer()
                            Text("от \((otForTxt), specifier: "%.2f") \(mjarka) - \((timeFloat), specifier: "%.0f") пъти на ден")
                                
                            Spacer()
                        }.background(Color.green)
                        .padding()
                    }
                    HStack {
                        Spacer()
                        Text("до \((doForTxt), specifier: "%.2f") \(mjarka) - \((timeFloat), specifier: "%.0f") пъти на ден")
                            
                            
                        Spacer()
                    }.background(Color.green)
                    .padding()
             
                }
            }else{
                HStack {
                    Spacer()
                    Text("не е използван калкулатор!")
                        .padding()
                      
                    Spacer()
                }.background(Color.green)
                .padding()
                
            }
           
        */
           Spacer()

        }.background(Color("greenCatallog").opacity(0.1))
         .edgesIgnoringSafeArea(.all)
         .sheet(isPresented: self.$isPro, content:{ Tab10Pro(txt: self.lek, isPro: self.$isPro)})
    }
    
     func prieM() -> [String] {
        
         var arda : [String]  = []
        
         for alo in stepI.filter({$0.contains("/kg")}) {
             if var pri : String = alo {
                 print("\(pri)")
                 arda = pri.components(separatedBy: "_")
               // print("<\(arda.count)>")
               
             }
         }
         return arda
     }
    
    
    // priem/day
    
    func priemDay() -> [String] {
        
    var prday : [String] = []
        
         for alo in stepI.filter({$0.contains("/day")}) {
            if var day : String = alo {
                prday = day.components(separatedBy: "_")
            }
        }
        
        return prday
    }
    // krai
    
    
    
    // 2_3_time_a_day
    
    func toTimes() -> [String] {
        
        var toTime : [String] = []
        for tri in stepI.filter({$0.contains("times_a_day")}) {
            if var tt : String = tri {
               
                toTime = tt.components(separatedBy: "_")
              //  print ("dossi \(tt) - count \(toTime.count)")
            }
        }
        
        return toTime
    }
    // краи 2_3_time_a_day

    func primDozze() -> String {
        var prinD        : String   = "0"
        var primDmax     : [String] = []
        for alo in stepI.filter({$0.contains("_prim")}) {
            if var prinD : String = alo {
                primDmax = prinD.components(separatedBy: "_")
                return primDmax[0]
            }
        }
        return prinD
    }
    
     
     func tootime() -> String {
           var mecho    : String     = "0"
           var mechoI   : [String]   = []
          for alo in stepI.filter({$0.contains("times_a_day")}) {
         if var  mecho : String = alo  {
           //  print("\(mecho)...")
             mechoI = mecho.components(separatedBy: "_")
           //  print("\(mechoI[0])")
            return mechoI[0]
           }
         }
         return mecho
     }
     
     func maxdosa() ->String {
         
         var arda : String = "0"
         var ardaI  : [String] = []
         
         for alo in stepI.filter({$0.contains("maxDD")}) {
             if var  arda: String = alo  {
               //  print("\(arda)...")
                 ardaI = arda.components(separatedBy: "_")
              //   print("\(ardaI[2])")
                 return ardaI[0]
               }
         }

         return arda
     }
    
    func kantarPazient() ->String {
        
        var arda : String = "0"
        var ardaI  : [String] = []
        
        for alo in stepI.filter({$0.contains("kantar")}) {
            if var  arda: String = alo  {
              //  print("\(arda)...")
                ardaI = arda.components(separatedBy: "_")
             //   print("\(ardaI[2])")
                return ardaI[0]
              }
        }

        return arda
    }
    
    func loadTit() -> String {
  
                     var tit    : String = "0"
                     var titTit : [String] = []
          for alo in stepI.filter({$0.contains("tit/tit")}) {
            if var tit : String = alo {
                titTit = tit.components(separatedBy: "_")
               // print("\(titTit[0]) ... tit")
                return titTit[0]
            }
        }
        return tit
    }
    
    func loadLday() -> String {
        var lday    : String = "0"
        var ldayDay : [String] = []
         for alo in stepI.filter({$0.contains("Lday")}) {
            if var lday : String = alo {
                
                ldayDay = lday.components(separatedBy: "_")
                return ldayDay[0]
                
            }
        }
        return lday
    }
    
    
    func update() {
        switch self.indexButton {
            case 0:
                       self.im[0] = 1
                       self.im[1] = 0
                       self.im[2] = 0
                       self.im[3] = 0
                       self.im[4] = 0
                       self.im[5] = 0
            case 1:
                       self.im[1] = 1
                       self.im[0] = 0
                       self.im[2] = 0
                       self.im[3] = 0
                       self.im[4] = 0
                       self.im[5] = 0
            case 2:
                        self.im[2] = 1
                        self.im[0] = 0
                        self.im[1] = 0
                        self.im[3] = 0
                        self.im[4] = 0
                        self.im[5] = 0
            case 3:
                       self.im[3] = 1
                       self.im[0] = 0
                       self.im[1] = 0
                       self.im[2] = 0
                       self.im[4] = 0
                       self.im[5] = 0
            case 4:
                       self.im[4] = 1
                       self.im[0] = 0
                       self.im[1] = 0
                       self.im[2] = 0
                       self.im[3] = 0
                       self.im[5] = 0
            case 5:
                                 self.im[5] = 1
                                 self.im[0] = 0
                                 self.im[1] = 0
                                 self.im[2] = 0
                                 self.im[3] = 0
                                 self.im[4] = 0
        default:
            print("")
        }
        
    }
}

struct Tab11SheetOnButtonSheet_Previews: PreviewProvider {
    static var previews: some View {
        Tab11SheetOnButtonSheet(isOnButton: Binding.constant(false), value: Binding.constant(40), detaill: "111", lek: "222", mjarka: "aa", grupa: "eee")
    }
}
//isOnButton: Binding.constant(false), value: Binding.constant(40), detaill: "111",lek: "22" , mjarka: "aa", grupa: "ee"
