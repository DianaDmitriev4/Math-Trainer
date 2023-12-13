//
//  ViewController.swift
//  MathTrainer
//
//  Created by User on 02.11.2023.
//

import UIKit

enum MathType: Int, CaseIterable {
    case add, subtract, multiply, divide
    
    var key: String {
        switch self {
        case .add:
            "addCount"
        case .subtract:
            "subtractCount"
        case .multiply:
            "multiplyCount"
        case .divide:
            "divideCount"
        }
    }
}

class ViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet var buttonsCollection: [UIButton]!
    @IBOutlet weak var additionLabel: UILabel!
    @IBOutlet weak var subtractionLabel: UILabel!
    @IBOutlet weak var multiplicationLabel: UILabel!
    @IBOutlet weak var divideLabel: UILabel!
    
    //MARK: - Properties
    private var selectedType: MathType = .add
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButton()
        setCountLabels()
    }
    
    //MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathType(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton) {
        MathType.allCases.forEach { type in
            let key = type.key
            UserDefaults.standard.removeObject(forKey: key)
            additionLabel.text = "-"
            divideLabel.text = "-"
            multiplicationLabel.text = "-"
            subtractionLabel.text = "-"
        }
    }
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) { 
        setCountLabels()
    }
    
    //MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TrainVC {
            viewController.type = selectedType
        }
    }
    
    private func setCountLabels() {
        MathType.allCases.forEach { type in
            let key = type.key
            guard let count = UserDefaults.standard.object(forKey: key) as? Int else { return }
            let stringValue = String(count)
            
            switch type {
            case .add:
                additionLabel.text = stringValue
            case .divide:
                divideLabel.text = stringValue
            case .multiply:
                multiplicationLabel.text = stringValue
            case .subtract:
                subtractionLabel.text = stringValue
            }
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

