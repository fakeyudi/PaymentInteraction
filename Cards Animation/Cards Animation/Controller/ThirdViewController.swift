//
//  ThirdViewController.swift
//  Cards Animation
//
//  Created by Utkarsh Dixit on 1/10/21.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var payBtn: UIButton!
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payBtn.clipsToBounds = true
        payBtn.layer.cornerRadius = 12
        
        self.isHeroEnabled = true
        
        cardLabel.hero.modifiers = [.fade,.translate(y: 200), .scale(0.8), .arc(intensity: 20)]

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelBtn(_ sender: Any) {
        cardLabel.hero.modifiers = [.fade, .scale(0.2)]
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func payBtn(_ sender: Any) {
        self.performSegue(withIdentifier: Constants.segues.third2final, sender: self)
    }
    
}
