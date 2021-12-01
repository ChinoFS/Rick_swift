import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}

struct ProductCard: View {
    
    var image: String
    var title: String
    var status: String
    var species: String
    var gender: String
    var origin: OriginDAO
    var location: LocationDAO
    var episode: [String]
    
    var body: some View {
        NavigationLink(destination: DetailCharacterView( image: image, title: title, status: status, species: species, gender: gender, origin: origin, location: location, episode: episode)){
            HStack(alignment: .center) {
                VStack{
                    ImageView(withURL: "\(image)", width: 50, height: 50, type: 1)
                }
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }.padding(.trailing, 20)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(red: 32/255, green: 36/255, blue: 38/255))
            .modifier(CardModifier())
            .padding(.all, 10)
        }
        }
}
