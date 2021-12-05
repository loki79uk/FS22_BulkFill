-- ============================================================= --
-- BULK FILL MOD
-- ============================================================= --
bulkFillREGISTER = {};

g_specializationManager:addSpecialization('bulkFill', 'BulkFill', Utils.getFilename('BulkFill.lua', g_currentModDirectory), true)

for vehicleName, vehicleType in pairs(g_vehicleTypeManager.types) do
	if  SpecializationUtil.hasSpecialization(FillUnit, vehicleType.specializations) and
		SpecializationUtil.hasSpecialization(FillVolume, vehicleType.specializations) and
		SpecializationUtil.hasSpecialization(Cover, vehicleType.specializations)
	then
		g_vehicleTypeManager:addSpecialization(vehicleName, 'bulkFill')
	end
end