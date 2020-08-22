//
//  FlagCollectionViewCell.swift
//  DiffableDataSource
//
//  Created by Chad Rutherford on 8/22/20.
//  Copyright © 2020 chadarutherford.github.io. All rights reserved.
//

import UIKit

protocol ReuseIdentifying {
	static var reuseIdentifier: String { get }
}

class FlagCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var imageView: UIImageView!
}

extension FlagCollectionViewCell: ReuseIdentifying {
	static var reuseIdentifier: String {
		return String(describing: Self.self)
	}
}
