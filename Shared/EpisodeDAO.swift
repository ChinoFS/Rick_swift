import SwiftUI

struct EpisodeDAO: Codable{
    var results : [Results]
}

struct Results : Codable, Identifiable{
    var id :  Int32
    var name : String
}
