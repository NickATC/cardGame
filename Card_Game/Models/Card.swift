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

class Card: Decodable, Identifiable, ObservableObject  {
    
    
}
