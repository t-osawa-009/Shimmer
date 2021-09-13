//
//  ViewController.swift
//  Shimmer
//
//  Created by 大澤卓也 on 2021/09/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func startButtonTapped(_ sender: Any) {
        baseView.startShimmeringAnimation()
    }
    
    @IBAction private func stopButtonTapped(_ sender: Any) {
        baseView.stopShimmeringAnimation()
    }
    @IBOutlet private weak var baseView: UIView!
}

