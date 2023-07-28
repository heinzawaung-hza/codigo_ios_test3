//
//  HomeViewModel.swift
//  CodeTest3
//
//  Created by Hein Aung on 28/07/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var images: [String] = ["image1","image2","image3","image4","image5"]
    @Published var rooms : [Room] = [
        Room(image: "image1", title: "Room Type 1", description: Constant.rawText),
        Room(image: "image2", title: "Room Type 2", description: Constant.rawText),
        Room(image: "image3", title: "Room Type 3", description: Constant.rawText),
        Room(image: "image4", title: "Room Type 4", description: Constant.rawText),
        Room(image: "image5", title: "Room Type 5", description: Constant.rawText)
    ]
}

struct Room: Codable, Hashable {
    let image: String
    let title: String
    let description: String
}
