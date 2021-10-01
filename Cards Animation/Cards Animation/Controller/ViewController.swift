//
//  ViewController.swift
//  Cards Animation
//
//  Created by Utkarsh Dixit on 30/9/21.
//

import UIKit
import Hero
import Lottie

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var showBtn: UIButton!
    
    //MARK: -Lifecycle Methds
    override func viewDidLoad() {
        super.viewDidLoad()
        showBtn.clipsToBounds = true
        showBtn.layer.cornerRadius = 12
    }
    override func viewDidLayoutSubviews() {
        
        // Setting relative UI related code in viewDidLayoutSubviews as this will be called once all the constraints are set accdn. to the device
        animationView.clipsToBounds =  true
        animationView.layer.cornerRadius = animationView.frame.width/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Starting animation in viewWillAppear as it'll run even when user comes back in the view heirarchy
        startAnimation()
    }
    
    //MARK: -IBActions-
    @IBAction func showBtn(_ sender: Any) {
        // Moving to the Cards VC
        self.performSegue(withIdentifier: Constants.segues.first2second, sender: self)
    }
    
    //MARK: -Helper/Other Functions
    func startAnimation(){
        // 1. Set animation content mode
        
        animationView.contentMode = .scaleAspectFit
        
        // 2. Set animation loop mode
        
        animationView.loopMode = .loop
        
        // 3. Adjust animation speed
        
        animationView.animationSpeed = 0.5
        
        // 4. Play animation
        animationView.play()
    }
}

