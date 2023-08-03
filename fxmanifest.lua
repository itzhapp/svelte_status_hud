fx_version 'cerulean'

games {'gta5', 'rdr3'}

author 'itzhapp'
version '1.0.0'

lua54 'yes'

ui_page 'web/build/index.html'

shared_script '@ox_lib/init.lua'

client_script {
  'client/**/*'
}

server_script {
  '@oxmysql/lib/MySQL.lua',
  'server/**/*',
}

files {
  'web/build/index.html',
  'web/build/**/*'
}
