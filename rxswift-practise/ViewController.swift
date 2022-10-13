//
//  ViewController.swift
//  rxswift-practise
//
//  Created by 宮本大新 on 2022/10/13.
//

import UIKit
import SwiftUI
import SnapKit

class ViewController: UIViewController {

    private let sampleView = SampleView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.addSubview(sampleView)

        sampleView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
