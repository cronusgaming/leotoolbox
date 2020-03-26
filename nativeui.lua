_menuPool = NativeUI.CreatePool()
-- Create Main Menu to Select Department
mainMenu = NativeUI.CreateMenu("LEO Vehicle Menu", "~b~SELECT YOUR VEHICLE")
_menuPool:Add(mainMenu)
vehMenu = false

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function stateMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "State Police Vehicles")
    for i = 1, 1 do
        local Item = NativeUI.CreateItem("2014 Charger", "Spawn State 2014 Charger")
        Item.Activated = function(ParentMenu, SelectedItem)
            spawnCar("14Chgr")
        end
        local Item2 = NativeUI.CreateItem("2016 Explorer", "Spawn State 2016 Explorer")
        Item2.Activated = function(ParentMenu, SelectedItem)
            spawnCar("16Exp")
        end
        local Item3 = NativeUI.CreateItem("2018 Charger", "Spawn State 2018 Charger")
        Item3.Activated = function(ParentMenu, SelectedItem)
            spawnCar("18Chgr")
        end
        local Item4 = NativeUI.CreateItem("2019 Tahoe", "Spawn State 2019 Tahoe")
        Item4.Activated = function(ParentMenu, SelectedItem)
            spawnCar("19Hoe")
        end
        local Item5 = NativeUI.CreateItem("Caprice", "Spawn State Caprice")
        Item5.Activated = function(ParentMenu, SelectedItem)
            spawnCar("Cap")
        end
        local Item6 = NativeUI.CreateItem("Ford Taurus", "Spawn State Ford Taurus")
        Item6.Activated = function(ParentMenu, SelectedItem)
            spawnCar("Tau")
        end
        local Item7 = NativeUI.CreateItem("CVPI", "Spawn State CVPI")
        Item7.Activated = function(ParentMenu, SelectedItem)
            spawnCar("Vic")
        end
    submenu.SubMenu:AddItem(Item)
    submenu.SubMenu:AddItem(Item2)
    submenu.SubMenu:AddItem(Item3)
    submenu.SubMenu:AddItem(Item4)
    submenu.SubMenu:AddItem(Item5)
    submenu.SubMenu:AddItem(Item6)
    submenu.SubMenu:AddItem(Item7)
    end
end

function sheriffMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Sheriff Vehicles")
    for i = 1, 1 do
        local Item = NativeUI.CreateItem("2018 Charger", "Spawn Sheriff 2018 Charger")
        Item.Activated = function(ParentMenu, SelectedItem)
            spawnCar("charger")
        end
        local Item2 = NativeUI.CreateItem("CVPI", "Spawn Sheriff CVPI")
        Item2.Activated = function(ParentMenu, SelectedItem)
            spawnCar("crownvic")
        end
        local Item3 = NativeUI.CreateItem("2019 Durango", "Spawn Sheriff 2019 Durango")
        Item3.Activated = function(ParentMenu, SelectedItem)
            spawnCar("durango")
        end
        local Item4 = NativeUI.CreateItem("2016 Explorer", "Spawn Sheriff 2016 Explorer")
        Item4.Activated = function(ParentMenu, SelectedItem)
            spawnCar("explorer")
        end
        local Item5 = NativeUI.CreateItem("Impala", "Spawn Sheriff Impala")
        Item5.Activated = function(ParentMenu, SelectedItem)
            spawnCar("impala")
        end
        local Item6 = NativeUI.CreateItem("2019 Tahoe", "Spawn Sheriff 2019 Tahoe")
        Item6.Activated = function(ParentMenu, SelectedItem)
            spawnCar("tahoe")
        end
        local Item7 = NativeUI.CreateItem("2006 Tahoe", "Spawn Sheriff 2006 Tahoe")
        Item7.Activated = function(ParentMenu, SelectedItem)
            spawnCar("tahoe06")
        end
        local Item8 = NativeUI.CreateItem("2013 Tahoe", "Spawn Sheriff 2013 Tahoe")
        Item8.Activated = function(ParentMenu, SelectedItem)
            spawnCar("tahoe13")
        end
        local Item9 = NativeUI.CreateItem("Ford Taurus", "Spawn Sheriff Ford Taurus")
        Item9.Activated = function(ParentMenu, SelectedItem)
            spawnCar("taurus")
        end
        local Item10 = NativeUI.CreateItem("Kawasaki", "Spawn Sheriff Kawasaki")
        Item10.Activated = function(ParentMenu, SelectedItem)
            spawnCar("kawasaki")
        end
    submenu.SubMenu:AddItem(Item)
    submenu.SubMenu:AddItem(Item2)
    submenu.SubMenu:AddItem(Item3)
    submenu.SubMenu:AddItem(Item4)
    submenu.SubMenu:AddItem(Item5)
    submenu.SubMenu:AddItem(Item6)
    submenu.SubMenu:AddItem(Item7)
    submenu.SubMenu:AddItem(Item8)
    submenu.SubMenu:AddItem(Item9)
    submenu.SubMenu:AddItem(Item10)
    end
