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

    
    init() {
            UINavigationBar.appearance().backgroundColor = UIColor(red: 115 / 255, green: 93 / 255, blue: 120 / 255, alpha: 1)

            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        //print(orders)
        }
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Drawing.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \Drawing.date, ascending: false)
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
                    Text("Sketches so far: \(orders.count)")
                        .fontWeight(.bold)
                        .padding(6)
                    Spacer()
                }
                ScrollView {
                    LazyVGrid(columns: columns)  {

                        ForEach(orders, id: \.self) { drawing in
                            
                            VStack{
                                NavigationLink(destination: ImageView(image: drawing.img, name: drawing.date!, date: drawing.date!)) {
                                
                                Image(uiImage: UIImage(data: drawing.img!)!)
                                .resizable()
                                .frame(height: 200)
                                .overlay(
                                    VStack {
                                        Text(drawing.date ?? "Unknown")
                                            .padding(5)
                                            .foregroundColor(Color.textColor)
                                    }
                                    .background(Color.white)
                                    .padding(5)
                                    , alignment: .bottom)
                                }
                            }
                            .border(Color.gray, width: 1)
                        }
                        
                 
                    }
                }
                
            }.toolbar {
                EditButton()
            }
            
            .navigationBarTitle("SketchBook")
        }
    }
}

struct SketchbookView_Previews: PreviewProvider {
    static var previews: some View {
        SketchbookView()
    }
}

