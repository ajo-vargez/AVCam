//
//  MainVC.swift
//  AVCam
//
//  Created by Ajo M Varghese on 07/07/19.
//  Copyright © 2019 Ajo M Varghese. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {

  // MARK:- Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    self.window = UIWindow(frame: UIScreen.main.bounds)
    mainView = MainView(frame: (self.window?.frame)!)
    self.view.addSubview(mainView)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.setNavigationBarHidden(true, animated: false)
  }



  // MARK:- Private
  private var window: UIWindow?
  private var mainView: MainView!
}

