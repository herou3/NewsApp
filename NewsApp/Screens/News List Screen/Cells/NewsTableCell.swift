//
//  NewsTableCell.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 12/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class NewsTableCell: DefaultCell {
	
	// MARK: - Init table cell
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("Init(coder!) has not been implemented")
	}
	
	// MARK: - Create UIElements for cell
	private var newsImageView: CachedImageView = {
		let imageView = CachedImageView()
		imageView.image = UIImage(named: "unknown-icon")
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	private var titleLabel: UILabel = {
		let nameLabel = UILabel()
		nameLabel.text = "default string"
		nameLabel.textColor = .black
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.font = UIFont.systemFont(ofSize: 18)
		nameLabel.numberOfLines = 2
		return nameLabel
	}()
	
	private var dateLabel: UILabel = {
		let statusLabel = UILabel()
		statusLabel.text = "Dead"
		statusLabel.textColor = .gray
		statusLabel.font = UIFont.systemFont(ofSize: 12)
		statusLabel.translatesAutoresizingMaskIntoConstraints = false
		return statusLabel
	}()
	
	private var decriptionLabel: UILabel = {
		let speciesLabel = UILabel()
		speciesLabel.text = "Humanoid"
		speciesLabel.textColor = .gray
		speciesLabel.font = UIFont.systemFont(ofSize: 12)
		speciesLabel.translatesAutoresizingMaskIntoConstraints = false
		return speciesLabel
	}()
	
	// MARK: - Configure CharacterTableCell
	private func addCharacterImageView() {
		addSubview(newsImageView)
		newsImageView.leftAnchor.constraint(equalTo: self.leftAnchor,
																						 constant: Constant.marginLeftAndRightValue / 2).isActive = true
		newsImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
																							 constant: -Constant.marginLeftAndRightValue / 2).isActive = true
		newsImageView.topAnchor.constraint(equalTo: self.topAnchor,
																						constant: Constant.marginLeftAndRightValue / 2).isActive = true
		newsImageView.widthAnchor.constraint(equalToConstant: Constant.imageSizeValue).isActive = true
		newsImageView.heightAnchor.constraint(equalToConstant: Constant.imageSizeValue).isActive = true
	}
	
	private func addNameLabel() {
		addSubview(titleLabel)
		titleLabel.leftAnchor.constraint(equalTo: self.newsImageView.rightAnchor,
																		constant: Constant.marginLeftAndRightValue / 2).isActive = true
		titleLabel.topAnchor.constraint(equalTo: self.newsImageView.topAnchor).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
																		 constant: -Constant.marginLeftAndRightValue / 2).isActive = true
		titleLabel.heightAnchor.constraint(equalToConstant: Constant.labelSizeValue / 5).isActive = true
	}
	
	private func addStatusLabel() {
		addSubview(dateLabel)
		dateLabel.leftAnchor.constraint(equalTo: self.newsImageView.rightAnchor,
																			constant: Constant.marginLeftAndRightValue / 2).isActive = true
		dateLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,
																		 constant: Constant.marginLeftAndRightValue / 2).isActive = true
		dateLabel.heightAnchor.constraint(equalToConstant: Constant.labelSizeValue / 6).isActive = true
		dateLabel.widthAnchor.constraint(equalToConstant: Constant.imageSizeValue).isActive = true
	}
	
	private func addSpeciesLabel() {
		addSubview(decriptionLabel)
		decriptionLabel.leftAnchor.constraint(equalTo: self.dateLabel.rightAnchor,
																			 constant: Constant.marginLeftAndRightValue / 2).isActive = true
		decriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,
																			constant: Constant.marginLeftAndRightValue / 2).isActive = true
		decriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
																				constant: -Constant.marginLeftAndRightValue / 2).isActive = true
		decriptionLabel.heightAnchor.constraint(equalToConstant: Constant.labelSizeValue / 6).isActive = true
	}
	
	override func setupViews() {
		addCharacterImageView()
		addNameLabel()
		addStatusLabel()
		addSpeciesLabel()
	}
	
	func configureData(viewModel: NewsListTableCellViewModelProtocol) {
		newsImageView.loadImage(urlString: viewModel.image)
		titleLabel.text = viewModel.title
		dateLabel.text = viewModel.date
		decriptionLabel.text = viewModel.decription
	}
}
