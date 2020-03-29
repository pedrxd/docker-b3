# Big Brother Bot (B3) as Docker
Runs current latest head from master at https://github.com/BigBrotherBot/big-brother-bot

Supports sqlite database as well as an external MariaDB/MySQL database.

# Usage
Create `config` folder with following folder structure:
```
/config
├── conf
├── extplugins
├── parsers
└── b3.xml
```
All folders are optional, i.e. if you don't use custom parsers, you don't have to create the directory `parsers` and the default parsers from the Big Brother Bot repo will be used. However, if you *do* create the folder, make sure to add *ALL* parsers you use, not just the custom ones.

If no b3.xml exist, a new one will be created using the environment values.

On default configuration logs are read from **/var/log/games.log**

## docker run
`docker run -ti -v /your/config/path:/config -v /yourlog/log.log:/var/log/games.log --rm pedrxd/bigbrotherbot`

## Environment
`B3_PARSER`: *default: iourt43*

`B3_DATABASE`: *default: sqlite://@conf/database.sqlite*

`B3_BOTNAME`: *default: b3*

`B3_BOTPREFIX`: *default: ^0(^2b3^0)^7:*

`B3_RCONPASSWORD`: *No default*

`B3_GAMEIP`: *default: 127.0.0.1*

`B3_GAMEPORT`: *default: 27960*
