//
//  TennisScoreViewController.swift
//  TennisScore
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import UIKit

final class TennisScoreViewController: UIViewController {
    
    private(set) var viewModel: TennisScoreViewModel
    
    //MARK:- Init
    
    init(viewModel: TennisScoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Outlets
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playerAScoreButton: UIButton!
    @IBOutlet weak var playerBScoreButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBarTitle()
        addActions()
        reset()
    }
    
    //MARK: - UI
    private func addActions() {
        playerAScoreButton.addTarget(self, action: #selector(playerAScoreButtonAction), for: .touchUpInside)
        playerBScoreButton.addTarget(self, action: #selector(playerBScoreButtonAction), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetButtonAction), for: .touchUpInside)
    }
    
    private func reset() {
        viewModel.reset()
        scoreLabel.text = "Love All!"
    }
    
    private func updateUI(player: Player) {
        let point = viewModel.score(for: player)
        scoreLabel.text = point.score
    }
    
    private func setupNavBarTitle() {
        self.navigationItem.title = "Tennis Score"
    }
    
    //MARK: - Actions

    @objc private func playerAScoreButtonAction() {
        updateUI(player: .playerA)
    }
    
    @objc private func playerBScoreButtonAction() {
        updateUI(player: .playerB)
    }
    
    @objc private func resetButtonAction() {
        reset()
    }
}
