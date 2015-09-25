module.exports.homeSQL=
    "select count(replay.replayId) as commNum,files.*,users.sex as authorSex, users.cityname as authorCity,users.userPhoto as authorPhoto,count(isgood.good) as goodNum,count(isgood.bad) as badNum "+
    ",agv.avgScore as avgscore "+
    "from files "+
    "left join isgood on files.id=isgood.fileid  "+
    "left join replay on files.id=replay.fileid  "+
    "left join agvscore as agv on files.id=agv.fileid "+
    "left join users on users.username=files.owner "+
    "where islongstory<>2 "+
    " <where> "+
    " group by files.id order by files.filetype, files.createTime desc";
module.exports.orderSQL=
    "select count(replay.replayId) as commNum,files.*,count(isgood.good) as goodNum,count(isgood.bad) as badNum "+
    ",agv.avgScore as avgscore "+
    "from files "+
    "left join isgood on files.id=isgood.fileid  "+
    "left join replay on files.id=replay.fileid  "+
    "left join agvscore as agv on files.id=agv.fileid "+
    "where <where> "+
    " group by files.id order by files.filetype, files.createTime desc";


module.exports.hotSecretSQL="select count(replay.replayId) as commNum,files.*,count(isgood.good) as goodNum,count(isgood.bad) as badNum "+
    ",agv.avgScore as avgscore "+
    "from files "+
    "left join isgood on files.id=isgood.fileid  "+
    "left join replay on files.id=replay.fileid  "+
    "left join agvscore as agv on files.id=agv.fileid "+
    "where secretLimit<=1 and islongstory<>2 "+
    " group by files.id order by  commNum  desc limit 1,5";



module.exports.loginHomeSQL=
    "select count(replay.replayId) as commNum,files.*,count(isgood.good) as goodNum1,count(isbad.bad) as badNum1 , "+
    " m.good as choosenGood,n.bad as choosenBad ,score.score as userscore , agv.avgScore as avgscore "+
    "from files  "+
    "left join isgood on files.id=isgood.fileid  "+
    "left join isgood as m on files.id=isgood.fileid  and isgood.username='<username>'  "+
    "left join isbad on files.id=isbad.fileid  "+
    "left join isbad as n on files.id=isbad.fileid  and isbad.username='<username>' "+
    "left join replay on files.id=replay.fileid   "+
    "left join score on files.id=score.fileid and score.username='<username>' "+
    "left join agvscore as agv on files.id=agv.fileid "+
    "where (secretLimit<4 or files.owner='<username>') "+
    "and islongstory<>2  "+
    " <where> "+
    "group by files.id order by files.filetype, files.createTime  desc";

module.exports.floaterGetSQL=
    "select count(replay.replayId) as commNum,files.*,count(isgood.good) as goodNum1,count(isbad.bad) as badNum1 , "+
    " m.good as choosenGood,n.bad as choosenBad ,score.score as userscore , agv.avgScore as avgscore "+
    "from files  "+
    "left join isgood on files.id=isgood.fileid  "+
    "left join isgood as m on files.id=isgood.fileid  and isgood.username='<username>'  "+
    "left join isbad on files.id=isbad.fileid  "+
    "left join isbad as n on files.id=isbad.fileid  and isbad.username='<username>' "+
    "left join replay on files.id=replay.fileid   "+
    "left join score on files.id=score.fileid and score.username='<username>' "+
    "left join agvscore as agv on files.id=agv.fileid "+
    "where (secretMainType='漂流瓶')"+
    " <where> "+
    "group by files.id order by files.filetype, files.createTime  desc";

module.exports.personalAvgGetSQL = "select username, round(avg(agv.avgScore),1) as average from users "+
"left join files on files.owner=username "+
"left join agvscore as agv on files.id=agv.fileid "+
"where username in (<username>) "+
"group by username";

module.exports.longStoreSQL="select * from files  where secretLimit=1 and islongstory=1 order by id  desc";
module.exports.loginLongStoreSQL=
    "select * from files left join isgood on files.id=isgood.fileid and isgood.username='<username>'  "+
    "where (((secretLimit<3 or owner='<username>') and secretLimit<>2) or "+
    "(secretLimit=2 and owner in(select friendname from friends where username='<username>'))) "+
    "and islongstory=1  order by id  desc"