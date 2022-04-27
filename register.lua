-- ============================================================= --
-- BULK FILL MOD
-- ============================================================= --
bulkFillREGISTER = {}

g_specializationManager:addSpecialization('bulkFill', 'BulkFill', Utils.getFilename('BulkFill.lua', g_currentModDirectory), nil)

for vehicleName, vehicleType in pairs(g_vehicleTypeManager.types) do
	if  SpecializationUtil.hasSpecialization(FillUnit, vehicleType.specializations) and
		SpecializationUtil.hasSpecialization(FillVolume, vehicleType.specializations) and
		SpecializationUtil.hasSpecialization(Cover, vehicleType.specializations)
	then
		g_vehicleTypeManager:addSpecialization(vehicleName, g_currentModName .. '.bulkFill')
	end
end