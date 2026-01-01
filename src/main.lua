function love.load()
  -- first it checks if it's a phone
  if love.system.getOS() == "Android" or love.system.getOS() == "iOS" then
    is_phone = true
  else
    is_phone = false
  end

  -- loads file!
  love.filesystem.init(love)
  if love.filesystem.getInfo(data.txt) == nil then
    data_write("a")
  else
    local size = love.filesystem.getInfo(data.txt)
    local loaded_data = love.filesystem.read("data.txt", size.size)
    
  end

end

function phoney_vibrate()
  if is_phone == true then
    love.system.vibrate(0.2)
  end
end

function data_write(data)
    local write_data = love.data.compress("lz4", "string", data, -1)
    love.filesystem.write(data.txt, write_data)
end
