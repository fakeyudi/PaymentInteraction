//
//  CardsModel.swift
//  Cards Animation
//
//  Created by Utkarsh Dixit on 1/10/21.
//

import Foundation

//This is the Cards Model for storing Credit Card information.
/// Currently we're rendering Cards directly from an Image, but in an actual application, we need to implement proper models and use them to render Swipable CardViews

struct CardModel{
    var name: String // Giving Cards a convinient name makes them easy to identify
    var holderName: String
    var number: String
    var expDate: String //will convert date to string for final use as much easier to render
    var type: CardType //Use this to render out the logo on the card
}

enum CardType{
    case Visa, Mastercard, Amex
}
