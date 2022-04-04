//
//  ContentView.swift
//  Card_Game
//
//  Created by NICOLAS  TAUTIVA on 1/04/22.
//

import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var model: ContentModel
    var isNewDeck: Bool {
        return ((model.deckOfCards?.remaining ?? 0) == 52) ? true : false
    }
    
    var statusText: String {
        return model.deckOfCards?.success! ?? false ? "Valid deck loaded!" : "No cards available"
    }

    
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
                    
                } label: {
                    Text("Get new deck of cards")
                }
                .padding()
                .background()
                .cornerRadius(10)
                .foregroundColor(.black)

                //Card status indicators
                GroupBox  {
                
                    Text(statusText)
                        .font(.footnote)
                    Text("Available Cards:   \(model.remainingCards ?? 0)")
                        .font(.footnote)
                } label: {
                    Text("Deck card information:")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                //.padding(.horizontal)
                .frame(width: 200)

                
                
                //Image and button will only appear when there is a valid card deck.
                VStack{
           
                    //Actual card Image here!
                    
                    //TODO: When GET NEW DECK OF CARDS, old card is still showing!
                    AsyncImage(url: URL(string: model.cardDraw?.cards?[0].image! ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.white
                    }
                    .frame(width: 200, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .gray, radius: 7, x: 3, y: 3)
                    
                    
                    
                    let cardDescription = model.describeCard()
                    
                    Text(cardDescription)
                        .foregroundColor(.white)
                        .font(.caption2)

                    //Button for a new card!
                    Button {
                        //API call for a new card!
                        model.drawCard(cardDeckId: (model.deckOfCards?.deck_id!)!)
                    } label: {
                        Text("Get new card!")
                    }
                    .padding()
                    .background()
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    
                }
                .opacity(!(isNewDeck) ? 0 : 1)
                            
                
            }
        }
        //
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ContentModel())
    }
}
