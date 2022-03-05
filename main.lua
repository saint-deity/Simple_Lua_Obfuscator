local fs = require('fs')
local args={...}
if #args==0 then error("No data suplied") end
local file,err = fs.read_file(args[1])
if not file then error(err) end
local converted=(function()
    local d={}
    for i=20,50 do
        table.insert(d,string.char(i))
    end
    return d
end)()
file=file.."  "
local OF = fs.read_file("base.lua")

local char=utf8.char
local byte = utf8.codepoint

local function randomKey(Len,new)
    new=new or converted 
    math.randomseed(os.time()+#file-#fs+Len)
    local string = ''
    for i = 1, Len do 
        string = string.format('%s%s', string, new[math.random(1, #new)])
    end 
    return string 
end 

local function encode(str,keyInput)
    local out={}
    str:gsub('.',function(k)
        table.insert(out,(byte(k)+keyInput))
    end)
    return out
end

local function str(obj,d)
    return obj:gsub('.',function(l)
        return l..d
    end)
end

local function main()
    math.randomseed(os.time())
    local key=randomKey(math.random(3,5))
    local keyInput=(function()
        local keyInput=0
        key:gsub('.',function(l)
            keyInput=keyInput+byte(l)
        end)
        return keyInput
    end)()
    local encCode=encode(file,keyInput)
    local EncodedCode = table.concat(encCode,","):sub(1,#table.concat(encCode,",")-1)
    local dd={"A","B","C","D","E","F","G","H","I","J","K","O","L"}
    local docs={randomKey(10,dd),randomKey(10,dd),randomKey(10,dd),randomKey(10,dd), randomKey(10,dd)}
    local format=OF:gsub("KEYINPUT",tostring(keyInput)):gsub("CODE",EncodedCode):gsub("utf82",function(l)
        return str(l:sub(1,4),docs[1])
    end):gsub("utfEncode82",docs[2]):gsub('utf83',function(l)
        return str(l:sub(1,4),docs[2])
    end):gsub("utfEncode83",docs[3]):gsub('codepoint1',function(l)
        return str(l:sub(1,#l-1),docs[4])
    end):gsub("encodecodepoint.1",docs[4]):gsub("char1",function(l)
        return str('char',docs[5])
    end):gsub('enchar.1',docs[5])
    fs.write_file("output.lua",format)
    os.execute("lua .\\minifier.lua \"output.lua\"")
    fs.write_file("output.lua",'')
end

main()