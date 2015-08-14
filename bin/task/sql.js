var express = require('express');

var router = express.Router();

module.exports.homeSQL=
    "select count(replay.replayId) as commNum,files.*,count(isgood.good) as goodNum,count(isgood.bad) as badNum  from "+
    "files "+
    "left join isgood on files.id=isgood.fileid  "+
    "left join replay on files.id=replay.fileid  "+
    "where secretLimit<=1 and islongstory<>2  group by files.id order by  files.id";



module.exports.loginHomeSQL=
    "select count(replay.replayId) as commNum,files.*,count(isgood.good) as goodNum,count(isbad.bad) as badNum , "+
    "m.good as choosenGood,n.bad as choosenBad  "+
    "from files  "+
    "left join isgood on files.id=isgood.fileid  "+
    "left join isgood as m on files.id=isgood.fileid  and isgood.username='<username>'  "+
    "left join isbad on files.id=isbad.fileid  "+
    "left join isbad as n on files.id=isbad.fileid  and isbad.username='<username>' "+
    "left join replay on files.id=replay.fileid   "+
    "where (((secretLimit<3 or files.owner='<username>') and secretLimit<>2) or  "+
    "(secretLimit=2 and files.owner in(select friendname from friends where username='<username>'))) "+
    "and islongstory<>2  group by files.id order by files.id; ";

module.exports.longStoreSQL="select * from files  where secretLimit=1 and islongstory=1 order by id  desc";
module.exports.loginLongStoreSQL=
    "select * from files left join isgood on files.id=isgood.fileid and isgood.username='<username>'  "+
    "where (((secretLimit<3 or owner='<username>') and secretLimit<>2) or "+
    "(secretLimit=2 and owner in(select friendname from friends where username='<username>'))) "+
    "and islongstory=1  order by id  desc"