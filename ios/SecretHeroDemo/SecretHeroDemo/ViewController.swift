//
//  ViewController.swift
//  SecretHeroDemo
//
//  Created by SecretHeroDev on 4.11.2023.
//

import UIKit
import SecretHero

class ViewController: UIViewController {
    let defaultToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJRCI6IjEiLCJpYXQiOjE2OTgwNzA3Mjl9.Tf_QBI0PM8EHVI0xqmFdqkjtcI5-q2ciyGhnASBhfY8"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let config = SecretHeroConfig.Builder()
            .setUserId("user_id")
            .setDisplayName("display_name")
//            .setIconImage(UIImage(named: "ICON"))
            .build(token: defaultToken)
        SecretHero.initialize(config: config, delegate: self)
        
        let gameButton = SecretHeroView()
        gameButton.rootViewController = self

        view.addSubview(gameButton)
        NSLayoutConstraint.activate([
            gameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            gameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
        
        /*
         As optional can use SecretHeroView :
         SecretHero.start(rootViewController: self)
         */
    }
    
    deinit {
        SecretHero.release()
    }
}

extension ViewController: SecretHeroDelegate {
    func onInitialized() {
        print("[SecretHero] onInitialized")
    }
    
    func onInitializeFailed(errorMessage: String) {
        print("[SecretHero] onInitializeFailed:\(errorMessage)")
    }
    
    func onClose() {
        print("[SecretHero] onClose")
    }
    
    func onOpen() {
        print("[SecretHero] onOpen")
    }
}
