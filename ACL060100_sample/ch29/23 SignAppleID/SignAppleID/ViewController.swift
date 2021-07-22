//
//  ViewController.swift
//  SignAppleID
//
//  Created by 朱克剛 on 2020/9/15.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = ASAuthorizationAppleIDButton(
            type: .default,
            style: .whiteOutline
        )
        
        button.addTarget(
            self,
            action: #selector(handleAuthorizationAppleIDButtonPress),
            for: .touchUpInside
        )
        
        button.cornerRadius = 20
        button.frame = CGRect(x: 20, y: 100, width: 200, height: 42)
        view.addSubview(button)
    }

    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController  = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            print((userIdentifier, fullName, email))

        default:
            break
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

