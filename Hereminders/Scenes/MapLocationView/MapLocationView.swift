//
//  MapLocationView.swift
//  Hereminders
//
//  Created by Gabriela Sillis on 18/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit
import MapKit

final class MapLocationView: UIView {

    private var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.mapType = MKMapType.standard
        map.isUserInteractionEnabled = false
        
        return map
    }()

    init() {
        super.init(frame: .zero)
        self.configSubview()
        self.configConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configSubview()
        self.configConstraint()
    }

    private func configSubview() {
        self.addSubview(self.mapView)
    }

    private func configConstraint() {
        NSLayoutConstraint.activate([
            self.mapView.topAnchor.constraint(equalTo: topAnchor),
            self.mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    public func configure(with viewModel: MapLocationViewModel) {
        let region = MKCoordinateRegion(center: viewModel.coordinate, span: .default)
        self.mapView.setRegion(region, animated: true)

        let pin = MKPointAnnotation()
        pin.title = viewModel.title
        pin.coordinate = viewModel.coordinate

        self.mapView.addAnnotation(pin)
    }
}

