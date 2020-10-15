//
//  PreviewView.swift
//  AVCam
//
//  Created by Ajo M Varghese on 07/07/19.
//  Copyright © 2019 Ajo M Varghese. All rights reserved.
//

import UIKit
import AVFoundation

final class PreviewView: UIView, AVCaptureVideoDataOutputSampleBufferDelegate {
	
	// MARK:- Lifecycle
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		commonInit()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		previewLayer.frame = bounds
	}
	
	
	
	
	
	// MARK:- Private
	private lazy var session: AVCaptureSession = {
		let session = AVCaptureSession()
		session.sessionPreset = AVCaptureSession.Preset.hd1920x1080
		return session
	}()
	
	private let captureDevice: AVCaptureDevice? = {
		let device = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera,
											 for: AVMediaType.video,
											 position: AVCaptureDevice.Position.back)
		return device
	}()
	
	private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
		let pLayer = AVCaptureVideoPreviewLayer(session: session)
		pLayer.videoGravity = .resizeAspect
		return pLayer
	}()
	
	private lazy var videoDataOutput: AVCaptureVideoDataOutput = {
		let vdoDataOutput = AVCaptureVideoDataOutput()
		vdoDataOutput.alwaysDiscardsLateVideoFrames = true
		vdoDataOutput.setSampleBufferDelegate((self as AVCaptureVideoDataOutputSampleBufferDelegate), queue: vdoQ)
		vdoDataOutput.connection(with: .video)?.isEnabled = true
		return vdoDataOutput
	}()
	
	private func commonInit() {
		beginSession()
	}
	
	private func beginSession() {
		do {
			guard let captureDevice = captureDevice else {
				fatalError("Camera does not work on a simulator")
			}
			let deviceInput = try AVCaptureDeviceInput(device: captureDevice)
			if session.canAddInput(deviceInput) {
				session.addInput(deviceInput)
			}
			if session.canAddOutput(videoDataOutput) {
				session.addOutput(videoDataOutput)
			}
			layer.masksToBounds = true
			layer.addSublayer(previewLayer)
			previewLayer.frame = bounds
			session.startRunning()
		} catch let err {
			NSLog("\(self.self): \(#function) line: \(#line).  \(err.localizedDescription)")
		}
	}
}

let vdoQ = DispatchQueue(label: "com.ajo.vdoDataOutputQueue", qos: DispatchQoS.userInitiated)
