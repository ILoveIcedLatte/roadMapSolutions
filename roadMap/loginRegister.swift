//
//  loginRegister.swift
//  roadMap
//
//  Created by Dilara Şimşek on 4.06.2022.
//

import UIKit

class loginRegister: UIViewController {
    
//    //auto layout ile login register ekranı yapma. Segment ile login register geçişi, stackview içerisindeki ui elemanlarının segment ile değişimi
    
    private let loginRegSegmented: UISegmentedControl = {
       
        let items = ["register", "login"]
        
        let segmented = UISegmentedControl(items: items)
        segmented.backgroundColor = .gray
        segmented.selectedSegmentIndex = 0
        segmented.tintColor = .white
        segmented.translatesAutoresizingMaskIntoConstraints = false
        
        return segmented
    }()
    
    
    private let loginRegImgView: UIImageView = {
       
        let image = UIImageView()
        image.image = UIImage(named: "moon")
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private var emailTF: UITextField = {
        
        let textfield = UITextField()
        textfield.placeholder = "email"
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .white
        textfield.textColor = .gray
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private var passwordTF: UITextField = {
        
        let textfield = UITextField()
        textfield.placeholder = "password"
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .white
        textfield.textColor = .gray
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    private var nameSurnameTF: UITextField = {
        
        let textfield = UITextField()
        textfield.placeholder = "name and surname"
        textfield.borderStyle = .roundedRect
        textfield.backgroundColor = .white
        textfield.textColor = .gray
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        return textfield
    }()
    
    
    private var loginSV: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return stackView
        
    }()
    
    private var loginRegBtn: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        
        view.addSubview(loginRegSegmented)
        view.addSubview(loginSV)
        view.addSubview(loginRegImgView)
        view.addSubview(loginRegBtn)
        
        
        loginSV.addArrangedSubview(nameSurnameTF)
        loginSV.addArrangedSubview(emailTF)
        loginSV.addArrangedSubview(passwordTF)
        
        loginRegSegmented.addTarget(self, action: #selector(segmentedApply), for: .valueChanged)
        
        
        setConstaints()
    }
    
    
    
    @objc func segmentedApply(segment: UISegmentedControl) -> Void {
        
        switch segment.selectedSegmentIndex {
            
        case 0:
            print("register")
            
            loginRegBtn.setTitle("Register", for: .normal)
            
            nameSurnameTF.isHidden = false
            
        case 1:
            print("login")
            
            loginRegBtn.setTitle("Login", for: .normal)
            
            nameSurnameTF.isHidden = true
            
        default:
            print("default")
        }
        
        
    }
    
    
    
    func setConstaints() {
        
        
        let emailtfConst = [
            emailTF.widthAnchor.constraint(equalToConstant: 300),
            emailTF.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        
        NSLayoutConstraint.activate(emailtfConst)
        
        let passwordtfConst = [
            
            passwordTF.widthAnchor.constraint(equalToConstant: 300),
            passwordTF.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(passwordtfConst)
        
        
        let namesurnametfConst = [
            
            nameSurnameTF.widthAnchor.constraint(equalToConstant: 300),
            nameSurnameTF.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(namesurnametfConst)
        
        
        
        
        let stackViewConst = [
            loginSV.topAnchor.constraint(equalTo: loginRegImgView.bottomAnchor, constant: 50),
            
            loginSV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginSV.leadingAnchor.constraint(equalTo: loginRegSegmented.leadingAnchor),
            loginSV.trailingAnchor.constraint(equalTo: loginRegSegmented.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(stackViewConst)
        
        let loginRegSegmentedConst = [
            
            loginRegSegmented.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            loginRegSegmented.heightAnchor.constraint(equalToConstant: 35),
            loginRegSegmented.widthAnchor.constraint(equalToConstant: 380),
            loginRegSegmented.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(loginRegSegmentedConst)
        
        let loginRegImgViewConst = [
            
            loginRegImgView.topAnchor.constraint(equalTo: loginRegSegmented.bottomAnchor, constant: 20),
            loginRegImgView.heightAnchor.constraint(equalToConstant: 200),
            loginRegImgView.widthAnchor.constraint(equalToConstant: 200),
            loginRegImgView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(loginRegImgViewConst)
        
        
        let loginRegBtnConst = [
            
            loginRegBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginRegBtn.heightAnchor.constraint(equalToConstant: 50),
            loginRegBtn.widthAnchor.constraint(equalToConstant: 200),
            loginRegBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(loginRegBtnConst)
        
        
        
    }

    


}
