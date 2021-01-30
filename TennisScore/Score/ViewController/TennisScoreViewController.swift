//
//  TennisScoreViewController.swift
//  TennisScore
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import UIKit

final class TennisScoreViewController: UIViewController {
    
    private(set) var viewModel: TennisScoreViewModel
    
    init(viewModel: TennisScoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playerAScoreButton: UIButton!
    @IBOutlet weak var playerBScoreButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
