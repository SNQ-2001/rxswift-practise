//
//  SampleView.swift
//  rxswift-practise
//
//  Created by 宮本大新 on 2022/10/13.
//

import UIKit
import SwiftUI
import SnapKit
import RxSwift
import RxCocoa

class SampleView: UIView {
    private let button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("ボタン", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .red

        return button
    }()

    private let disposeBag = DisposeBag()

    var buttonDidTap: Observable<Void> {
        button.rx.tap.asObservable()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(button)

        button.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
