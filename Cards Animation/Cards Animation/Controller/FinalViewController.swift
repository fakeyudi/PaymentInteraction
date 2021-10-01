//
//  FinalViewController.swift
//  Cards Animation
//
//  Created by Utkarsh Dixit on 1/10/21.
//

import UIKit
import Lottie

class FinalViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var animationView: AnimationView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.clipsToBounds = true
        backBtn.layer.cornerRadius = 12
        
        animationView.backgroundColor = .clear
        
        //Animation Specific Code to make the screens flow together
        self.hero.isEnabled = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Starting animation in viewWillAppear as it'll run even when user comes back in the view heirarchy
        startAnimation()
    }
    
    //MARK: -Helper/Other Functions
    func startAnimation(){
        // 1. Set animation content mode
        
        animationView.contentMode = .scaleAspectFill
        
        // 2. Set animation loop mode
        
        animationView.loopMode = .playOnce
        
        // 3. Adjust animation speed
        
        animationView.animationSpeed = 1
        
        // 4. Play animation
        animationView.play()
    }
 

}
