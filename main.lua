--Delta's Model Loader
--[[

info : 
a simple model thingy

making models :
this is a model parser for scripts that use models.
to make a model, simply install the plugin >
then select what you want to make the model out of, and click the plugin button.
this will give you a string. this is your model.


--]]
function parsepart(ps)
    np = ps:split(":")
    n5ame = np[2]
    ctype = np[1]
    ts = ps:split(",")
    x = ts[2]
    y = ts[3]
    z = ts[4]
    ox = ts[5]
    oy = ts[6]
    oz = ts[7]
    sx = ts[8]
    sy = ts[9]
    sz = ts[10]
    gArray = {}
    gArray.name = n5ame
    gArray.class = ctype
    gArray.pos = Vector3.new(x,y,z)
    gArray.size = Vector3.new(sx,sy,sz)
    gArray.rot = Vector3.new(ox,oy,oz)
    return gArray
end
function parsemodelstring(ms)
--Part:Name:,X,Y,Z,OX,OY,OZ,SX,SY,SZ,~Part:Name:,X,Y,Z,~Part:Name:,X,Y,Z,~
seperateparts = ms:split("~")
mArray = {}
mArray.count = #seperateparts-1
for c=1,#seperateparts-1 do
    mArray["part"..c] = parsepart(seperateparts[c])
    
end
return mArray
end
function buildmodel(name,array)
    model = {}
    for c=1,array.count do
        partv = mArray["part"..c]
        model = Instance.new("Model",workspace)
        model.Name = name
        part = Instance.new(partv.class,model)
        part.Name = partv.name
        part.Anchored = true
        part.Size = partv.size
        part.Orientation = partv.orientation
        model[part.Name] = part
    end
    return model
end
