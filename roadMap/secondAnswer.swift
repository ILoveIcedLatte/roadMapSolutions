//
//  ViewController.swift
//  roadMap
//
//  Created by Dilara Şimşek on 2.06.2022.
//

import UIKit

class secondAnswer: UIViewController {
    
    //dark mode light mode uyumlu renk ve resim kullan, buton ile switch on/of değişmeli, switch durumuna göre custom alert gösterilmeli, alert için extension kullanılmalı
    
    private var titleLabel: UILabel = {
       
        let label = UILabel()
        label.text = "MODE, SWITCH, BUTTON"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var modeImage: UIImageView = {
       
        let image = UIImageView()
        image.image = UIImage(named: "moon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var modeSwitch: UISwitch = {
       
        let iSwitch = UISwitch()
        iSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        return iSwitch
    }()
    
    private var buttonSwitch: UIButton = {
       
        let button = UIButton()
        button.setTitle("Change Switch", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(modeSwitch)
        view.addSubview(modeImage)
        view.addSubview(titleLabel)
        view.addSubview(buttonSwitch)
        
        view.backgroundColor = .gray
        
        modeSwitch.addTarget(self, action: #selector(modeSwitchChanged), for: .valueChanged)
        buttonSwitch.addTarget(self, action: #selector(buttonChanged), for: .touchUpInside)
        
        
        applyConstraint()
        
    }
    
    @objc func modeSwitchChanged() {
        print("changed")
    }
    
    @objc func buttonChanged() {
        print("changed")
    }
    
    
    func applyConstraint() {
        
        
        let titleLabelConst = [
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(titleLabelConst)

        
        let imageConstaints = [
            modeImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            modeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modeImage.widthAnchor.constraint(equalToConstant: 200),
            modeImage.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(imageConstaints)
        
        let switchConstaints = [
            modeSwitch.topAnchor.constraint(equalTo: modeImage.bottomAnchor, constant: 10),
            modeSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modeSwitch.widthAnchor.constraint(equalToConstant: 200),
            modeSwitch.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(switchConstaints)
        
        
        
        let buttonConstaints = [
            buttonSwitch.topAnchor.constraint(equalTo: modeSwitch.bottomAnchor, constant: 20),
            buttonSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonSwitch.widthAnchor.constraint(equalToConstant: 200),
            buttonSwitch.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(buttonConstaints)
    }
    


}
