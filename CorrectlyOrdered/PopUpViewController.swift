//
//  PopUpViewController.swift
//  CorrectlyOrdered
//
//  Created by Ryan Yang on 7/30/17.
//  Copyright © 2017 Ryan Yang. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    
    

    var inteeger = 3;
    @IBOutlet weak var labelAnimationSpeed: UILabel!
    @IBOutlet weak var sliderAnimationSpeed: UISlider!
    @IBAction func sliderAnimationSpeed(_ sender: Any) {
    }
    
    @IBOutlet weak var popUpView: UIView!
    
    //button to close the menu
    @IBOutlet weak var buttonCloseOption: UIButton!
    @IBAction func buttonCloseOption(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
                       delay: 1.25,
                       animations: {self.popUpView.alpha = 0.0},
                       completion: {finished in self.view.removeFromSuperview()}
        )
        UIView.animate(withDuration: 0.5,
                       delay: 0.75,
                       animations: {self.labelAnimationSpeed.center.x = 1000},
                       completion: nil
        )
        UIView.animate(withDuration: 0.5,
                       delay: 1,
                       animations: {self.sliderAnimationSpeed.center.x = 1000},
                       completion: nil
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting variables for screen size
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        sliderAnimationSpeed.minimumValue = 0.0;
        sliderAnimationSpeed.maximumValue = 0.4;

        UIView.animate(withDuration: 0.5,
                       animations: {self.popUpView.alpha = 1.0;},
                       completion: nil
        )
        labelAnimationSpeed.center = CGPoint(x: screenWidth * 1.2,y: screenHeight * 0.65);
        sliderAnimationSpeed.center = CGPoint(x: screenWidth * 1.2,y: screenHeight * 0.7);

        
        buttonCloseOption.center = CGPoint(x: screenWidth * 0.75,y: screenHeight * 0.025);
        

        
        //Menu is somewhat opaque
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5);
        
        //sets view to 80/90% of screen size and centers
        popUpView.frame.size.width = screenWidth * 0.8;
        popUpView.frame.size.height = screenHeight * 0.9;
        popUpView.center = CGPoint(x: screenWidth * 0.5,y: screenHeight * 0.5);
        popUpView.layer.cornerRadius = 10;

        
        //Misc. menu options
        UIView.animate(withDuration: 1.0,
                       delay: 0.75,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.3,
                       animations: {self.labelAnimationSpeed.center = CGPoint(x: screenWidth * 0.4,y: screenHeight * 0.65 );},
                       completion: nil
        )
        
        UIView.animate(withDuration: 1.0,
                       delay: 1,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.3,
                       animations: {self.sliderAnimationSpeed.center = CGPoint(x: screenWidth * 0.4,y: screenHeight * 0.7 );},
                       completion: nil
        )
        
    }
    




}
