import SwiftUI

struct Character: View{
    @State var listCharacter = [Results]()
    var body: some View{
        NavigationView{
            
            HStack {
               Spacer()
             }
            
            List(listCharacter){ character in
                ProductCard(image: character.image, title: character.name, status: character.status, species: character.species, gender: character.gender, origin: character.origin, location: character.location, episode: character.episode)
            }.onAppear(perform: getAllPopular)
                .navigationTitle("Rick & Morty Characters")
            Spacer()
        }
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
    }
    
    func getAllPopular(){
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "https://rickandmortyapi.com/api/character")!)
        {(data,_,_) in
            do{
                let characters = try JSONDecoder().decode(CharacterDAO.self, from: data!)
                DispatchQueue.main.async{
                    self.listCharacter = characters.results
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct Character_Previews: PreviewProvider{
    static var previews: some View{
        Character()
    }
}