end

sheriffMenu(mainMenu)
stateMenu(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        Policeped = PlayerPedId()
        _menuPool:ProcessMenus()
        if vehMenu == true then
            mainMenu:Visible(not mainMenu:Visible())
            vehMenu = false
        end
    end
end)

-- End Vehicles Menu
-- Start LEO Menu
leoMenu = NativeUI.CreateMenu("LEO Toolbox", "~b~REALITY ROLEPLAY LEO UTILITIES MENU")
_menuPool:Add(leoMenu)
leostuff = false

function cuffOption(menu)
    local Item = NativeUI.CreateItem("Cuff", "Cuff the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        cuffPlayer()
    end
    menu:AddItem(Item)
end

function uncuffOption(menu)
    local Item = NativeUI.CreateItem("Uncuff", "Uncuff the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        uncuffPlayer()
    end
    menu:AddItem(Item)
end

function dragOption(menu)
    local Item = NativeUI.CreateItem("Drag", "Drag the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        dragPlayer()
    end
    menu:AddItem(Item)
end

function undragOption(menu)
    local Item = NativeUI.CreateItem("Stop Dragging", "Stop dragging the person closest to you")
    menu.OnItemSelect = function(sender, item, index)
        undragPlayer()
    end
    menu:AddItem(Item)
end

function evehOption(menu)
    local Item = NativeUI.CreateItem("Make Player Enter Vehicle", "Make the person closest to you enter the vehicle closest to you")
    menu.OnItemSelect = function(sender, item, index)
        evehiclePlayer()
    end
    menu:AddItem(Item)
end

function lvehOption(menu)
    local Item = NativeUI.CreateItem("Make Player Exit Vehicle", "Make the person closest to you exit the vehicle closest to you")
    menu.OnItemSelect = function(sender, item, index)
        lvehiclePlayer()
    end
    menu:AddItem(Item)
end

function entityOption(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Spawn Objects")
    for i = 1, 1 do
        local Item = NativeUI.CreateItem("Steel Barrier", "Spawn Steel Barrier")
        Item.Activated = function(ParentMenu, SelectedItem)
            spawnEntity("prop_barrier_work04a")
        end
        local Item2 = NativeUI.CreateItem("Wood Barrier", "Spawn Wood Barrier")
        Item2.Activated = function(ParentMenu, SelectedItem)
            spawnEntity("prop_barrier_work05")
        end
        local Item4 = NativeUI.CreateItem("Road Work LED", "Spawn Road Work LED Sign")
        Item4.Activated = function(ParentMenu, SelectedItem)
            spawnEntity("prop_trafficdiv_01")
        end
    submenu:AddItem(Item)
    submenu:AddItem(Item2)
    submenu:AddItem(Item3)
    submenu:AddItem(Item4)
    end
end

function despawnOption(menu)
    local amount = {}
    for i = 1, 100 do amount[i] = i end
    local Item = NativeUI.CreateSliderItem("Despawn Objects", amount, 5, "Despawn all objects within a radius", false)
    menu.OnItemSelect = function(sender, item, index)
        rad = item:IndexToItem(index)
        despawnProp(rad)
    end
    menu:AddItem(Item)
end

cuffOption(leoMenu)
uncuffOption(leoMenu)
dragOption(leoMenu)
undragOption(leoMenu)
evehOption(leoMenu)
lvehOption(leoMenu)
despawnOption(leoMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 166) then
			TriggerServerEvent("checkRoles", "leomenu")
        end
		if showMenu == true then
			leoMenu:Visible(not leoMenu:Visible())
			showMenu = false
		end
    end
end)

RegisterNetEvent("lmenu")
AddEventHandler("lmenu", function()
	showMenu = true
end)