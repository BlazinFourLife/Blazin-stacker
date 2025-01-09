fx_version 'cerulean'
game 'gta5'

author 'Blazin'
description 'Blazins Stacker Script'
version '1.0.1'

-- Shared configuration
shared_scripts {
    'config.lua', -- Configuration file
}

-- Server scripts
server_scripts {
    '@qb-core/shared.lua', -- QBCore dependency
    'server/main.lua', -- Server-side script
}                                                                          --WONT WORK WITH OX INV DUE TO OX USES MARKEDBILLS AS AN ITEM.

-- Client scripts
client_scripts {
    '@qb-core/shared.lua', -- QBCore dependency
    'client/main.lua', -- Client-side script
}

-- Optional: Dependency declaration
dependencies {
    'qb-core', -- Assuming you are using QBCore framework
}

escrow_ignore {
'shared_scripts/*.lua'
}