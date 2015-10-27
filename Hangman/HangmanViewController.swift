//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var startOverButton: UIButton!
    @IBOutlet weak var guessText: UITextField!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var pastGuessesText: UILabel!
    @IBOutlet weak var correctText: UILabel!
    
    
    @IBOutlet weak var imageSubView: UIImageView!
    var stateImages: [UIImage] = []
    var wrongAns = 0
    var solved: Bool = false
    
    var game:Hangman!
    
    func endGame()
    {
        var msg = ""
        var desc = ""
        if (solved == true)
        {
            msg = "Puzzle Sovled"
            desc = "You correctly guessed the puzzle!"
        }
        else if (wrongAns > 10 || solved == false)
        {
            correctText.text = game.answer
            msg = "Game Over"
            desc = "Exceeded number of tries"
        }
        
        let alertController = UIAlertController(title: msg, message: desc, preferredStyle: .Alert)
        
        let newGameAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.newGameButtonClick(self)
        }
        alertController.addAction(newGameAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
    }
    
    func reloadView()
    {
        guessText.text = ""
        //print("Before game.guesses()")
        pastGuessesText.text = game.guesses()
        correctText.text = game.knownString
        if (wrongAns <= 10)
        {
            imageSubView.image = stateImages[wrongAns]
        }
        
        solved = true
        for character in (game.knownString?.characters)!
        {
            if(character == "_")
            {
                solved = false
            }
        }
        
        if((solved == true) || (wrongAns == 10))
        {
            endGame()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = Hangman()
        
        stateImages.append(UIImage(named: "pic0.jpg")!)
        stateImages.append(UIImage(named: "pic1.jpg")!)
        stateImages.append(UIImage(named: "pic2.jpg")!)
        stateImages.append(UIImage(named: "pic3.jpg")!)
        stateImages.append(UIImage(named: "pic4.jpg")!)
        stateImages.append(UIImage(named: "pic5.jpg")!)
        stateImages.append(UIImage(named: "pic6.jpg")!)
        stateImages.append(UIImage(named: "pic7.jpg")!)
        stateImages.append(UIImage(named: "pic8.jpg")!)
        stateImages.append(UIImage(named: "pic9.jpg")!)
        stateImages.append(UIImage(named: "pic10.jpg")!)
        game.start()
        reloadView()
    }

   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newGameButtonClick(sender: AnyObject)
    {
        wrongAns = 0
        game.start()
        reloadView()
    }
    
    @IBAction func startOverButtonClick(sender: UIButton)
    {
        game.guessedLetters = NSMutableArray()
        wrongAns = 0
        game.knownString = game.knownStringCopy
        reloadView()
        
    }
    @IBAction func goButtonClick(sender: UIButton) {
        if(guessText.text?.characters.count != 1)
        {
            guessText.text = ""
        }
        else
        {
            if(game.guessLetter(guessText.text!.uppercaseString) == false)
            {
                wrongAns = wrongAns + 1
            }
            reloadView()
        }
        
    }
    
}

