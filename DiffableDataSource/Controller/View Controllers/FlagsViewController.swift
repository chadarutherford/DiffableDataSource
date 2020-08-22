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
	typealias FlagsSnapshot = NSDiffableDataSourceSnapshot<Int, States>
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
		sortDataSource()
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Actions
	@IBAction func changeSorting(_ sender: UISegmentedControl) {
		sortDataSource()
	}
	
	// --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
	// MARK: - Private Methods
	private func sortDataSource() {
		var snapshot = FlagsSnapshot()
		var states = self.states
		
		switch sortSegmentedControl.selectedSegmentIndex {
		case 0:
			break
		case 1:
			states.reverse()
		case 2:
			states.shuffle()
		default:
			break
		}
		// Determine how the collectionView should be structured
		// How many sections
		// How many cells
		// What information should the cells contain
		
		// Create a single section
		snapshot.appendSections([0])
		
		// Create a cell for each state in the array
		snapshot.appendItems(states)
		
		// This makes the collectionView show information
		dataSource.apply(snapshot, animatingDifferences: true)
	}
}
