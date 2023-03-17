require "Items/ProceduralDistributions"

Polaroids = Polaroids or {}

function Polaroids.InsertDistributions(pool, item, count)
    ProceduralDistributions = ProceduralDistributions or {}
    ProceduralDistributions.list = ProceduralDistributions.list or {}
    ProceduralDistributions.list[pool] = ProceduralDistributions.list[pool] or {}
    ProceduralDistributions.list[pool].items = ProceduralDistributions.list[pool].items or {}
    table.insert(ProceduralDistributions.list[pool].items, item)
    table.insert(ProceduralDistributions.list[pool].items, count)
end

Polaroids.InsertDistributions("CameraStoreDisplayCase", "Polaroids.PolaroidCamera", 20)
Polaroids.InsertDistributions("CameraStoreDisplayCase", "Polaroids.PolaroidCamera", 20)
Polaroids.InsertDistributions("CameraStoreDisplayCase", "Polaroids.PolaroidCamera", 10)
Polaroids.InsertDistributions("CameraStoreDisplayCase", "Polaroids.PolaroidCamera", 10)

Polaroids.InsertDistributions("ElectronicStoreMisc", "Polaroids.PolaroidCamera", 10)
Polaroids.InsertDistributions("GigamartHouseElectronics", "Polaroids.PolaroidCamera", 10)
Polaroids.InsertDistributions("StoreShelfElectronics", "Polaroids.PolaroidCamera", 10)

Polaroids.InsertDistributions("CameraStoreShelves", "Polaroids.PolaroidCamera", 20)
Polaroids.InsertDistributions("CameraStoreShelves", "Polaroids.PolaroidCamera", 20)
Polaroids.InsertDistributions("CameraStoreShelves", "Polaroids.PolaroidCamera", 10)
Polaroids.InsertDistributions("CameraStoreShelves", "Polaroids.PolaroidCamera", 10)

Polaroids.InsertDistributions("LivingRoomShelf", "Polaroids.PolaroidCamera", 3)

Polaroids.InsertDistributions("LivingRoomShelf", "Polaroids.PhotoAlbum", 5)
Polaroids.InsertDistributions("LivingRoomShelf", "Polaroids.PhotoAlbum", 5)

Polaroids.InsertDistributions("LivingRoomShelfNoTapes", "Polaroids.PhotoAlbum", 5)
Polaroids.InsertDistributions("LivingRoomShelfNoTapes", "Polaroids.PhotoAlbum", 5)
