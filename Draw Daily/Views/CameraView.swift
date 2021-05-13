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
    
    @EnvironmentObject var settings: AppSettings
    @Environment(\.managedObjectContext) private var viewContext

    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    
    var body: some View {
        ZStack {
            
            VStack{
                Button(action: {self.showSheet = true}, label: {
                    Image(uiImage: image ?? UIImage(named: "placeholder")!)
                        .resizable()
                        .frame(width:300, height: 300)
                })
                
                if (image != nil) {// check to see if the image is present, other
                    Button(action: {saveImage()}) {
                        Text("Save Image")
                            .foregroundColor(Color.white)
                            .padding(20)
                            .background(Color.BackgroundColor)
                            .cornerRadius(10)
                    }
                    .padding(25)
                    
                }
                
                
            }.actionSheet(isPresented: $showSheet) {
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
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage){
                ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            }
            
        }
        .navigationTitle("Take a Picture")
        .navigationBarTitleDisplayMode(.inline)
        .padding(0)
        
    }
    
    // This function receives the captured image, and compresses the UIImage Data into a storable JPEG Format and saves it.
    // Using external storage, a reference is made of the image to save memory and improve performance of the application
    func saveImage () {
        print("saving to jpegData")
        
        
        let pickedImage = image?.jpegData(compressionQuality: 1.0)
        let drawing  = Drawing(context: viewContext)
        
        //Get Current Date
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy HH:mm"
        let formattedDate = format.string(from: date)
        
        drawing.img = pickedImage
        drawing.date = formattedDate
        print(pickedImage!)
        
        do {
        try viewContext.save()
        print("Image is saved")
        settings.started.self = false
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
