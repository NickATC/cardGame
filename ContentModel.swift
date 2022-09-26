//
//  ContentModel.swift
//  Card_Game
//
//  Created by NICOLAS  TAUTIVA on 1/04/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @EnvironmentObject var model: ContentModel

    @Published var remainingCards: Int?
    
    @Published var deckOfCards: DeckOfCards?
    @Published var cardDraw: CardDraw?
    
    
    func createNewDeck(){
        //Creates a new deck using a new API call
    
        //Steps to follow:
        //Create URL
        //Create URL request
        //Get URL session
        //Create dataTask
        //Start the DataTask
     
        //Create URL
        let urlString = "\(Constants.apiUrl)new/shuffle/?deck_count=1"
        let url = URL(string: urlString)
  
        if let url = url {
            //Create URL request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"

            //Get URL session
            let session = URLSession.shared
            
            //Create dataTask
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                //Check that there isn't an error
                if error == nil {
                    //print(response!)
                    
                    do{
                    //Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(DeckOfCards.self, from: data!)

                        DispatchQueue.main.async {
                            //Assign to the appropriate property
                            self.deckOfCards = result
                            
                            //Assign card remainingCards value
                            self.remainingCards = result.remaining
                        }
                 }
                    catch {
                        print(error)
                    }
                }
            }
            
            //Start the DataTask
            dataTask.resume()
        }
    }
    
    func drawCard(cardDeckId: String){
        //Draws a card from the API using the deckId
        
        //Steps to follow:
        //Create URL
        //Create URL request
        //Get URL session
        //Create dataTask
        //Start the DataTask
                
        //Create URL
        let urlString = "\(Constants.apiUrl)\(cardDeckId)/draw/?count=1"
        let url = URL(string: urlString)
  
        if let url = url {
            //Create URL request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"

            //Get URL session
            let session = URLSession.shared
            
            //Create dataTask
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                //Check that there isn't an error
                if error == nil {
                    //print(response!)
                    
                    do{
                    //Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CardDraw.self, from: data!)

                        DispatchQueue.main.async {
                            //Assign to the appropriate property
                            self.cardDraw = result
                            
                            //Assign card remainingCards value
                            self.remainingCards = result.remaining
                        }
                 }
                    catch {
                        print(error)
                    }
                }
            }
            
            //Start the DataTask
            dataTask.resume()

        }
    }
    
    func describeCard() -> String {
        //A function to make a valid description in text of the card.
        var cardDescription = ""
        
        if remainingCards == nil {
            cardDescription = ""
        } else if remainingCards! == 52 {
            cardDescription = ""
        } else {
            cardDescription = "\(cardDraw?.cards?[0].value! ?? "no value") of \(cardDraw?.cards?[0].suit! ?? "no suit")"
        }
        
     return cardDescription
    }
    
    
}
