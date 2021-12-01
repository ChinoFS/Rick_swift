import SwiftUI

struct CharacterDAO: Codable{
    var results : [Results]
}

struct Results : Codable, Identifiable{
    var id :  Int32
    var name : String
    var status : String
    var species : String
    var gender : String
    var image : String
    var origin : OriginDAO
    var location : LocationDAO
    var episode: [String]
}
