//
//  ViewController.swift
//  CorrectlyOrdered
//
//  Created by Ryan Yang on 7/9/17.
//  Copyright © 2017 Ryan Yang. All rights reserved.
//




/*
 
 Next inmprovement:
 
    Set the inputIsMatch() function to be called every time a user input is reached and determined based off of that
 
    global loop for index???
 

 
 
 */


import UIKit

class ViewController: UIViewController {

    
    var iLevel = 1;
    var iUserScore = 0;
    var iGeneratedArraySequence = [(Int(arc4random_uniform(4) + 1))];
    var iArrayUserInput = [Int]();
    var iAnimationIndex = 0;

    @IBOutlet weak var backgroundGif: UIImageView!
    @IBOutlet weak var labelCurrentScore: UILabel!
    
    @IBOutlet weak var buttonBlue: UIButton!
    @IBAction func buttonBlue(_ sender: UIButton) {
        iArrayUserInput.append(1);
    }
    

    @IBOutlet weak var buttonYellow: UIButton!
    @IBAction func buttonYellow(_ sender: UIButton) {
        iArrayUserInput.append(2);
    }
    
    
    @IBOutlet weak var buttonPurple: UIButton!
    @IBAction func buttonPurple(_ sender: UIButton) {
        iArrayUserInput.append(3);
    }

    
    @IBOutlet weak var buttonGreen: UIButton!
    @IBAction func buttonGreen(_ sender: UIButton) {
        iArrayUserInput.append(4);
    }
    
    //bottom buttons
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBAction func buttonSubmit(_ sender: UIButton) {
        
        if(bInputIsMatch(iArrayUserInput: iArrayUserInput)){
            nextLevel();
        }else{
            levelFail();
        }
        
    }

    @IBOutlet weak var buttonOptions: UIButton!
    @IBAction func buttonOptions(_ sender: Any) {
        
        let popupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController;
        self.addChildViewController(popupVC);
        popupVC.view.frame = self.view.frame;
        self.view.addSubview(popupVC.view);
        popupVC.didMove(toParentViewController: self);
        
    }
    
    @IBOutlet weak var buttonSkins: UIButton!
    @IBAction func buttonSkins(_ sender: Any) {
    }
    @IBOutlet weak var buttonSpeaker: UIButton!
    @IBAction func buttonSpeaker(_ sender: Any) {
    }
    
    //update game for next level
    func nextLevel(){
        iLevel+=1;
        iUserScore += iLevel;
        labelCurrentScore.text = "Score: \(iUserScore)";
        iArrayUserInput = [];
        iGenerateSequence(iAmtInSequence: iLevel);
        showSequence(iGeneratedArraySequence: iGeneratedArraySequence);
    }
    
    //reset game stats and save highest score
    func levelFail(){
        iUserScore = 0;
        iLevel = 1;
        labelCurrentScore.text = "Score: \(iUserScore)";
        iArrayUserInput = [];
        iGenerateSequence(iAmtInSequence: iLevel);
        showSequence(iGeneratedArraySequence: iGeneratedArraySequence);

    }
    
    //function that generates sequence
    func iGenerateSequence(iAmtInSequence: Int){
        
        iGeneratedArraySequence = [];
        var iLoopIndex: Int = 0;
        while(iLoopIndex <= iAmtInSequence){
            
            iGeneratedArraySequence.append(Int(arc4random_uniform(4) + 1));
            iLoopIndex += 1;
        }
    }
    
    //function that animates a button
    func buttonAnimationChain(buttonColor:UIButton){
        UIView.animate(withDuration: iAnimationDurationFunction(),
                       animations: {buttonColor.alpha = 0.0},
                       completion: {finished in self.buttonAnimationChain2(buttonColor: buttonColor)}
        )
    }
    
    //function that animates the reappearance of button
    func buttonAnimationChain2(buttonColor:UIButton){
        UIView.animate(withDuration: iAnimationDurationFunction(),
                       animations: {buttonColor.alpha = 1.0},
                       completion: {finished in self.recursionBase()}
        )
    }
    
    //recursion base
    func recursionBase(){
        if(iAnimationIndex < iGeneratedArraySequence.count - 1){
            iAnimationIndex += 1;
            buttonAnimationChain(buttonColor: btnArrayConvert(iAnimationIndex: iAnimationIndex));
        }
    }
    
    //function that shows the entire sequence
    func showSequence(iGeneratedArraySequence: [Int]){
        iAnimationIndex = 0;
        buttonAnimationChain(buttonColor: btnArrayConvert(iAnimationIndex: iAnimationIndex));
    }

    
    //function takes int and returns corresponding button color
    func btnArrayConvert(iAnimationIndex: Int) -> UIButton{
        if(iGeneratedArraySequence[iAnimationIndex] == 1){
            return buttonBlue;
        }
        else if(iGeneratedArraySequence[iAnimationIndex] == 2){
            return buttonYellow;
        }
        else if (iGeneratedArraySequence[iAnimationIndex] == 3){
            return buttonPurple;
        }
        else{
            return buttonGreen;
        }
    }
    
