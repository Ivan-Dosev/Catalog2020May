//
//  Tab10CardCalculator.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 2.05.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct Tab10CardCalculator: View {
    
    let ageFormatter : NumberFormatter = {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .spellOut
        return numFormatter
        
    }()
    
    var titOTtit      : String
    var tit_tit :String {
       
                            arda(aaa: titOTtit)
      
    }
    var ldayOTlday    : String
    
    var dayOTfloat    : Float
    var dayDOfloat    : Float
    
    var kgOTfloat     : Float
    var kgDOfloat     : Float
    
    var timeOTfloat   : Float
    var timeDOfloat   : Float
    
    var fierstDozeFloat   : Float
    var maxDozeFloat      : Float
    
    var lek               : String
    var mjarka            : String
    var value             : Float
    var kantar            : Float
    
    var dayPrimDoze : Float {
                             dayDOfloat * fierstDozeFloat
    }
    var kgPrimDoze : Float {
                             kgDO * fierstDozeFloat
    }
    var kgOT : Float {
        if  maxDozeFloat != 0 {
            if kgOTfloat * value  > maxDozeFloat {
                            return maxDozeFloat
                        }else {
                            return   kgOTfloat * value
                        }
        }else {
                    return kgOTfloat * value
        }
      
    }
    var kgDO : Float {
        if maxDozeFloat != 0 {
            if kgDOfloat * value  > maxDozeFloat {
                     return maxDozeFloat
                 }else {
                     return   kgDOfloat * value
                 }
        }else {
                    return kgDOfloat * value
        }
     
    }
    
    @State var puls : Bool = false
    
    var body: some View {
      
         VStack {
             HStack {
                 Spacer()
                         if kgOTfloat != 0 && kgDOfloat != 0 {
                            if value <= kantar && kantar != 0 {
                                Text(" Weight  : \((self.value), specifier: "%.2f") kg ")
                                    .fontWeight(.bold)
                                    .padding()
                            }else {
                                if kantar != 0 {
                                    VStack {
                                        Text(" Weight  : \((self.value), specifier: "%.2f") kg ")
                                            .fontWeight(.bold)
                                            .padding(.top)
                                        Text("Max weight for this category is: \((self.kantar), specifier: "%.2f") kg ")
                                            .padding(.bottom)
                                            .foregroundColor(Color(.white))
                                            .scaleEffect(puls ? 1.5 : 1 )
                                            .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true))
                                            .onAppear(){
                                                self.puls.toggle()
                                             }
                                        
                                    }
                                }else {
                                    Text(" Weight  : \((self.value), specifier: "%.2f") kg ")
                                        .fontWeight(.bold)
                                        .padding()
                                }

                                
                            }

                                        

                         }else {
                           Text("Weight is not needed")
                              .fontWeight(.bold)
                              .padding()
                             
                           }
                 Spacer()
             }.background(Color.green)
            

    Spacer()
            VStack {
                ZStack {
                if titOTtit != "0" {
                    HStack {
                       

                            Spacer()
                            Text("\(self.tit_tit)")
                                .padding(.trailing, 10)
                                .offset(x: 0 , y: 5)
                        }
                        .padding()
                        .frame(maxWidth: .infinity )
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                        .background(Color.green.opacity(0.1))
                        .padding(5)
                    /*
                            Text("Dose        : ")
                               .fontWeight(.bold)
                               .foregroundColor(Color.white)
                               .multilineTextAlignment(.center)
                               .padding(.horizontal, 20)
                               .background(Color.green)
                               .clipShape(Capsule())
                               .offset(x: 0 , y: -25)
                    */

                    }
                }

               

                if dayOTfloat != 0 || dayDOfloat != 0 {
                    VStack {
                        if dayOTfloat == dayDOfloat {
                            if timeOTfloat == timeDOfloat {
                                VStack {
                                    
                                    ZStack {

                                        HStack {
                                            //"mg/day  : "

                                            Spacer()
                                            Text("\((self.dayDOfloat ), specifier: "%.0f") ")
                                               .foregroundColor(Color.green)
                                               .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                               .foregroundColor(Color.green)
                                               .padding(.trailing, 10)
                                               .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        
                                        Text("Dose per day: ")
                                                 .fontWeight(.bold)
                                                 .foregroundColor(Color.white)
                                                 .multilineTextAlignment(.center)
                                                 .padding(.horizontal, 20)
                                                 .background(Color.green)
                                                 .clipShape(Capsule())
                                                 .offset(x: 0 , y: -25)
                                        
                                    }
                                    ZStack {
                                        HStack {
                                            //"mg/day  : "

                                            Spacer()
                                            Text("\((self.dayDOfloat / timeDOfloat), specifier: "%.0f") ")
                                                .foregroundColor(Color.red)
                                                .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                            .padding(.trailing, 10)
                                            .foregroundColor(Color.red)
                                            .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                    //  Text("прием: ")
                                    //  Text("\((timeDOfloat)) doses of:")
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                        
                                    }
                                   
                                }
            // bez delene
                                
                                
                                
                            }else{
                                VStack{
                                    ZStack {
                                        HStack{

                                            Spacer()
                                            Text("\((self.dayDOfloat ), specifier: "%.0f") ")
                                               .foregroundColor(Color.green)
                                               .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                               .padding(.trailing, 10)
                                               .foregroundColor(Color.green)
                                               .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        Text("Dose per day: ")
                                             .fontWeight(.bold)
                                             .foregroundColor(Color.white)
                                             .multilineTextAlignment(.center)
                                             .padding(.horizontal, 20)
                                             .background(Color.green)
                                             .clipShape(Capsule())
                                             .offset(x: 0 , y: -25)
                                    }

                                    
                            //
                                    ZStack {
                                        HStack{

                                            Spacer()

                                            Text("\((self.dayDOfloat / timeOTfloat), specifier: "%.0f") ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                               .foregroundColor(Color.red)
                                               .padding(.trailing, 10)
                                               .offset(x: 0 , y: 5)

                                               
                                        }
                                           .padding()
                                           .frame(maxWidth: .infinity )
                                           .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                           .background(Color.green.opacity(0.1))
                                           .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeOTfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeOTfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                    ZStack {
                                        HStack{

                                            Spacer()

                                            Text("\((self.dayDOfloat / timeDOfloat), specifier: "%.0f") ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                               .foregroundColor(Color.red)
                                               .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)
                                         
                                              
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)

                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                }
                            }

                        }else {
                            if timeOTfloat == timeDOfloat {
                                VStack{
                                    ZStack {
                                        HStack {
                                            //"mg/day  : "

                                            Spacer()
                                            
                                            Text("\((self.dayOTfloat ), specifier: "%.0f") - ")
                                               .foregroundColor(Color.green)
                                               .offset(x: 0 , y: 5)
                                            Text("\((self.dayDOfloat ), specifier: "%.0f") ")
                                                .foregroundColor(Color.green)
                                                .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                                .foregroundColor(Color.green)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        Text("Dose per day: ")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .background(Color.green)
                                            .clipShape(Capsule())
                                            .offset(x: 0 , y: -25)
                                    }


                                    ZStack {
                                        HStack {
                                        //"mg/day  : "

                                        Spacer()

                                            Text("\((self.dayOTfloat / timeDOfloat), specifier: "%.0f") - ")
                                            .foregroundColor(Color.red)
                                             .offset(x: 0 , y: 5)
                                            Text("\((self.dayDOfloat / timeDOfloat), specifier: "%.0f") ")
                                            .foregroundColor(Color.red)
                                             .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                            .foregroundColor(Color.red)
                                            .padding(.trailing, 10)
                                             .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                }
                            }else{
                                VStack{
                                    ZStack {
                                        HStack {
                                        //"mg/day  : "

                                        Spacer()
                                        Text("\((self.dayOTfloat), specifier: "%.0f") - ")
                                            .foregroundColor(Color.green)
                                            .offset(x: 0 , y: 5)
                                        Text("\((self.dayDOfloat ), specifier: "%.0f") ")
                                               .foregroundColor(Color.green)
                                               .offset(x: 0 , y: 5)
                                        Text(" \(mjarka)")
                                            .foregroundColor(Color.green)
                                            .padding(.trailing, 10)
                                            .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        Text("Dose per day: ")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .background(Color.green)
                                            .clipShape(Capsule())
                                            .offset(x: 0 , y: -25)
                                    }

                                    

                                    ZStack {
                                        HStack {
                                        //"mg/day  : "

                                        Spacer()

                                        Text("\((self.dayOTfloat / timeOTfloat), specifier: "%.0f") - ")
                                            .foregroundColor(Color.red)
                                             .offset(x: 0 , y: 5)
                                        Text("\((self.dayDOfloat / timeOTfloat), specifier: "%.0f") ")
                                            .foregroundColor(Color.red)
                                             .offset(x: 0 , y: 5)
                                        Text(" \(mjarka)")
                                            .foregroundColor(Color.red)
                                            .padding(.trailing, 10)
                                             .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeOTfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeOTfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                    

                                    ZStack {
                                        HStack {
                                        //"mg/day  : "

                                        Spacer()

                                            Text("\((self.dayOTfloat / timeDOfloat), specifier: "%.0f") - ")
                                                .foregroundColor(Color.red)
                                                .offset(x: 0 , y: 5)
                                            Text("\((self.dayDOfloat / timeDOfloat), specifier: "%.0f") ")
                                                .foregroundColor(Color.red)
                                                .offset(x: 0 , y: 5)
                                            Text(" \(mjarka)")
                                                .foregroundColor(Color.red)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!) ")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose  of:" : "doses  of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                        
                                    }

                                    }
                            }
                            

                        }
                    }
                }

                if kgOT != 0 || kgDO != 0 {
                    HStack {
                        if kgOT == kgDO {
                             if timeOTfloat == timeDOfloat {
                                VStack {
                                    ZStack {
                                        HStack{

                            // "mg/kg  : "

                                            Spacer()
                                            Text("\((self.kgDO ), specifier: "%.0f") ")
                                            .foregroundColor(Color.green)
                                            .offset(x: 0 , y: 5)

                                            Text(" \(mjarka) ")
                                            .foregroundColor(Color.red)
                                            .padding(.trailing, 10)
                                            .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        Text("Dose per day: ")
                                             .fontWeight(.bold)
                                             .foregroundColor(Color.white)
                                             .multilineTextAlignment(.center)
                                             .padding(.horizontal, 20)
                                             .background(Color.green)
                                             .clipShape(Capsule())
                                             .offset(x: 0 , y: -25)
                                    }
                                


                                    ZStack {
                                        HStack{
                                            // "mg/kg  : "

                                            Spacer()

                                            Text("\((self.kgDO / timeDOfloat), specifier: "%.0f") ")
                                             //  .fontWeight(.bold)
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text(" \(mjarka) ")
                                             //  .fontWeight(.bold)
                                               .foregroundColor(Color.red)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                }
                             }else{
                                VStack{

                                    ZStack {
                                                 HStack{
                                        // "mg/kg  : "

                                                    Spacer()
                                                    Text("\((self.kgDO ), specifier: "%.0f") ")
                                                        .foregroundColor(Color.green)
                                                        .offset(x: 0 , y: 5)

                                                                                                      
                                                    Text(" \(mjarka) ")
                                                        .foregroundColor(Color.green)
                                                        .padding(.trailing, 10)
                                                        .offset(x: 0 , y: 5)

                                                }
                                                 .padding()
                                                 .frame(maxWidth: .infinity )
                                                 .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                                 .background(Color.green.opacity(0.1))
                                                 .padding(5)
                                                 Text("Dose per day: ")
                                                     .fontWeight(.bold)
                                                     .foregroundColor(Color.white)
                                                     .multilineTextAlignment(.center)
                                                     .padding(.horizontal, 20)
                                                     .background(Color.green)
                                                     .clipShape(Capsule())
                                                     .offset(x: 0 , y: -25)
                                    }

                                    

                                    ZStack {
                                        HStack{
                                        // "mg/kg  : "

                                        Spacer()

                                        Text("\((self.kgDO / timeOTfloat), specifier: "%.0f") ")
                                            .foregroundColor(Color.red)
                                            .offset(x: 0 , y: 5)
                                                                           
                                        Text(" \(mjarka) ")
                                            .foregroundColor(Color.red)
                                            .padding(.trailing, 10)
                                            .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeOTfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeOTfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                    //   ..........................
                                    ZStack {
                                        HStack{
                                        // "mg/kg  : "

                                        Spacer()

                                        Text("\((self.kgDO / timeDOfloat), specifier: "%.0f") ")
                                            .foregroundColor(Color.red)
                                            .offset(x: 0 , y: 5)
                                                                           
                                        Text(" \(mjarka) ")
                                            .foregroundColor(Color.red)
                                            .padding(.trailing, 10)
                                            .offset(x: 0 , y: 5)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                }
                                
                            }

                        }else {
                             if timeOTfloat == timeDOfloat {
                                VStack {
                                    ZStack {
                                        HStack{
                                                                      // "mg/kg  : "

                                            Spacer()
                                            Text("\((self.kgOT ), specifier: "%.0f") - ")
                                                .foregroundColor(Color.green)
                                                .offset(x: 0 , y: 5)
                                                                      
                                            Text("\((self.kgDO ), specifier: "%.0f") ")
                                                .foregroundColor(Color.green)
                                                .offset(x: 0 , y: 5)
                                                                      
                                            Text(" \(mjarka) ")
                                                .foregroundColor(Color.green)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)

                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        Text("Dose per day: ")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .background(Color.green)
                                            .clipShape(Capsule())
                                            .offset(x: 0 , y: -25)
                                    }


                                    ZStack {
                                        HStack{
                                            // "mg/kg  : "

                                            Spacer()

                                            Text("\((self.kgOT / timeDOfloat), specifier: "%.0f") - ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text("\((self.kgDO / timeDOfloat), specifier: "%.0f") ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text(" \(mjarka) ")
                                                .foregroundColor(Color.red)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)

                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                }
                             }else{
                                VStack{

                                    ZStack {
                                        HStack{
                                            // "mg/kg  : "

                                            Spacer()
                                            Text("\((self.kgOT ), specifier: "%.0f") - ")
                                               .foregroundColor(Color.green)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text("\((self.kgDO ), specifier: "%.0f") ")
                                               .foregroundColor(Color.green)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text(" \(mjarka) ")
                                                .foregroundColor(Color.green)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)

                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        Text("Dose per day: ")
                                            .fontWeight(.bold)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .background(Color.green)
                                            .clipShape(Capsule())
                                            .offset(x: 0 , y: -25)
                                    }

                                    

                                    ZStack {
                                        HStack{
                                            // "mg/kg  : "

                                            Spacer()

                                            Text("\((self.kgOT / timeOTfloat), specifier: "%.0f") - ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text("\((self.kgDO / timeOTfloat), specifier: "%.0f") ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text(" \(mjarka) ")
                                                .foregroundColor(Color.red)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)

                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeOTfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeOTfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                
                                    

                                    ZStack {
                                        HStack{
                                            // "mg/kg  : "

                                            Spacer()

                                            Text("\((self.kgOT / timeDOfloat), specifier: "%.0f") - ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text("\((self.kgDO / timeDOfloat), specifier: "%.0f") ")
                                               .foregroundColor(Color.red)
                                               .offset(x: 0 , y: 5)
                                            
                                            Text(" \(mjarka) ")
                                                .foregroundColor(Color.red)
                                                .padding(.trailing, 10)
                                                .offset(x: 0 , y: 5)

                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity )
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                                        .background(Color.green.opacity(0.1))
                                        .padding(5)
                                        HStack  {
                                           Text("\(ageFormatter.string(from: NSNumber(value: self.timeDOfloat))!)")
                                            .fontWeight(.bold)
                                          
                                            Text(timeDOfloat == 1 ? "dose of:" : "doses of:")
                                            .fontWeight(.bold)
                                            
                                        }  .padding(.horizontal, 20)
                                           .foregroundColor(Color.white)
                                           .background(Color.green)
                                           .clipShape(Capsule())
                                           .offset(x: 0 , y: -25)
                                    }

                                }
                                
                            }

                        }
                    }
                }

                if timeOTfloat != 0 || timeDOfloat != 0 {
                    VStack {
                        if timeOTfloat == timeDOfloat {
                            HStack{
                                Text("Number of doses per day  : ")
                                     .padding(.leading, 10)
                                Spacer()
                                Text("\((self.timeDOfloat), specifier: "%.0f") ")
                                     // .fontWeight(.bold)
                                      .foregroundColor(Color.red)
                                      .padding(.trailing, 10)
                            }
                            

                            
                        }else {
                            HStack{
                                Text("Number of doses per day  : ")
                                     .padding(.leading, 10)
                                Spacer()
                                Text("\((self.timeOTfloat), specifier: "%.0f")  -")
                                     // .fontWeight(.bold)
                                      .foregroundColor(Color.red)
                                     
                                Text("\((self.timeDOfloat), specifier: "%.0f") ")
                                    //  .fontWeight(.bold)
                                      .foregroundColor(Color.red)
                                      .padding(.trailing, 10)
                            }

                        }

                    }
                }
                HStack {
                                   if ldayOTlday == "1000" {
                                       Text("Days of treatment: ")
                                           .padding(.leading, 10)
                                       Spacer()
                                       Text("Consult your doctor ")
                                          // .fontWeight(.bold)
                                           .foregroundColor(Color.red)
                                           .padding(.trailing, 10)
                                    
                                   }else{
                                       Text("Days of treatment: ")
                                            .padding(.leading, 10)
                                       Spacer()
                                       Text("\(self.ldayOTlday) ")
                                           //.fontWeight(.bold)
                                           .foregroundColor(Color.red)
                                           .padding(.trailing, 10)
                                   }

                               }
       Spacer()
                HStack{
                    if dayPrimDoze != 0 {
                        Text("First dose : ")
                        Text(" \((dayPrimDoze), specifier: "%.0f")")
                        Text(" \(mjarka)")
                    }
                }.foregroundColor(Color.red)
                HStack{
                    if kgPrimDoze != 0 {
                        Text("First dose : ")
                        Text(" \((kgPrimDoze), specifier: "%.0f")")
                        Text(" \(mjarka)")
                    }
                }.foregroundColor(Color.red)
                if maxDozeFloat != 0 {
                    HStack {
                        Spacer()
                        Text("Max dose : \((maxDozeFloat ), specifier: "%.0f") ")
                        Text(" \(mjarka)")
                        Spacer()
                    }.foregroundColor(Color.red)
                }
               
            }
           
             Divider()
            Text("\(self.lek)")
             .padding()
         }
         .frame(width: UIScreen.main.bounds.width - 20, height: 500)
         .background(Color.white)
         .cornerRadius(25)
       
    }
    
    
    func arda(aaa : String) -> String {
        var mecho = aaa.components(separatedBy: "-")
        var olo = ""
        for i in mecho {
            olo.append(contentsOf: i)
            olo.append(contentsOf: " ")
        }
        
        
        return olo
    }
    
}

struct Tab10CardCalculator_Previews: PreviewProvider {
    static var previews: some View {
        Tab10CardCalculator(titOTtit: "tit", ldayOTlday: "lday", dayOTfloat: 0, dayDOfloat: 0, kgOTfloat: 0, kgDOfloat: 0, timeOTfloat: 0, timeDOfloat: 0, fierstDozeFloat: 0, maxDozeFloat: 0, lek: "lek", mjarka: "mek", value: 1, kantar: 0  )
    }
}
/*
 ZStack {

                VStack {
                    Text("Dossi nnnnnn Dimitrov")

                }
                .padding()
                .frame(maxWidth: .infinity - 20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                .background(Color.green.opacity(0.3))
                .padding(20)
                
                VStack {
                    Text("Variant I          (3  na den *)")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        
                        .padding(.horizontal, 20)
                        .background(Color.green)
                        .clipShape(Capsule())
                       
                    .offset(x: 0 , y: -25)
                }

            }
 */
