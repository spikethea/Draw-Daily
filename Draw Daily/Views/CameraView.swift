//
//  CameraView.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_image: UIImage,
                         didFinishWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished")
    }
}

struct CameraView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        ZStack {
            
            VStack{
                Button(action: saveImage, label: {
                    Text("Save Image")
                }).foregroundColor(.black)
                Image(uiImage: image ?? UIImage(named: "placeholder")!)
                    .resizable()
                    .frame(width:300, height: 300)
                
                Button("Choose Picture") {
                    self.showSheet = true
                    
                }.foregroundColor(.black)
                .padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select Photo"),
                        message: Text("Choose"),
                        buttons:[
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Camera")) {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            },
                            .cancel()
                        ]
                    )
                }
                
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            }
            
        }
        .navigationTitle("Take a Picture")
        .navigationBarTitleDisplayMode(.inline)
        .padding(0)
        
    }
    
    
    func saveImage () {
        print("saving to jpegData")
        
        //guard let savingImage = image else {return}
        //let imageSaver = ImageSaver()
        //imageSaver.writeToPhotoAlbum(image: savingImage)
        let pickedImage = image?.jpegData(compressionQuality: 1.0)
        let drawing  = Drawing(context: viewContext)
        
        //Get Current Date
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = format.string(from: date)
        
        drawing.img = pickedImage
        drawing.date = formattedDate
        print(pickedImage!)
        
        do {
        try viewContext.save()
        print("Image is saved")
        } catch {
        print(error.localizedDescription)

        }
        
        
    }
    
    func loadImage() {
        //guard let savingImage = image else {return}
        
        //let imageSaver = ImageSaver()
        //imageSaver.writeToPhotoAlbum(image: savingImage)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
