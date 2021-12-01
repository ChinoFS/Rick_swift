//
//  ImageView.swift
//  API_RICK
//
//  Created by intozoom on 11/29/21.
//

import SwiftUI
import Combine

struct ImageView: View {
    
    @State var image:UIImage = UIImage()
    @ObservedObject var imageLoader : ImageLoader
    
    var width : CGFloat
    var height : CGFloat
    var type : IntegerLiteralType
    
    init(withURL url: String, width: CGFloat, height: CGFloat, type: Int){
        imageLoader = ImageLoader(urlString: url)
        self.width = width
        self.height = height
        self.type = type
    }
    
    func imageFromData(data:Data) -> UIImage{
        UIImage(data: data) ?? UIImage()
    }
    
    var body: some View {
        VStack{
            if type == 1 {
                Image(uiImage: imageLoader.dataIsValid ? imageFromData(data: imageLoader.data!) : UIImage() )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.width, height: self.height)
            }else{
                Image(uiImage: imageLoader.dataIsValid ? imageFromData(data: imageLoader.data!) : UIImage() )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: self.width, height: self.height)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .shadow(radius: 10)
            }
        }.onReceive(imageLoader.didChange){ data in
            self.image = UIImage(data:data) ?? UIImage()
        }
    }
}

class ImageLoader : ObservableObject {
    
    @Published var dataIsValid = false
    var data:Data?
    var didChange = PassthroughSubject<Data, Never>()
    
    init(urlString:String){
        guard let url = URL(string:urlString) else {return}
        let task = URLSession.shared.dataTask(with: url){data,_,_ in
            guard let dataTask = data else {return}
            DispatchQueue.main.async {
                self.data = dataTask
                self.dataIsValid = true
            }
        }
        task.resume()
    }
}
