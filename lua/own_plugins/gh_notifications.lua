local scan = require'plenary.scandir'
local res = scan.scan_dir('.', { hidden = true, depth = 2 })
print(res[2])
