//
//  SketchbookView.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import Foundation
import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct SketchbookView: View {
    

    @EnvironmentObject var searchObjectController: SearchObjectController
//
//    @FetchRequest(entity: Drawing.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Drawing.img, ascending: true)])
//
//    var orders: FetchedResults<Drawing>
//
//
//
    @State var showOrderSheet = false
    
    init() {
            UINavigationBar.appearance().backgroundColor = UIColor(red: 115 / 255, green: 93 / 255, blue: 120 / 255, alpha: 1)

            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        //print(orders)
        }
    
    @FetchRequest(entity: Drawing.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \Drawing.date, ascending: true)
                  ]
    )
    var orders: FetchedResults<Drawing>
    
    var body: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: 80)),
            GridItem(.adaptive(minimum: 80))
        ]
    
                    
        NavigationView {
            List {
                HStack {
                    Spacer()
                    Text("Sketches so far: 3")
                        .fontWeight(.bold)
                        .padding(6)
                    Spacer()
                }
                LazyVGrid(columns: columns)  {

                                
                                    ForEach(orders, id: \.self, content: { drawing in
                                        Image(uiImage: UIImage(data: drawing.img!)!)
                                        Text(drawing.date ?? "Unknown")
                                        
                                    })
                                
//                    Image("placeholder")
//                            .resizable()
//                            .frame(height: 100)
//                    Image("placeholder")
//                            .resizable()
//                            .frame(height: 100)
//                    Image("placeholder")
//                        .resizable()
//                        .frame(height: 100)
//                    Image("placeholder")
//                        .resizable()
//                        .frame(height: 100)
//                    Image("placeholder")
//                            .resizable()
//                            .frame(height: 100)
//                    Image("placeholder")
//                            .resizable()
//                            .frame(height: 100)
//                    Image("placeholder")
//                        .resizable()
//                        .frame(height: 100)
//                    Image("placeholder")
//                        .resizable()
//                        .frame(height: 100)
                    
                }
                
            }.navigationBarTitle("SketchBook")
        }
    }
}

struct SketchbookView_Previews: PreviewProvider {
    static var previews: some View {
        SketchbookView()
    }
}

