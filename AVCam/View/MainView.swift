//
//  MainView.swift
//  AVCam
//
//  Created by Ajo M Varghese on 07/07/19.
//  Copyright © 2019 Ajo M Varghese. All rights reserved.
//

import UIKit

class MainView: UIView {

  // MARK:- Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)

    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }




  // MARK:- Private

  // Camera's viewFinder
  private let previewView: PreviewView = {
    let view = PreviewView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let cameraControls: UIView = {
    let view = UIView()
    view.backgroundColor = .clear
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  /// Sets the UI for the given view
  private func setupViews() {
    addSubview(previewView)
    insertSubview(cameraControls, aboveSubview: previewView)

    // Preview
    NSLayoutConstraint.activate([previewView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                previewView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                previewView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                previewView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)])

    // Bottom Controls
    NSLayoutConstraint.activate([cameraControls.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                cameraControls.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                cameraControls.heightAnchor.constraint(equalToConstant: 114),
                                cameraControls.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)])
  }
}
