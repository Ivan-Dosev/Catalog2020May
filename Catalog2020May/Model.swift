//
//  Model.swift
//  Catalog2020May
//
//  Created by Ivan Dosev Dimitrov on 29.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//


import Foundation
import SwiftUI
import Combine

struct Lecarstvo200: Identifiable, Codable {
    
      var id          : Int
      var lekarstvo   : String
      var isOnLek     : Bool
      var risk        : String
      var proper      : String
      var dosage      : String
      var careful     : String
      var effects     : String
}



struct Lecarstvo100: Identifiable, Codable {
    
    var id: Int
    var nameLecarstvo : String
    var nameFirma     : String
    var vidove        : String
    var optinal      : String
//      optinal
}


struct Lecarstvo: Identifiable, Codable {
    
    var id: Int
    var kgPazient : Int       // килограми на пациента
    var goPazient : Int       // години на пациента
    var fromMin   : CGFloat        // диапазон ОТ в долната граница   ...  или килограми ..  или гогини на пациент
    var toMin     : CGFloat        // диапазон ДО в долната граница
    var fromMax   : CGFloat        // диапазон ОТ в горната граница граница   ...  или килограми ..  или гогини на пациент
    var toMax     : CGFloat        // диапазон ДО в горната граница
    var isMin     : Bool      //  ако е истина не се използва калкулатора
    var isMax     : Bool      //  ако е истина не се използва калкулатора
    var mjarka    : String    // мерна единица на лекарството
    var maxDoza   : CGFloat         // максимална диза изчислената стоиност нетрябва да е повече от максимална
    var firstDoza : CGFloat         // първа доза  първи ден на прием
    var priemI    : Int       // начин на прием на лекарството вариант първи
    var priemII   : Int       // начин на прием на лекарството вариант втори
    var opis      : String    // описание на приема в текст когато неможе да се калкулира
    var lekarstvo : String    // име на лекарството
    var grupa     : String    //  група на лекарството
    
    
}


class Recarstvo: ObservableObject {
    
     @Published var database200 = [Lecarstvo200]()

    
    init( ) { loadOpis() }
    
    func loadOpis(){
       
          guard let url = URL(string: "http://biobeehive.com/CatalogRisk.json") else {return}

        URLSession.shared.dataTask(with: url ) { (data,_,_) in
            guard let data = data else {return}

            let pokemon200 = try! JSONDecoder().decode([Lecarstvo200].self, from: data)
            
            DispatchQueue.main.async {
                self.database200  = pokemon200
             //   print("poleka ..\(self.database100.count)....")
            }
        }.resume()
        
    }
    
}



class Rodel: ObservableObject {
    
     @Published var database100 = [Lecarstvo100]()

    
    init( ) { loadFirms()
        
    }
    
    func loadFirms(){
       
          guard let url = URL(string: "http://biobeehive.com/CatalgFirms.json") else {return}

        URLSession.shared.dataTask(with: url ) { (data,_,_) in
            guard let data = data else {return}

            let pokemon100 = try! JSONDecoder().decode([Lecarstvo100].self, from: data)
            
            DispatchQueue.main.async {
                self.database100  = pokemon100
             //   print("poleka ..\(self.database100.count)....")
            }
        }.resume()
        
    }
    
}


class Model: ObservableObject {
    
    @Published var database    = [Lecarstvo]()

    
    init()  { loadFromJSON()  }
    
     func loadFromJSON(){
        
           guard let url = URL(string: "http://biobeehive.com/CatalogLecarstvo.json") else {return}

         URLSession.shared.dataTask(with: url ) { (data,_,_) in
             guard let data = data else {return}
        
             let pokemon = try! JSONDecoder().decode([Lecarstvo].self, from: data)
             
             DispatchQueue.main.async {
                 self.database  = pokemon
              //   print("poleka ..\(self.database.count)....")
             }
         }.resume()
         
     }


}
