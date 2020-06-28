//
//  Tab10Sheet.swift
//  CatallogGreenView
//
//  Created by Ivan Dosev Dimitrov on 18.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI


struct Tab10Sheet: View {
    
    var opis          : String
    var lek           : String
    var mjarka        : String
    var grupa         : String
    
    @State          var txt        : String    = ""
    @Binding        var isShow     : Bool
    
      var word          : [String] {
                                      self.opis.components(separatedBy: "?")
                                   }
    
     
      @State var indexButton : Int = 0
      @State var isOnButton  : Bool = false
    
      private let data: [[String]] = [
      Array(arrayLiteral: "0","20","40","60","80","100","120","140","160").map { "\($0)" },
      Array(0...20).map { "\($0)" },
      Array(arrayLiteral:"0.00","0.10","0.20","0.30","0.40","0.50","0.60","0.70","0.80","0.90","1.00").map { "\($0)" }
      ]

      @State private var selections: [Int] = [2, 0, 0]
      @State var stoKilo : Float = 40
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {_ in
            self.stoKilo = Float(self.data[0][self.selections[0]] )! + Float(self.data[1][self.selections[1]] )! + Float(self.data[2][self.selections[2]] )!
        }
    }
    
/*
      var stoKilo : Float {
      Float(data[0][selections[0]] )! + Float(data[1][selections[1]] )! + Float(data[2][selections[2]] )!
        
       }
*/
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.isShow = false
                    
                }) {
                    Text("⏎")
                    .padding(.top)
                    .foregroundColor(.white)
                }
               
                   
                    
                Spacer()
                Button(action: {
                                
                            }) {
                                Text(" ")
                                .padding(.top)
                                .foregroundColor(.white)
                            }
            }.padding()
            .background(Color("greenCatallog"))
            Spacer()
            VStack {
                HStack {
                         Spacer()
                    Text("\(lek)")
                        .fontWeight(.bold)
                        
                        .padding()
                         Spacer()
                }
                 .background(Color.green)
                 .foregroundColor(Color.white)

                List  {

                     ForEach (0..<word.count) { item in
                       
                        Tab10SheetOnButton(txt: self.word[item] , isOnButton: self.$isOnButton)
                            .sheet(isPresented: self.$isOnButton ,content: {Tab11SheetOnButtonSheet(isOnButton: self.$isOnButton , value: self.$stoKilo , detaill: self.word[item] , lek: self.lek , mjarka: self.mjarka , grupa: self.grupa)})
                        
                     }
                    
                }
            }.frame(width: UIScreen.main.bounds.width / 1.1)
             .background(Color.white)
             .cornerRadius(20)
            
         Spacer()
                VStack {
                    HStack {
                        Text("Patient weight ")
                            .padding(.leading, 20)
                        Spacer()
                        Text("\(self.stoKilo , specifier: "%.2f" )")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .onAppear() {
                                  self.stoKilo = Float(self.data[0][self.selections[0]] )! + Float(self.data[1][self.selections[1]] )! + Float(self.data[2][self.selections[2]] )!
                        }
                        Spacer()
                        Text("kg.")
                            .padding(.trailing, 20)
                    }.background(Color.green)
                    .foregroundColor(Color.white)
                      
                    ZStack {
                        VStack {
                            PickerView(data: self.data, selections: self.$selections)
                            .font(.system(size: 10 ))
                            .onAppear(){
                                self.timer
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width / 1.1 )
                .font(.system(size: 14 ))
                .background(Color.white)
                .cornerRadius(20)
               
            

                              
        }.background(Color("greenCatallog").opacity(0.1))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct Tab10Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Tab10Sheet(opis: "11" , lek: "22" , mjarka: "33",grupa: "44", isShow: Binding.constant(false))
    }
}
struct PickerView: UIViewRepresentable {
    var data: [[String]]
    @Binding var selections: [Int]

    //makeCoordinator()
    func makeCoordinator() -> PickerView.Coordinator {
        Coordinator(self)
    }

    //makeUIView(context:)
    func makeUIView(context: UIViewRepresentableContext<PickerView>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)
        
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        
        return picker
    }

    //updateUIView(_:context:)
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<PickerView>) {
        for i in 0...(self.selections.count - 1) {
            view.selectRow(self.selections[i], inComponent: i, animated: false)
        }
    }

    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: PickerView

        //init(_:)
        init(_ pickerView: PickerView) {
            self.parent = pickerView
        }

        //numberOfComponents(in:)
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return self.parent.data.count
        }

        //pickerView(_:numberOfRowsInComponent:)
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.data[component].count
        }

        //pickerView(_:titleForRow:forComponent:)
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.parent.data[component][row]
        }

        //pickerView(_:didSelectRow:inComponent:)
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selections[component] = row
        }
    }
}
