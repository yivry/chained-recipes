require("data-util")
require("prefix")

addchain("logistics/chest")
addchain("logistics/combinator")
addchain("logistics/inserter")
addchain("logistics/pole")
addchain("logistics/rail-signal")
addchain("logistics/train")
addchain("logistics/vehicle")

addchain("production/chemical")
addchain("production/energy")
addchain("production/extraction")
addchain("production/furnace")

addchain("military/armor")
addchain("military/artillery") -- depends on the "logistics/train" chain
addchain("military/gun")
addchain("military/rocket")
addchain("military/shell")

create_item_subgroup("intermediate-products", pf("intermediates"), "i")
