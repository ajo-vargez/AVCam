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

  private let bottomControls: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  /// Sets the UI for the given view
  private func setupViews() {
    addSubview(previewView)
    addSubview(bottomControls)

    // Preview
    NSLayoutConstraint.activate([previewView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                previewView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                previewView.topAnchor.constraint(equalTo: self.topAnchor, constant: 34),
                                previewView.bottomAnchor.constraint(equalTo: bottomControls.topAnchor)])

    // Bottom Controls
    NSLayoutConstraint.activate([bottomControls.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                bottomControls.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                bottomControls.heightAnchor.constraint(equalToConstant: 114),
                                bottomControls.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
  }
}
