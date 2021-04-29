//
//  ViewController.swift
//  RxCocoa_UITest
//
//  Created by 윤성호 on 2021/04/28.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnEnter: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        initButton()
        initTextField()
    }

    func initButton() {
        btnEnter.rx.controlEvent(.touchUpInside)
            .asObservable()
            .subscribe { _ in
//                let secondVC = storyboard
            }
            .disposed(by: disposeBag)
    }
    
    func initTextField() {
        
//        textField.rx.controlEvent(.editingChanged)
//            .asObservable()
//            .subscribe { _ in
//                self.lblResult.text = self.textField.text ?? "입력값 없음"
//            }.disposed(by: disposeBag)
        
        textField.rx.text
            .subscribe { text in
                self.lblResult.text = text
            }
            .disposed(by: disposeBag)
    }
}

