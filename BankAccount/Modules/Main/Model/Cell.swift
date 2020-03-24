//
//  Cell.swift

//
//  Created by Egor Syrtcov on 3/22/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import ObjectMapper

struct Cell: Codable  {
    let cells: [Cells]?
}

extension Cell: ImmutableMappable {
    
    init(map: Map) throws {
        cells = try map.value("cells")
    }
    
    func mapping(map: Map) {
        cells >>> map["cells"]
    }
}
