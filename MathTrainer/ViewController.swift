//
//  ViewController.swift
//  MathTrainer
//
//  Created by User on 02.11.2023.
//

import UIKit

enum MathType: Int {
    case add, subtract, multiply, divide
}

class ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet var buttonsCollection: [UIButton]!
        
    //MARK: - Properties
    private var selectedType: MathType = .add
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureButton()
    }
    
    //MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathType(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
   
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) { }
    
    //MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SecondVC {
            viewController.type = selectedType
        }
    }
    
    private func configureButton() {
        //Add shadow
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.4
            button.layer.shadowRadius = 3
        }
    }
}

