require("prefix")

-- Generic helper functions

function addchain (name)
    require("chains/" .. name .. "-chain")
end

function pflog (message)
    log(pf(" " .. message))
end

function table_contains (t, element)
    for key, value in pairs(t) do
        if (value == element) then return key end
    end

    return nil
end


-- Factorio-specific functions

function cfg_start (setting)
    local config = settings.startup[pf(setting)]

    if not config then
        pflog("Cannot get startup setting '" .. pf(setting) .. "': it doesn't exist.")
        return;
    end

    return config.value
end

function duplicate_proto (typeName, name, changes)
    local raw = data.raw[typeName]

    if not raw then
        pflog("Cannot duplicate prototype '" .. name .. "': type '" .. typeName .. "' doesn't exist.")
        return
    end

    local original = raw[name]

    if not original then
        pflog("Cannot duplicate prototype '" .. typeName .. "." .. name .. "': it doesn't exist.")
        return
    end

    local duplicate = table.deepcopy(original)
    duplicate.name = pf(name)

    for key, value in pairs(changes) do
        duplicate[key] = value
    end

    data:extend({duplicate})
end


-- Recipe functions

function modify_ingredients (new_recipe)
    local recipe = data.raw.recipe[new_recipe.name]

    if not recipe then
        pflog("Cannot modify non-existing recipe '" .. new_recipe.name .. "'.")
        return
    end

    if recipe.ingredients and new_recipe.ingredients then
        recipe.ingredients = new_recipe.ingredients
        return
    end

    if not recipe.normal or not recipe.expensive  or not new_recipe.normal or not new_recipe.expensive then
        pflog("Cannot modify '" .. recipe.name .. "': either it or the new doesn't have normal/expensive.")
        return
    end

    recipe.normal.ingredients = new_recipe.normal.ingredients
    recipe.expensive.ingredients = new_recipe.expensive.ingredients
end

-- simple means we don't support different normal/expensive
function create_simple_recipe (recipe)
    if type(recipe.name) ~= "string" then
        pflog("Cannot create a recipe without valid name.")
        return
    end
    
    if not recipe.ingredients or type(recipe.ingredients) ~= "table" or #recipe.ingredients == 0 then
        pflog("Cannot create recipe '" .. recipe.name .. "': it doesn't have valid ingredients.")
        return
    end

    if type(recipe.result) == "string" then
        -- All good
    elseif type(recipe.results) ~= "table" or #recipe.results == 0 then
        pflog("Cannot create recipe '" .. recipe.name .. "': it doesn't have valid result(s).")
        return
    end

    recipe.type = "recipe"

    if not recipe.enabled then
        recipe.enabled = false
    end

    if not recipe.energy_required then
        recipe.energy_required = 1
    end

    data:extend({recipe})
end

function duplicate_recipe (name, changes)
    duplicate_proto('recipe', name, changes)
end


-- Item functions

function duplicate_item (name, changes)
    duplicate_proto('item', name, changes)
end

function create_item_subgroup (group, subgroup, order)
    local parent = data.raw['item-group'][group]

    if not parent then
        pflog("Cannot create item subgroup '" .. subgroup .. "': group '" .. group .. "' doesn't exist.")
        return
    end

    local sub = {
        group = group,
        name = subgroup,
        order = order,
        type = "item-subgroup"
    }

    data:extend({sub})
end

-- Tech functions

function add_prereq_to_tech (prereq, techName)
    local technology = data.raw.technology
    local tech = technology[techName]

    if not tech or not technology[prereq] then
        pflog("Cannot add prereq '" .. prereq .. "' to tech '" .. techName .. "': they don't both exist.")
        return
    end

    if not tech.prerequisites then
        tech.prerequisites = {prereq}
    elseif not table_contains(tech.prerequisites, prereq) then
        table.insert(tech.prerequisites, prereq)
    else
        pflog("'" .. prereq .. "' is already a prerequisite of '" .. techName .. "'.")
    end
end

function remove_prereq_from_tech (prereq, techName)
    local technology = data.raw.technology
    local tech = technology[techName]

    if not tech or not technology[prereq] then
        pflog("Cannot remove prereq '" .. prereq .. "' from tech '" .. techName .. "': they don't both exist.")
        return
    end

    if not tech.prerequisites then
        pflog("Cannot remove '" .. prereq .. "' from '" .. techName .. "': it has no prerequisites.")
        return
    end

    prereqPos = table_contains(tech.prerequisites, prereq)

    if not prereqPos then
        pflog("Cannot remove '" .. prereq .. "' from '" .. techName .. "': it is not a prerequisite.")
        return
    end

    table.remove(tech.prerequisites, prereqPos)
end

function add_effect_to_tech (effect, techName)
    local tech = data.raw.technology[techName]

    if not tech then
        pflog("Cannot add effect to '" .. techName .. "': it doesn't exist.")
        return
    end

    if not tech.effects then
        tech.effects = {effect}
    else
        table.insert(tech.effects, effect)
    end
end

function unlock_recipe_with_tech (recipeName, techName)
    add_effect_to_tech({
        recipe = recipeName,
        type = "unlock-recipe",
    }, techName)
end
