import SwiftUI

struct DetailCharacterView: View {
    
    var image: String
    var title: String
    var status: String
    var species: String
    var gender: String
    var origin: OriginDAO
    var location: LocationDAO
    var episode: [String]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
               Spacer()
             }
            
            Text("\(title)")
                .font(.system(size: 36, weight: .bold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
            ImageView(withURL: image, width: .infinity, height: .infinity, type: 1)
            
            Text("\(origin.name)")
                .font(.system(size: 36, weight: .bold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Text("\(location.name)")
                .font(.system(size: 36, weight: .bold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
            
            LazyVGrid (columns: columns, spacing: 30){
            
                    Text("\(status)")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(15)
                        .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.green, lineWidth: 2)
                            ).background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
                
                    Text("\(species)")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(15)
                        .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.green, lineWidth: 2)
                            ).background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
                
                    Text("\(gender)")
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(15)
                        .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.green, lineWidth: 2)
                            ).background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
            }
            
            Text("Episodes")
                .font(.system(size: 36, weight: .bold, design: .default))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
        
            Spacer()
        }
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
    }
}
