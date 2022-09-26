//
//  Card.swift
//  Card_Game
//
//  Created by NICOLAS  TAUTIVA on 1/04/22.
//


//For more info on how the JSON format comes, see https://www.deckofcardsapi.com/

import Foundation

class DeckOfCards: Decodable, Identifiable, ObservableObject {
    
    var success: Bool?
    var deck_id: String?
    var shuffled: Bool?
    var remaining: Int?
}



class CardDraw: Decodable, Identifiable, ObservableObject  {
    var success: Bool?
    var deck_id: String?
    var cards: [Card]?
    var remaining: Int?
}




class Card: Decodable, Identifiable, ObservableObject {
    var code: String?
    var image: String?
    var images: ImageSvgPng?
    var value: String?
    var suit: String?
}




class ImageSvgPng: Decodable, Identifiable, ObservableObject {
    var svg: String?
    var png: String?
}
