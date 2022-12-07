
local isDead = false
Citizen.CreateThread(function()
   while true do
      Citizen.Wait(0)
      if not isDead then
         for k,v in pairs(Config['Weapon']) do
            local WeaponHash = GetHashKey(k)
            N_0x4757f00bc6323cfe(WeaponHash, 0.00001 * v["Damage"])
            if HasPedBeenDamagedByWeapon(PlayerPedId(), WeaponHash, 0) then
               if v.Critical then
                  if math.random(1,100) < v.Percent then
                     SetPedSuffersCriticalHits(GetPlayerPed(-1), true)
                  end
               else
                  SetPedSuffersCriticalHits(GetPlayerPed(-1), false)
               end
               break
            end
         end
      end
   end
end)