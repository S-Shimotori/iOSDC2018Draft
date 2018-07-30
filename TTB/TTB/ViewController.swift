//
//  ViewController.swift
//  TTB
//
//  Created by S-Shimotori on 2018/07/14.
//  Copyright © 2018 Shigure Shimotori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let text = "フォントと組版の３０分入門"

    override func viewDidLoad() {
        super.viewDidLoad()

        /**
         * from http://free-paper-texture.com/free-manuscript-paper/
         * Thanks.
         */
        let backgroundImage = UIImageView(image: #imageLiteral(resourceName: "background"))
        self.view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 1200.0 / 872).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

        let titleLabel = VerticalLabel(text: text)
        titleLabel.frame = CGRect(x: 114, y: 336, width: 400, height: 50)
        titleLabel.backgroundColor = .clear
        view.addSubview(titleLabel)
        titleLabel.transform = CGAffineTransform(rotationAngle: .pi / 2)

        let nameLabel = VerticalLabel(text: "しもとり　しぐれ")
        nameLabel.frame = CGRect(x: 72, y: 575, width: 400, height: 50)
        nameLabel.backgroundColor = .clear
        view.addSubview(nameLabel)
        nameLabel.transform = CGAffineTransform(rotationAngle: .pi / 2)

        let bodyLabel = VerticalLabel(text: "　このセッションは「ｉＯＳエンジニアに聞\nいて欲しいトーク」です。")
        bodyLabel.frame = CGRect(x: -137, y: 370, width: 700, height: 100)
        bodyLabel.backgroundColor = .clear
        view.addSubview(bodyLabel)
        bodyLabel.transform = CGAffineTransform(rotationAngle: .pi / 2)

        let additionalLabel = VerticalLabel(text: "　縦組みは辛いからやらないほうがいいよ。")
        additionalLabel.frame = CGRect(x: -231, y: 370, width: 700, height: 100)
                additionalLabel.backgroundColor = .clear
        view.addSubview(additionalLabel)
        additionalLabel.transform = CGAffineTransform(rotationAngle: .pi / 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

