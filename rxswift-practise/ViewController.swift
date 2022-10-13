//
//  ViewController.swift
//  rxswift-practise
//
//  Created by 宮本大新 on 2022/10/13.
//

import UIKit
import SwiftUI
import SnapKit
import RxSwift

class ViewController: UIViewController {

    private let sampleView = SampleView(frame: .zero)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }

    private func setupViews() {
        view.addSubview(sampleView)

        sampleView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func bind() {
        sampleView.buttonDidTap
            .subscribe(onNext: { 
                print("tap")
            })
            .disposed(by: disposeBag)
    }
}
