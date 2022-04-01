//
//  Card.swift
//  Card_Game
//
//  Created by NICOLAS  TAUTIVA on 1/04/22.
//

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





// CardStraw JSON format
//{
//  "success": true,
//  "deck_id": "do7su94ag74p",
//  "cards": [
//    {
//      "code": "4S",
//      "image": "https://deckofcardsapi.com/static/img/4S.png",
//      "images": {
//        "svg": "https://deckofcardsapi.com/static/img/4S.svg",
//        "png": "https://deckofcardsapi.com/static/img/4S.png"
//      },
//      "value": "4",
//      "suit": "SPADES"
//    }
//  ],
//  "remaining": 51
//}
