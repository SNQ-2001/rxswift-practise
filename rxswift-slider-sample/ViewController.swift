//
//  ViewController.swift
//  rxswift-slider-sample
//
//  Created by 宮本大新 on 2022/10/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let slider: UISlider = {
        let view = UISlider(frame: .zero)
        view.minimumValue = 0
        view.maximumValue = 100
        view.value = 50
        view.tintColor = .blue

        return view
    }()

    private let label: UILabel = {
        let view = UILabel(frame: .zero)
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.textAlignment = .center

        return view
    }()

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
    }

    private func setup() {
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(slider)

        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(slider.snp.top)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }

        slider.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
        }
    }

    private func bind() {
        slider.rx.value
            .map { Int($0) }
            .subscribe(onNext: { [weak self] value in
                self?.label.text = value.description

                // ここの計算をちゃんと考える必要がある
                let offset = Double(value - 50) * 2.7

                self?.label.snp.remakeConstraints { make in
                    make.centerX.equalToSuperview().offset(offset)
                    make.bottom.equalTo(self?.slider.snp.top ?? 0)
                    make.width.equalTo(40)
                    make.height.equalTo(30)
                }
            })
            .disposed(by: disposeBag)
    }
}