    //function to check if User input matches assigned sequence and returns boolean
    func bInputIsMatch(iArrayUserInput: [Int]) -> Bool{
        
        if(iArrayUserInput == iGeneratedArraySequence){
            return true;
        }
        return false;
    }
    
    //function that returns integer for animation duration depending on level
    func iAnimationDurationFunction() -> Double {
        var dDurationTime: Double = 0.15;
        
        if(iGeneratedArraySequence.count <= 100){
            dDurationTime += (-(0.1)*(log(Double(iGeneratedArraySequence.count))) + 0.2);
        }
        
        //dDurationTime += sliderAnimationSpeed().value;
        
        return dDurationTime;
        
    }
    
    func resetToPlayableState(){
        let screenSize = UIScreen.main.bounds;
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        buttonBlue.center.x = self.view.center.x + (screenWidth * 0.2 );
        buttonBlue.center.y = self.view.center.y;
        
        buttonYellow.center.x = self.view.center.x - (screenWidth * 0.2 );
        buttonYellow.center.y = self.view.center.y;
        
        buttonPurple.center.x = self.view.center.x + (screenWidth * 0.2 );
        buttonPurple.center.y = self.view.center.y + (screenHeight * 0.225 );
        
        buttonGreen.center.x = self.view.center.x - (screenWidth * 0.2 );
        buttonGreen.center.y = self.view.center.y + (screenHeight * 0.225 );
    }
    
    func sequenceTotalFunction(iSequenceIndex: Int) -> Int {
        
        var iNumberCount: Int = 1;
        var iIncrementalValue: Int = 2;
        var iLoopIndex: Int = 0;
        while iIncrementalValue < iSequenceIndex{
            
            
            
            iIncrementalValue += 1;
        }
        
        return iNumberCount;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting variables for screen size
        let screenSize = UIScreen.main.bounds;
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        let dButtonHeight: CGFloat = screenWidth * 0.5;
        let dButtonWidth: CGFloat = screenWidth * 0.4;
        
        
        //sets the background as Gif (try using mp4 file first)
        
         
        self.backgroundGif.image = UIImage.gif(name: "backgroundBWSquare")
        backgroundGif.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight);
        view.sendSubview(toBack: backgroundGif);
        
        
        
        buttonBlue.frame.size = CGSize(width: dButtonWidth , height: dButtonHeight )
        buttonBlue.center.x = self.view.center.x + (screenWidth * 0.225 );
        buttonBlue.center.y = self.view.center.y - (screenHeight * 0.15 );
        
        buttonYellow.frame.size = CGSize(width: dButtonWidth , height: dButtonHeight )
        buttonYellow.center.x = self.view.center.x - (screenWidth * 0.225 );
        buttonYellow.center.y = self.view.center.y - (screenHeight * 0.15 );
        
        buttonPurple.frame.size = CGSize(width: dButtonWidth , height: dButtonHeight )
        buttonPurple.center.x = self.view.center.x + (screenWidth * 0.225 );
        buttonPurple.center.y = self.view.center.y + (screenHeight * 0.15 );
        
        buttonGreen.frame.size = CGSize(width: dButtonWidth , height: dButtonHeight )
        buttonGreen.center.x = self.view.center.x - (screenWidth * 0.225 );
        buttonGreen.center.y = self.view.center.y + (screenHeight * 0.15 );
        
        //sets the location and size of misc. buttons/labels
        
        labelCurrentScore.frame = CGRect(x: 10, y: 10, width: 150, height: 40);
        labelCurrentScore.text = "";
        buttonSubmit.frame = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.825, width: screenWidth * 0.25, height: screenWidth * 0.25);
        buttonOptions.frame = CGRect(x: screenWidth * 0.375, y: screenHeight * 0.85, width: screenWidth * 0.15, height: screenWidth * 0.15);
        buttonSkins.frame = CGRect(x: screenWidth * 0.55, y: screenHeight * 0.84, width: screenWidth * 0.15, height: screenWidth * 0.15);
        buttonSpeaker.frame = CGRect(x: screenWidth * 0.725 , y: screenHeight * 0.83, width: screenWidth * 0.15, height: screenWidth * 0.15);
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.75,
                       options: [.repeat, .autoreverse],
                       animations: {
                        //self.buttonSubmit.frame.y = 0;
                        //self.buttonOptions.y = 0;
                        //self.buttonSkins.y = 0;
                        self.buttonSpeaker.frame.size = CGSize(width: screenWidth * 0.4,height: screenHeight * 0.65 );
                        
                       },
                       completion: nil
        )

        
        //curves corners and highlights on touch
        buttonBlue.showsTouchWhenHighlighted = true;
        buttonYellow.showsTouchWhenHighlighted = true;
        buttonPurple.showsTouchWhenHighlighted = true;
        buttonGreen.showsTouchWhenHighlighted = true;
        
        buttonBlue.layer.cornerRadius = 10;
        buttonYellow.layer.cornerRadius = 10;
        buttonPurple.layer.cornerRadius = 10;
        buttonGreen.layer.cornerRadius = 10;
        
    }
}

