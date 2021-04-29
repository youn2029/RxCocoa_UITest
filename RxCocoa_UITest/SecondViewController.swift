//
//  SecondViewController.swift
//  RxCocoa_UITest
//
//  Created by 윤성호 on 2021/04/28.
//

import UIKit

class SecondViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var testTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindTableView()
        // Do any additional setup after loading the view.
    }
    
    func bindTableView() {
        print("bind TableView")
        
        let names = ["첫번째", "두번째", "세번째", "네번째", "다섯번째", "여섯번째", "일곱번째", "여덟번째", "아홉번째", "열번째"]
        let namesOb: Observable<[String]> = Observable.of(names)
        
        namesOb.bind(to: testTableView.rx.items) {
            (tableView: UITableView, index: Int, element: String) -> UITableViewCell in

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") else {
                let cell = UITableViewCell()
                cell.textLabel?.text = element
                return cell
            }

            cell.textLabel?.text = element

            return cell

        }.disposed(by: disposeBag)
    }

}
