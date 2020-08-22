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
	typealias FlagsDataSource = UICollectionViewDiffableDataSource<Int, States>
	var states = States.allCases
	lazy var dataSource: FlagsDataSource = {
		let dataSource = FlagsDataSource(collectionView: collectionView) { collectionView, indexPath, state -> UICollectionViewCell? in
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlagCollectionViewCell.reuseIdentifier, for: indexPath) as? FlagCollectionViewCell else { fatalError("Unable to dequeue a cell for identifier \(FlagCollectionViewCell.reuseIdentifier)") }
			let flagImage = UIImage(named: state.rawValue)
			cell.imageView.image = flagImage
			return cell
		}
		return dataSource
	}()
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - View Controller Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.dataSource = dataSource
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Actions
	@IBAction func changeSorting(_ sender: UISegmentedControl) {
		
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Private Methods
	private func sortDataSource() {
		
	}
}
