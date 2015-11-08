module.exports.homeSQL=
    "select rp.commNum as commNum,files.*,users.sex as authorSex, users.age as authorAge, users.cityname as authorCity,users.userPhoto as authorPhoto,ig.goodNum as goodNum,ib.badNum as badNum "+
    ",round(agv.avgScore,1) as avgscore "+
    "from files "+
    "left join (select fileid,count(isgood.good) as goodNum from isgood group by fileid) ig on files.Id=ig.fileid "+
    "left join (select fileid,count(isbad.bad) as badNum from isbad group by fileid) ib on files.Id=ib.fileid "+
    "left join (select fileid,count(replay.replayId) as commNum from replay group by fileid) rp on files.Id=rp.fileid "+
    "left join agvscore as agv on files.Id=agv.fileid "+
    "left join users on users.username=files.owner "+
    "where islongstory<>2 "+
    " <where> "+
    " order by files.filetype, files.createTime desc";
module.exports.orderSQL=
    " select rp.commNum as commNum,files.*,users.sex as authorSex, users.age as authorAge, users.cityname as authorCity,users.userPhoto as authorPhoto,ig.goodNum as goodNum,ib.badNum as badNum "+
    ",round(agv.avgScore,1) as avgscore "+
    "from files "+
    "left join (select fileid,count(isgood.good) as goodNum from isgood group by fileid) ig on files.Id=ig.fileid "+
    "left join (select fileid,count(isbad.bad) as badNum from isbad group by fileid) ib on files.Id=ib.fileid "+
    "left join (select fileid,count(replay.replayId) as commNum from replay group by fileid) rp on files.Id=rp.fileid "+
    "left join agvscore as agv on files.Id=agv.fileid "+
    "left join users on users.username=files.owner "+
    "where <where> "+
    " order by files.filetype, files.createTime desc";


module.exports.hotSecretSQL="select count(replay.replayId) as commNum,files.*,count(isgood.good) as goodNum,count(isgood.bad) as badNum "+
    ",round(agv.avgScore,1) as avgscore "+
    "from files "+
    "left join isgood on files.Id=isgood.fileid  "+
    "left join replay on files.Id=replay.fileid  "+
    "left join agvscore as agv on files.Id=agv.fileid "+
    "where secretLimit<=1 and islongstory<>2 "+
    " group by files.Id order by  commNum  desc limit 1,5";



module.exports.loginHomeSQL=
    "select rp.commNum as commNum,files.*,users.sex as authorSex, users.age as authorAge, users.cityname as authorCity,users.userPhoto as authorPhoto,ig.goodNum as goodNum,ib.badNum as badNum, "+
    "isgood.good as choosenGood,isbad.bad as choosenBad ,score.score as userscore , round(agv.avgScore,1) as avgscore "+
    "from files  "+
    "left join (select fileid,good,count(isgood.good) as goodNum from isgood group by fileid) ig on files.Id=ig.fileid "+
    "left join (select fileid,bad,count(isbad.bad) as badNum from isbad group by fileid) ib on files.Id=ib.fileid "+
    "left join (select fileid,count(replay.replayId) as commNum from replay group by fileid) rp on files.Id=rp.fileid "+
    "left join isgood on files.Id=isgood.fileid and isgood.username='<username>' "+
    "left join isbad on files.Id=isbad.fileid and isbad.username='<username>' "+
    "left join score on files.Id=score.fileid and score.username='<username>' "+
    "left join agvscore as agv on files.Id=agv.fileid "+
    "left join users on users.username=files.owner "+
    "where (secretLimit<4 or files.owner='<username>') "+
    "and islongstory<>2 "+
    " <where> "+
    "order by files.filetype, files.createTime  desc";

module.exports.floaterGetSQL=
    "select rp.commNum as commNum,files.* from files "+
    "left join (select fileid,count(replay.replayId) as commNum from replay group by fileid) rp on files.Id=rp.fileid "+
    "where secretMainType='漂流瓶'"+
    " <where> "+
    "order by files.filetype, files.createTime desc limit 1";

module.exports.personalAvgGetSQL = "select username, round(avg(agv.avgScore),1) as average from users "+
"left join files on files.owner=username "+
"left join agvscore as agv on files.Id=agv.fileid "+
"where username in (<username>) "+
"group by username";

module.exports.longStoreSQL="select * from files  where secretLimit=1 and islongstory=1 order by id  desc";
module.exports.loginLongStoreSQL=
    "select * from files left join isgood on files.id=isgood.fileid and isgood.username='<username>'  "+
    "where (((secretLimit<3 or owner='<username>') and secretLimit<>2) or "+
    "(secretLimit=2 and owner in(select friendname from friends where username='<username>'))) "+
    "and islongstory=1  order by id  desc"
