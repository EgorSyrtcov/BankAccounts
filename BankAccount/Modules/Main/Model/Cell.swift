//
//  Cell.swift

//
//  Created by Egor Syrtcov on 3/22/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import ObjectMapper

struct Cell: Codable  {
    let items: [CellItem]?
}

extension Cell: ImmutableMappable {
    
    init(map: Map) throws {
        items = try map.value("cells")
    }
    
    func mapping(map: Map) {
        items >>> map["cells"]
    }
}
