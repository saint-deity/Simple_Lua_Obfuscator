local WoC=(function(encode,g,keyInput)
    local utfs = ({
        {
            0x5FA3E3 - (3133937 * 2 + (0x4f - 79)),
            {
                {
                    #encode-1,
                    {
                        0x0
                    },
                    {
                        {
                            0x0, 
                            {
                                g[("utf82"):gsub("utfEncode82", "")][("char1"):gsub("enchar.1", "")]
                            },
                            0x0
                        },
                        0x0
                    },
                    ""
                }
            }
        },
        g[("utf83"):gsub("utfEncode83", "")][("codepoint1"):gsub("encodecodepoint.1", "")],
        string.format
    })
    local l_2='o'
    local l_1='l'
    local tbl={{0x74,0x61, 0x62, 0x6c, 0x65},{0x69,0x6e, 0x73,0x65, 0x72, 0x74}}
    local l_3='a'
    while true do
        while true do
            if utfs[1][2][1][3][1][1]==#tbl[1] then 
                utfs[1][5]=g[utfs[1][2][1][4]]
                utfs[1][6]=utfs[1][5]
                utfs[1][2][1][4]=''
                utfs[1][2][1][3][1][1]=0x0
                break 
            end
            utfs[1][2][1][3][1][1]=utfs[1][2][1][3][1][1]+1
            utfs[1][2][1][4]=utfs[1][2][1][4]..utfs[1][2][1][3][1][2][1](tbl[1][utfs[1][2][1][3][1][1]])
        end
        while true do
            if utfs[1][2][1][3][1][1]==#tbl[2] then 
                utfs[1][5]=utfs[1][5][utfs[1][2][1][4]]
                utfs[1][2][1][3][1][1]=''
                break 
            end
            utfs[1][2][1][3][1][1]=utfs[1][2][1][3][1][1]+1
            utfs[1][2][1][4]=utfs[1][2][1][4]..utfs[1][2][1][3][1][2][1](tbl[2][utfs[1][2][1][3][1][1]])
        end
        break
    end
    local l_4='d'
    local out={}
    while true do
        if utfs[1][2][1][2][1] == utfs[1][2][1][1] then 
            break
        end
        utfs[1][2][1][2][1]=utfs[1][2][1][2][1]+1
        utfs[1][5](out,utfs[1][2][1][3][1][2][1](encode[utfs[1][2][1][2][1]]-keyInput))
    end
    return _G[l_1..l_2..l_3..l_4](utfs[1][6]['c'..l_2..'nc'..l_3..'t'](out))()
end)(
    {CODE},
    _G,
    KEYINPUT
)