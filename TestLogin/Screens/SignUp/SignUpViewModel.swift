//
//  SignUpViewModel.swift
//  TestLogin
//
//  Created by Satoshi on 16.08.2024.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - SignUpViewModel

class SignUpViewModel {
    
    // MARK: - Internal Properties
    
    let email = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
    
    lazy var isSignUpButtonEnabled: Observable<Bool> = {
        return Observable.combineLatest(self.email, self.password)
            .map { email, password in
                return self.isValidEmail(email) && self.isValidPassword(password)
            }
            .distinctUntilChanged()
    }()
    
    // MARK: - Private Methods
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count > 8
    }
}
