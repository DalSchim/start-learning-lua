ENT.base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "My Prop Box"
ENT.Author = "Me"
ENT.Category = "My Stuff"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:Initialize()
    if SERVER then
        self:SetModel("models/props_junk/wood_crate001a.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
        end
    end
end
-- si le joueur prend une entité et le rentre en collision avec la boite alors on ajoute l'entité à la boite
function ENT:addProp()
    local ply = self:GetOwner()
    local tr = ply:GetEyeTrace()
    local ent = tr.Entity
    if ent:IsValid() then
        local phys = ent:GetPhysicsObject()
        if phys:IsValid() then
            phys:EnableMotion(false)
            phys:Sleep()
        end
        ent:SetParent(self)
        ent:SetPos(self:WorldToLocal(ent:GetPos()))
    end
end
    

