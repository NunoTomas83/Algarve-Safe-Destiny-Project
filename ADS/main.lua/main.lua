-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local sqlite3 = require ("sqlite3")
local myNewData 
local json = require ("json")
local decodedData

local SaveData = function ()
  
  local path1 = system.pathForFile("adsConnection.sqlite", system.ResourceDirectory)
  db1 = sqlite3.open(path1)

  
  local tablefill ="DELETE FROM tab1;"
  db1:exec( tablefill )
  local counter = 1
  local index = "movie"..counter
  local movie = decodedData[index]
  while (movie ~=nil) do
    local tablefill ="INSERT INTO tab1 VALUES ('" .. movie[1] .. "','" .. movie[2] .. "','" .. movie[3] .. "','" .. movie[4] .."');"
    db1:exec( tablefill )
    counter=counter+1
    index = "movie"..counter
    movie = decodedData[index]
  end 






  --[[-- conteudo
  local tablefill ="DELETE FROM Conteudo;"
  db1:exec( tablefill )
  local counter = 1
  local index = "conteudo"..counter
  local movie = decodedData[index]
  while (movie ~=nil) do
    local tablefill ="INSERT INTO Conteudo VALUES ('" .. movie[1] .. "','" .. movie[2] .. "','" .. movie[3] .."');"
    db1:exec( tablefill )
    counter=counter+1
    index = "conteudo"..counter
    movie = decodedData[index]
  end    

  -- idiomas
  tablefill ="DELETE FROM Idiomas;"
  db1:exec( tablefill )
  counter = 1
  index = "idiomas"..counter
  movie = decodedData[index]
  while (movie ~=nil) do
  	local tablefill ="INSERT INTO Idiomas VALUES ('" .. movie[1] .. "','" .. movie[2] .. "');"
    db1:exec( tablefill )
    counter=counter+1
    index = "idiomas"..counter
    movie = decodedData[index]
  end

  db1:close()
end]]

end

local function networkListener( event )
  if ( event.isError ) then
    print( "Network error!")
  else
    myNewData = event.response
    print ("From server: "..myNewData)
    decodedData = (json.decode( myNewData))
    SaveData()
  end
end
 
network.request( "http://localhost:8888/connect.php", "GET", networkListener )