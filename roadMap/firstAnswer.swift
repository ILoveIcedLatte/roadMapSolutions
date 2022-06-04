//
//  ViewController.swift
//  roadMap
//
//  Created by Dilara Şimşek on 1.06.2022.
//

import UIKit

class firstAnswer: UIViewController,UITextFieldDelegate {
    
    var firstNumber: Int?
    var secondNumber: Int?
    
    enum Actions {
        case plus,minus,multi,divide
    }
    
    var actions : Actions = .plus
    
    
    private var firstTextfield: UITextField = {
       
        let textField = UITextField()
        textField.placeholder = "first"
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textField
    }()
    
    private var secondTextfield: UITextField = {
       
        let textField = UITextField()
        textField.placeholder = "second"
        textField.borderStyle = .line
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        
        return textField
    }()
    
    private var resultLabel: UILabel = {
       
        let label = UILabel()
        label.text = "Result"
        label.textColor = .white
        label.font = UIFont(name: label.font.fontName, size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let plusButton: UIButton = {
       
        let button = UIButton()
        button.backgroundColor = .magenta
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private let minusButton: UIButton = {
       
        let button = UIButton()
        button.backgroundColor = .magenta
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("-", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private let multipleButton: UIButton = {
       
        let button = UIButton()
        button.backgroundColor = .magenta
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("*", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private let divideButton: UIButton = {
       
        let button = UIButton()
        button.backgroundColor = .magenta
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        button.setTitle("/", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstTextfield.delegate = self
        secondTextfield.delegate = self
        
        view.backgroundColor = .systemIndigo
        view.addSubview(firstTextfield)
        view.addSubview(secondTextfield)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(multipleButton)
        view.addSubview(divideButton)
        view.addSubview(resultLabel)
        
        applyConstraints()
        
        //firstTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        //secondTextfield.addTarget(self, action: #selector(textFieldDidChangeSecond(_:)), for: UIControl.Event.editingChanged)
        
        plusButton.addTarget(self, action: #selector(plusAction(_:)), for: .touchUpInside)
        
        minusButton.addTarget(self, action: #selector(minusAction(_:)), for: .touchUpInside)
        
        multipleButton.addTarget(self, action: #selector(multipleAction(_:)), for: .touchUpInside)
        
        divideButton.addTarget(self, action: #selector(divideAction(_:)), for: .touchUpInside)
        
        
        
    }
    
    func getFirstandSecond() -> Int{
        
        guard let firstNumber = Int(firstTextfield.text ?? ""), let secondNumber = Int(secondTextfield.text ?? "") else {
            print("Some value is nil")
            return 0
        }
        
        switch actions {
        case .plus:
            return firstNumber + secondNumber
        case .minus:
            return firstNumber - secondNumber
        case .multi:
            return firstNumber * secondNumber
        case .divide:
            return firstNumber / secondNumber
        }
        
    }
    
    @objc private func plusAction(_ sender: UIButton?) {
        
        actions = .plus
        
        resultLabel.text = String(getFirstandSecond())
        
    }
    

    @objc private func minusAction(_ sender: UIButton?) {
        
        actions = .minus
        
        resultLabel.text = String(getFirstandSecond())
    }
    
    
    @objc private func multipleAction(_ sender: UIButton?) {
        
        actions = .multi
        
        resultLabel.text = String(getFirstandSecond())
        
    }
    
    @objc private func divideAction(_ sender: UIButton?) {
        
        actions = .divide
        
        resultLabel.text = String(getFirstandSecond())
        
    }

    private func applyConstraints() {
        
        
        let firstTextfieldConst = [
            firstTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            firstTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstTextfield.widthAnchor.constraint(equalToConstant: 200),
            firstTextfield.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(firstTextfieldConst)
        
        let secondTextfieldConst = [
            secondTextfield.topAnchor.constraint(equalTo: firstTextfield.bottomAnchor, constant: 20),
            secondTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondTextfield.widthAnchor.constraint(equalToConstant: 200),
            secondTextfield.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(secondTextfieldConst)
        
        
        
        let plusButtonConst = [
            plusButton.topAnchor.constraint(equalTo: secondTextfield.bottomAnchor, constant: 20),
            plusButton.leadingAnchor.constraint(equalTo: secondTextfield.leadingAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 40),
            plusButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(plusButtonConst)
        
        let minusButtonConst = [
            minusButton.topAnchor.constraint(equalTo: secondTextfield.bottomAnchor, constant: 20),
            minusButton.leadingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: 50),
            minusButton.widthAnchor.constraint(equalToConstant: 40),
            minusButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(minusButtonConst)
        
        let multipleButtonConst = [
            
            multipleButton.topAnchor.constraint(equalTo: secondTextfield.bottomAnchor, constant: 20),
            multipleButton.leadingAnchor.constraint(equalTo: minusButton.leadingAnchor, constant: 50),
            multipleButton.widthAnchor.constraint(equalToConstant: 40),
            multipleButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(multipleButtonConst)
        
        let divideButtonConst = [
            
            divideButton.topAnchor.constraint(equalTo: secondTextfield.bottomAnchor, constant: 20),
            divideButton.trailingAnchor.constraint(equalTo: secondTextfield.trailingAnchor),
            divideButton.widthAnchor.constraint(equalToConstant: 40),
            divideButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(divideButtonConst)
        
        let resultLabelConst = [
            
            resultLabel.topAnchor.constraint(equalTo: divideButton.bottomAnchor, constant: 20),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.widthAnchor.constraint(equalToConstant: 80),
            resultLabel.heightAnchor.constraint(equalToConstant: 80)
        ]
        
        NSLayoutConstraint.activate(resultLabelConst)
        
    }
}


