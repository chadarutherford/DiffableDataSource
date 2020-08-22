//
//  FlagsViewController.swift
//  DiffableDataSource
//
//  Created by Chad Rutherford on 8/22/20.
//  Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import UIKit

class FlagsViewController: UIViewController {
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Outlets
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var sortSegmentedControl: UISegmentedControl!
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Properties
	var states = States.allCases
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - View Controller Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.dataSource = self
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Actions
	@IBAction func changeSorting(_ sender: UISegmentedControl) {
		
	}
}

extension FlagsViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		states.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlagCollectionViewCell.reuseIdentifier, for: indexPath) as? FlagCollectionViewCell else { fatalError("Unable to dequeue a cell for identifier \(FlagCollectionViewCell.reuseIdentifier)") }
		let state = states[indexPath.item]
		let flagImage = UIImage(named: state.rawValue)
		cell.imageView.image = flagImage
		return cell
	}
}
