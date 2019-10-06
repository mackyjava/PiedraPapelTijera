//
//  ViewController.swift
//  RockScissorPaper
//
//  Created by Adriana Jauregui on 10/5/19.
//  Copyright © 2019 Adriana Jauregui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botImage: UILabel!
    @IBOutlet weak var userSign: UIButton!
    @IBOutlet weak var LabelResult: UILabel!
    @IBOutlet var ViewBack: UIView!
    @IBOutlet weak var again: UIButton!
    @IBOutlet weak var ScissorsIcon: UIButton!
    @IBOutlet var RockIcon: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        again.isHidden = true
        again.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Initialize(_ sender: Any) {
        show()
        userSignToShow(user: .paper)
        determinateResult(result: .inicio)
    }
    
    @IBAction func clickRock(_ sender: Any) {
        let computerSign = randomSign()
        let rockSign = Sign.rock
        let result = rockSign.compare(singComputer: computerSign)
        determinateResult( result: result)
        userSignToShow(user: rockSign)
        computerSignToShow(computer: computerSign)
        hideIcon()
       
    }
    
    @IBAction func clickPaper(_ sender: Any) {
        let computerSign = randomSign()
        let paper = Sign.paper
        let result = paper.compare(singComputer: computerSign)
        determinateResult( result: result )
        userSignToShow(user: paper)
        computerSignToShow(computer:  computerSign)
       hideIcon()
    }
    @IBAction func clickScissors(_ sender: Any) {
       let computerSign = randomSign()
              let scissors = Sign.scissors
                let result = scissors.compare(singComputer: computerSign)
         determinateResult( result: result)
        userSignToShow(user: scissors)
        computerSignToShow(computer:  computerSign)
      hideIcon()
    }
    
    private let rockIcon = "👊"
    private let paperIcon = "🤚"
    private let scissorsIcon = "✌️"
    private let botIcon = "🤖"
    
    func determinateResult(result:GameSet) {
        switch result {
        case .ganar:
            ViewBack.backgroundColor = .green
            LabelResult.text = "Ganaste 😃"
        case .empatar:
             ViewBack.backgroundColor = .yellow
             LabelResult.text = "Empataste 🤨"
        case .perder:
             ViewBack.backgroundColor = .red
             LabelResult.text = "Perdiste 😔"
        default:
            ViewBack.backgroundColor = .white
            LabelResult.text = "Rock, Paper, Scissors?"
            botImage.text = botIcon
            userSign.setTitle(paperIcon, for: UIControl.State.normal)
            userSign.isEnabled = true
        }
        
    }
    func  computerSignToShow(computer: Sign) {
    switch computer {
      case .rock:
         botImage.text = rockIcon
      case .paper:
         botImage.text = paperIcon
      default:
         botImage.text = scissorsIcon
     
      }
    }
    
    func userSignToShow(user: Sign){
        userSign.isEnabled = false
        switch(user) {
        case .rock:
            userSign.setTitle(rockIcon, for: UIControl.State.normal)
        case .scissors:
           userSign.setTitle(scissorsIcon, for: UIControl.State.normal)
        default:
             userSign.setTitle(paperIcon, for: UIControl.State.normal)
        }
    }
    
    func hideIcon() {
        ScissorsIcon.isHidden = true
        RockIcon.isHidden = true
        again.isHidden = false
        again.isEnabled = true
    }
    
    func show() {
        ScissorsIcon.isHidden = false
        RockIcon.isHidden = false
        again.isHidden = true
        again.isEnabled = false
    }
}

