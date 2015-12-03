//
//  ViewController.swift
//  Algolia Test
//
//  Created by Max Schoening on 12/3/15.
//  Copyright © 2015 Canvas. All rights reserved.
//

import UIKit
import AlgoliaSearch

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let client = AlgoliaSearch.Client(appID: "ALGOLIASEARCH_APPLICATION_ID", apiKey: "ALGOLIASEARCH_SECURED_API_KEY")
		let index = client.getIndex("YourIndex")

		// repeat the security filters here
		client.setExtraHeader("facetFilters=(collection_id:COLLECTION_ID)", forKey: "X-Algolia-QueryParameters")

		index.search(Query(query: "YourQuery"), block: { (content, error) -> Void in
			if let error = error {
				print(error)
			} else {
				print(content)
			}
		})
	}
}
