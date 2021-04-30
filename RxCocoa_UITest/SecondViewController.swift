//
//  SecondViewController.swift
//  RxCocoa_UITest
//
//  Created by 윤성호 on 2021/04/28.
//

import UIKit
import RxDataSources

class SecondViewController: UIViewController {
    
    /*
     참고 사이트 : https://github.com/RxSwiftCommunity/RxDataSources
     */
    
    let disposeBag = DisposeBag()
    let names = ["첫번째", "두번째", "세번째", "네번째", "다섯번째", "여섯번째", "일곱번째", "여덟번째", "아홉번째", "열번째"]
    lazy var namesOb: Observable<[String]> = Observable.of(names)
    
    @IBOutlet weak var testTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bindTableView_01()
//        bindTableView_02()
        bindTableView_03()
        
    }
    
    // UITableViewCell를 이용하여 cell 설정 1 - UITableView.rx.items(_:_:)
    func bindTableView_01() {
        
        namesOb.bind(to: testTableView.rx.items) {
            (tableView: UITableView, index: Int, element: String) -> UITableViewCell in

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") else {
                return UITableViewCell()
            }

            cell.textLabel?.text = element

            return cell

        }.disposed(by: disposeBag)
    }
    
    // UITableViewCell를 이용하여 cell 설정 2 - UITableView.rx.items(cellIdentifier:String)
    func bindTableView_02() {
        
        namesOb.bind(to: testTableView.rx.items(cellIdentifier: "tableCell")) { (index, model, cell:UITableViewCell) in
            cell.textLabel?.text = model
        }
        .disposed(by: disposeBag)
    }
    
    // customCell을 tableViewCell로 설정 - UITableView.rx.items(cellIdentifier:String:Cell.Type:_:)
    func bindTableView_03() {
        
        namesOb.bind(to: testTableView.rx.items(cellIdentifier: "tableCell", cellType: BasicTableCell.self)) { (index, model, cell) in
            cell.lblTitle.text = model
        }
        .disposed(by: disposeBag)
    }
    
    // RxDataSource를 이용하여 cell 설정 - UITableView.rx.items(dataSource:protocol<RxTableViewDataSourceType, UITableViewDataSource>)
    func bindTableView_04() {
        
    }
}

class BasicTableCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!

}

open class RxTableViewSectionedReloadDataSource<S: SectionModelType> : TableViewSectionedDataSource<S> {
    
}
