//
//  ContentView.swift
//  Card_Game
//
//  Created by NICOLAS  TAUTIVA on 1/04/22.
//

import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var model: ContentModel
    var stat: String = ""

    
    var body: some View {
        //
        ZStack {
            //Background image
            Image("newbackground")
                .resizable()
                .clipped()
                .ignoresSafeArea()
                
            //Items will appear here!
            VStack {
                Text("Welcome to Card Game!")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                
                Button {
                    //API call
                    model.createNewDeck()
                    
                    //print(model.deckOfCards!)
                } label: {
                    Text("Get new deck of cards")
                }
                .padding()
                .background()
                .cornerRadius(10)
                .foregroundColor(.black)

                //Card status indicators
                GroupBox  {
                
                    Text("Deck Status: \(model.deckOfCards?.deck_id ?? "noid")")
                        .font(.footnote)
                    Text("      Available Cards:   \(model.deckOfCards?.remaining ?? 0)")
                        .font(.footnote)
                } label: {
                    Text("Deck card status:")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                //.padding(.horizontal)
                .frame(width: 200)

                
                
                //Image and button will only appear when there is a valid card deck.
                
                VStack{
                    //Actual card Image here!
                    Image("newbackground")
                        .resizable()
                        .frame(width: 150, height: 250)
                        .padding()
                    
                    //Button for a new card!
                    
                    
                    Button {
                        //API call for a new card!
                        
                    } label: {
                        Text("Get new card!")
                    }
                    .padding()
                    .background()
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    
                }
                            
                
            }
        }
        //
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
