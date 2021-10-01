//
//  SecondViewController.swift
//  Cards Animation
//
//  Created by Utkarsh Dixit on 30/9/21.
//

import UIKit
import ZLSwipeableViewSwift

class SecondViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var cardsView: ZLSwipeableView!
    
    //MARK: - Constants & Variables
    var cardsDB = [UIImage]() //Currently Using Images but can easily be swiped out with Card Model
    var cardsIndex = 0 //To track the index of the current card that is on the top
    
    //MARK: -Lifecycle Methds
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding Dummy data to the array for rendering views
        cardsDB.append(UIImage(named: Constants.imageNames.Card)!)
        cardsDB.append(UIImage(named: Constants.imageNames.Card)!)
        cardsDB.append(UIImage(named: Constants.imageNames.Card)!)
        cardsDB.append(UIImage(named: Constants.imageNames.Card)!)
        
        cardsView.swipeTopView(inDirection: .Horizontal)  // Setting the swiping direction, most natural being the Horizontal swipe
        
        //Animation Specific Code to make the screens flow together
        self.hero.isEnabled = true
        
        cancelBtn.clipsToBounds = true
        cancelBtn.layer.cornerRadius = 12
        
        cancelBtn.isHeroEnabled = true
        cancelBtn.hero.modifiers = [.fade]
        
        cardsView.backgroundColor = .clear
        
        cardsView.heroID = Constants.heroIDs.cardsView
        cardsView.isHeroEnabled = true
        cardsView.hero.modifiers = [.translate(y: 200), .scale(0.8), .arc(intensity: 20)]
        
    }
    
    override func viewDidLayoutSubviews() {
        cardsView.nextView = {
            return self.nextCardView()
        }
    }
    
    //MARK: -IBActions-
    @IBAction func cancelBtn(_ sender: Any) {
        cardsView.hero.modifiers = [.fade, .scale(0.2)]
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: -Helper/Other Functions
    // This Function is where The nextView in rendred. If we were to use the CardModel, this is where we would setup the view either programmatically or using an xib.
    func nextCardView() -> UIView? {
        if cardsIndex >= cardsDB.count {
            cardsIndex = 0
        }
        
        let cardView = UIView(frame: CGRect(x: 25, y: 25, width: 307, height: 430)) //currently size is hardcoded but can be easily made dynamic using basic maths
        let cardImage = UIImageView(frame: cardView.bounds)
        cardImage.hero.isEnabled = true
        cardImage.hero.modifiers = [.fade, .scale(0.2)]
        cardImage.image = cardsDB[cardsIndex]
        cardView.addSubview(cardImage)
        
        let tapCard = UITapGestureRecognizer(target: self, action: #selector(handleCardTap))
        cardView.addGestureRecognizer(tapCard)
        cardsIndex+=1
        return cardView
    }
  
    @objc func handleCardTap(gesture: UITapGestureRecognizer) -> Void {
        self.performSegue(withIdentifier: Constants.segues.second2third, sender: self)
    }

}
