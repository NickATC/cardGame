//
//  ContentView.swift
//  Card_Game
//
//  Created by NICOLAS  TAUTIVA on 1/04/22.
//

import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var model: ContentModel
    var status: String {
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
                
                    Text(status)
                        .font(.footnote)
                    Text("Available Cards:   \(model.deckOfCards?.remaining ?? 0)")
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
                    Image("newbackground")
                        .resizable()
                        .frame(width: 150, height: 250)
                        .padding()
                    
                    if ((model.cardDraw?.success) != nil) {
                        Text("\(model.cardDraw?.cards?[0].value! ?? "no value") of \(model.cardDraw?.cards?[0].suit! ?? "no suit")")
                            .foregroundColor(.white)
                            .font(.caption2)
                    }
                    
                    
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
                .opacity(!(model.deckOfCards?.success! ?? false) ? 0 : 1)
                            
                
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
