<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="redis" FOLDED="false" ID="ID_321350701" CREATED="1571130645309" MODIFIED="1571130830607" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.001">
    <properties fit_to_viewport="false" edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="6" RULE="ON_BRANCH_CREATION"/>
<node TEXT="优势" POSITION="right" ID="ID_1294429620" CREATED="1571456723131" MODIFIED="1571457042705">
<edge COLOR="#00ff00"/>
<node TEXT="读速度: 110000次/s" ID="ID_142529315" CREATED="1571456742005" MODIFIED="1571456762864"/>
<node TEXT="写速度: 81000次/s" ID="ID_1131909906" CREATED="1571456763614" MODIFIED="1571456793496"/>
<node TEXT="原子: 所有操作都是原子性的" ID="ID_1294716497" CREATED="1571456794601" MODIFIED="1571456805816">
<node TEXT="单个操作是原子的" ID="ID_646537379" CREATED="1571456816464" MODIFIED="1571456842635"/>
<node TEXT="多个操作支持事务,可通过MULTI和EXEC指令包起来" ID="ID_74440767" CREATED="1571456842924" MODIFIED="1571456879240"/>
</node>
<node TEXT="丰富的特性" ID="ID_373944064" CREATED="1571457029461" MODIFIED="1571457060923">
<node TEXT="publsh/subscribe" ID="ID_1204062489" CREATED="1571457062470" MODIFIED="1571457073542"/>
<node TEXT="通知" ID="ID_682960224" CREATED="1571457074043" MODIFIED="1571457079902"/>
<node TEXT="key过期等" ID="ID_364575368" CREATED="1571457080229" MODIFIED="1571457086920"/>
</node>
</node>
<node TEXT="特点" POSITION="right" ID="ID_421765609" CREATED="1571457122856" MODIFIED="1571457127101">
<edge COLOR="#ff00ff"/>
<node TEXT="支持数据持久化" ID="ID_1070071019" CREATED="1571457128270" MODIFIED="1571457140217"/>
<node TEXT="支持key-value,list,set,zset,hash" ID="ID_108528613" CREATED="1571457141989" MODIFIED="1571457164348"/>
<node TEXT="支持数据备份,master-slave模式" ID="ID_1882108376" CREATED="1571457165924" MODIFIED="1571457179969"/>
</node>
<node TEXT="数据类型" POSITION="right" ID="ID_763016201" CREATED="1571130835302" MODIFIED="1571130842778">
<edge COLOR="#ff0000"/>
<node TEXT="string" ID="ID_1349644173" CREATED="1571130844475" MODIFIED="1571130847432">
<node TEXT="二进制安全,可以包含任何数据" ID="ID_98049551" CREATED="1571130917851" MODIFIED="1571130938667"/>
<node TEXT="其实就是相当于无key的hash" ID="ID_104546139" CREATED="1571482337189" MODIFIED="1571482370570"/>
<node TEXT="每个值最大能存储512MB" ID="ID_588148066" CREATED="1571130939268" MODIFIED="1571482361927"/>
</node>
<node TEXT="hash" ID="ID_1171455467" CREATED="1571130848343" MODIFIED="1571130850639">
<node TEXT="键值对集合" ID="ID_1684418326" CREATED="1571131020066" MODIFIED="1571131029165"/>
<node TEXT="每个hash可以存储2**32 -1键值对" ID="ID_381098789" CREATED="1571131106933" MODIFIED="1571131128799"/>
<node TEXT="适合存储对象" ID="ID_1654611020" CREATED="1571131451173" MODIFIED="1571131458475"/>
</node>
<node TEXT="list" ID="ID_1958593229" CREATED="1571130851162" MODIFIED="1571130852559">
<node TEXT="sting类型列表-按插入顺序排序列" ID="ID_766751330" CREATED="1571131139069" MODIFIED="1571131374624"/>
<node TEXT="每个列表可以存储2**32 -1个成员" ID="ID_1837300675" CREATED="1571131151243" MODIFIED="1571131317107"/>
</node>
<node TEXT="set" ID="ID_1363733548" CREATED="1571130858529" MODIFIED="1571482166979">
<node TEXT="string类型的无序列表" ID="ID_1911836376" CREATED="1571131225483" MODIFIED="1571131366432"/>
<node TEXT="每个集合可以存储2**32 -1个成员" ID="ID_747949288" CREATED="1571131287999" MODIFIED="1571482166978"/>
</node>
<node TEXT="zset(sorted set：有序集合)" ID="ID_908032110" CREATED="1571130861116" MODIFIED="1571130874160">
<node TEXT="string类型元素的集合,不允许重复成员,并且有序" ID="ID_1230627076" CREATED="1571131331570" MODIFIED="1571131358607"/>
</node>
</node>
<node TEXT="命令" POSITION="right" ID="ID_1572329332" CREATED="1571457266915" MODIFIED="1571457270666">
<edge COLOR="#00ffff"/>
<node TEXT="连接" ID="ID_1660946126" CREATED="1571484463816" MODIFIED="1571484475893">
<node TEXT="AUTH password&#xa;验证密码是否正确" ID="ID_1803658109" CREATED="1571484426200" MODIFIED="1571484427040"/>
<node TEXT="ECHO message&#xa;打印字符串" ID="ID_1000966055" CREATED="1571484492137" MODIFIED="1571484497530"/>
<node TEXT="PING&#xa;查看服务是否运行" ID="ID_1261355376" CREATED="1571484503779" MODIFIED="1571484504611"/>
<node TEXT="QUIT&#xa;关闭当前连接" ID="ID_1002770693" CREATED="1571484510360" MODIFIED="1571484510996"/>
<node TEXT="SELECT index&#xa;切换到指定的数据库" ID="ID_285771828" CREATED="1571484515454" MODIFIED="1571484516086"/>
</node>
<node TEXT="键(key)" ID="ID_1589737609" CREATED="1571457349775" MODIFIED="1571457971888">
<node TEXT="DEL key&#xa; 删key" ID="ID_866549444" CREATED="1571457381507" MODIFIED="1571457960772"/>
<node TEXT="DUMP key 序列化给定的key,并返回被序列化的值" ID="ID_1097656587" CREATED="1571457390985" MODIFIED="1571457966779"/>
<node TEXT="EXIST key - 检查key是否存在" ID="ID_1986726840" CREATED="1571457456789" MODIFIED="1571457483044"/>
<node TEXT="EXPIRE key seconds - 为给定 key 设置过期时间,单位秒。" ID="ID_18499813" CREATED="1571457483404" MODIFIED="1571457521247"/>
<node TEXT="EXPIREAT key timestamp - EXPIREAT 的作用和 EXPIRE 类似，都用于为 key 设置过期时间。 不同在于 EXPIREAT 命令接受的时间参数是 UNIX 时间戳(unix timestamp)。" ID="ID_1094722106" CREATED="1571457502455" MODIFIED="1571457538338"/>
<node TEXT="PEXPIRE key milliseconds - 设置 key 的过期时间以毫秒计。" ID="ID_1778887258" CREATED="1571457539741" MODIFIED="1571457558513"/>
<node TEXT="PEXPIREAT key milliseconds-timestamp - 设置 key 过期时间的时间戳(unix timestamp) 以毫秒计" ID="ID_1732157032" CREATED="1571457585886" MODIFIED="1571457591959"/>
<node TEXT="KEYS pattern - 查找所有符合给定模式( pattern)的 key 。" ID="ID_1798681113" CREATED="1571457599390" MODIFIED="1571457971885"/>
<node TEXT="MOVE key db - 将当前数据库的 key 移动到给定的数据库 db 当中。" ID="ID_1400448897" CREATED="1571457621554" MODIFIED="1571457627216"/>
<node TEXT="PERSIST key - 移除 key 的过期时间，key 将持久保持" ID="ID_193723377" CREATED="1571457638890" MODIFIED="1571457661999"/>
<node TEXT="PTTL key - 以毫秒为单位返回 key 的剩余的过期时间。" ID="ID_1449630290" CREATED="1571457652028" MODIFIED="1571457657533"/>
<node TEXT="TTL key - 以秒为单位，返回给定 key 的剩余生存时间(TTL, time to live)。" ID="ID_1027419471" CREATED="1571457670972" MODIFIED="1571457676960"/>
<node TEXT="RANDOMKEY - 从当前数据库中随机返回一个 key" ID="ID_635850066" CREATED="1571457682545" MODIFIED="1571457688376"/>
<node TEXT="RENAME key newkey - 修改 key 的名称" ID="ID_124324631" CREATED="1571457694306" MODIFIED="1571457698741"/>
<node TEXT="RENAMENX key newkey - 仅当 newkey 不存在时，将 key 改名为 newkey 。" ID="ID_1869416608" CREATED="1571457705562" MODIFIED="1571457712242"/>
<node TEXT="TYPE key - 返回 key 所储存的值的类型。" ID="ID_1364295158" CREATED="1571457753472" MODIFIED="1571457759501"/>
</node>
<node TEXT="字符串(string)" ID="ID_697313602" CREATED="1571457894744" MODIFIED="1571457910359">
<node TEXT="SET key value&#xa;设置指定 key 的值" ID="ID_1763192586" CREATED="1571457915491" MODIFIED="1571457943776"/>
<node TEXT="GET key&#xa;获取指定 key 的值。" ID="ID_59293643" CREATED="1571457948532" MODIFIED="1571457950699"/>
<node TEXT="GETRANGE key start end&#xa;返回 key 中字符串值的子字符" ID="ID_1473853842" CREATED="1571457979449" MODIFIED="1571457980954"/>
<node TEXT="GETSET key value&#xa;将给定 key 的值设为 value ，并返回 key 的旧值(old value)。" ID="ID_1455320132" CREATED="1571457992908" MODIFIED="1571457993948"/>
<node TEXT="GETBIT key offset&#xa;对 key 所储存的字符串值，获取指定偏移量上的位(bit)。" ID="ID_596679402" CREATED="1571458001169" MODIFIED="1571458002986"/>
<node TEXT="MGET key1 [key2..]&#xa;获取所有(一个或多个)给定 key 的值。" ID="ID_461250540" CREATED="1571458016105" MODIFIED="1571458017013"/>
<node TEXT="SETBIT key offset value&#xa;对 key 所储存的字符串值，设置或清除指定偏移量上的位(bit)。" ID="ID_1570831124" CREATED="1571458026432" MODIFIED="1571458027332"/>
<node TEXT="SETEX key seconds value&#xa;将值 value 关联到 key ，并将 key 的过期时间设为 seconds (以秒为单位)。" ID="ID_1887497328" CREATED="1571458032341" MODIFIED="1571458033053"/>
<node TEXT="SETNX key value&#xa;只有在 key 不存在时设置 key 的值" ID="ID_1501108203" CREATED="1571458037920" MODIFIED="1571458038696"/>
<node TEXT="SETRANGE key offset value&#xa;用 value 参数覆写给定 key 所储存的字符串值，从偏移量 offset 开始" ID="ID_1472988060" CREATED="1571458038758" MODIFIED="1571458061878"/>
<node TEXT="STRLEN key&#xa;返回 key 所储存的字符串值的长度。" ID="ID_1092840777" CREATED="1571481988342" MODIFIED="1571482006773"/>
<node TEXT="MSET key value [key value ...]&#xa;同时设置一个或多个 key-value 对" ID="ID_1972643118" CREATED="1571458070149" MODIFIED="1571458071044"/>
<node TEXT="MSETNX key value [key value ...]&#xa;同时设置一个或多个 key-value 对，当且仅当所有给定 key 都不存在。" ID="ID_1817008412" CREATED="1571482084306" MODIFIED="1571482085703"/>
<node TEXT="PSETEX key milliseconds value&#xa;这个命令和 SETEX 命令相似，但它以毫秒为单位设置 key 的生存时间，而不是像 SETEX 命令那样，以秒为单位" ID="ID_669967521" CREATED="1571482093396" MODIFIED="1571482095158"/>
<node TEXT="INCR key&#xa;将 key 中储存的数字值增一。" ID="ID_479862142" CREATED="1571482109742" MODIFIED="1571482111130"/>
<node TEXT="INCRBY key increment&#xa;将 key 所储存的值加上给定的增量值（increment） 。" ID="ID_538147715" CREATED="1571482117261" MODIFIED="1571482118429"/>
<node TEXT="INCRBYFLOAT key increment&#xa;将 key 所储存的值加上给定的浮点增量值（increment）" ID="ID_701012979" CREATED="1571482126465" MODIFIED="1571482127578"/>
<node TEXT="DECR key&#xa;将 key 中储存的数字值减一。" ID="ID_1077470757" CREATED="1571482135119" MODIFIED="1571482136330"/>
<node TEXT="DECRBY key decrement&#xa;key 所储存的值减去给定的减量值（decrement） 。" ID="ID_609799386" CREATED="1571482141704" MODIFIED="1571482142712"/>
<node TEXT="APPEND key value&#xa;如果 key 已经存在并且是一个字符串， APPEND 命令将指定的 value 追加到该 key 原来值（value）的末尾。" ID="ID_1499492949" CREATED="1571482151845" MODIFIED="1571482152999"/>
</node>
<node TEXT="哈希(hash)" ID="ID_742837295" CREATED="1571482164799" MODIFIED="1571482813360">
<node TEXT="HDEL key field1 [field2]&#xa;删除一个或多个哈希表字段field" ID="ID_898580346" CREATED="1571482297219" MODIFIED="1571482726873"/>
<node TEXT="HEXISTS key field&#xa;查看哈希表 key 中，指定的字段field是否存在" ID="ID_1379277152" CREATED="1571482309175" MODIFIED="1571482731000"/>
<node TEXT="HGET key field&#xa;获取存储在哈希表中指定字段field的值" ID="ID_1942624412" CREATED="1571482372850" MODIFIED="1571482734347"/>
<node TEXT="HGETALL key&#xa;获取在哈希表中指定 key 的所有字段field和值" ID="ID_1247823654" CREATED="1571482385224" MODIFIED="1571482743394"/>
<node TEXT="HINCRBY key field increment&#xa;为哈希表 key 中的指定字段field的整数值加上增量 increment" ID="ID_1566772109" CREATED="1571482391022" MODIFIED="1571482747178"/>
<node TEXT="HINCRBYFLOAT key field increment&#xa;为哈希表 key 中的指定字段field的浮点数值加上增量 increment" ID="ID_1709150576" CREATED="1571482397687" MODIFIED="1571482749396"/>
<node TEXT="HKEYS key&#xa;获取所有哈希表中的字段field" ID="ID_1790576428" CREATED="1571482403958" MODIFIED="1571482753483"/>
<node TEXT="HLEN key&#xa;获取哈希表中字段field的数量" ID="ID_736414386" CREATED="1571482411991" MODIFIED="1571482813349"/>
<node TEXT="HMGET key field1 [field2]&#xa;获取所有给定字段field的值" ID="ID_688260080" CREATED="1571482417926" MODIFIED="1571482799543"/>
<node TEXT="HMSET key field1 value1 [field2 value2 ]&#xa;同时将多个 field-value (域-值)对设置到哈希表 key 中。" ID="ID_294152600" CREATED="1571482425671" MODIFIED="1571482426233"/>
<node TEXT="HSET key field value&#xa;将哈希表 key 中的字段 field 的值设为 value 。" ID="ID_1172185349" CREATED="1571482430582" MODIFIED="1571482431507"/>
<node TEXT="HSETNX key field value&#xa;只有在字段 field 不存在时，设置哈希表字段的值" ID="ID_266637442" CREATED="1571482435172" MODIFIED="1571482439904"/>
<node TEXT="HVALS key&#xa;获取哈希表中所有字段field" ID="ID_1558854810" CREATED="1571482441079" MODIFIED="1571482709473"/>
<node TEXT="HSCAN key cursor [MATCH pattern] [COUNT count]&#xa;迭代哈希表中的键值对。" ID="ID_497191181" CREATED="1571482446703" MODIFIED="1571482447909"/>
</node>
<node TEXT="列表(list)" ID="ID_229895109" CREATED="1571482818622" MODIFIED="1571482825961">
<node TEXT="BLPOP key1 [key2 ] timeout&#xa;移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。" ID="ID_1100062608" CREATED="1571482865526" MODIFIED="1571482879760"/>
<node TEXT="BRPOP key1 [key2 ] timeout&#xa;移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。" ID="ID_132032032" CREATED="1571482961373" MODIFIED="1571482962669"/>
<node TEXT="BRPOPLPUSH source destination timeout&#xa;从列表中弹出一个值，将弹出的元素插入到另外一个列表中并返回它； 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止。" ID="ID_1505732154" CREATED="1571482967468" MODIFIED="1571482977005"/>
<node TEXT="LINDEX key index&#xa;通过索引获取列表中的元素" ID="ID_522550829" CREATED="1571482977861" MODIFIED="1571482982085"/>
<node TEXT="LINSERT key BEFORE|AFTER pivot value&#xa;在列表的元素前或者后插入元素" ID="ID_43452049" CREATED="1571482983034" MODIFIED="1571482986655"/>
<node TEXT="LLEN key&#xa;获取列表长度" ID="ID_1572386134" CREATED="1571482987314" MODIFIED="1571482992883"/>
<node TEXT="LPOP key&#xa;移出并获取列表的第一个元素" ID="ID_195201756" CREATED="1571482993981" MODIFIED="1571482998479"/>
<node TEXT="LPUSH key value1 [value2]&#xa;将一个或多个值插入到列表头部" ID="ID_1973876768" CREATED="1571482998958" MODIFIED="1571483005529"/>
<node TEXT="LPUSHX key value&#xa;将一个值插入到已存在的列表头部" ID="ID_1601135277" CREATED="1571483006473" MODIFIED="1571483007886"/>
<node TEXT="LRANGE key start stop&#xa;获取列表指定范围内的元素" ID="ID_1846735152" CREATED="1571483012492" MODIFIED="1571483013602"/>
<node TEXT="LREM key count value&#xa;移除列表元素" ID="ID_1260930683" CREATED="1571483019301" MODIFIED="1571483019939"/>
<node TEXT="LSET key index value&#xa;通过索引设置列表元素的值" ID="ID_1122167599" CREATED="1571483024128" MODIFIED="1571483024758"/>
<node TEXT="LTRIM key start stop&#xa;对一个列表进行修剪(trim)，就是说，让列表只保留指定区间内的元素，不在指定区间之内的元素都将被删除。" ID="ID_768253180" CREATED="1571483033786" MODIFIED="1571483036556"/>
<node TEXT="RPOP key&#xa;移除列表的最后一个元素，返回值为移除的元素。" ID="ID_362283704" CREATED="1571483082245" MODIFIED="1571483083238"/>
<node TEXT="RPOPLPUSH source destination&#xa;移除列表的最后一个元素，并将该元素添加到另一个列表并返回" ID="ID_988337770" CREATED="1571483088719" MODIFIED="1571483089790"/>
<node TEXT="RPUSH key value1 [value2]&#xa;在列表中添加一个或多个值" ID="ID_281860970" CREATED="1571483093448" MODIFIED="1571483097599"/>
<node TEXT="RPUSHX key value&#xa;为已存在的列表添加值" ID="ID_81540472" CREATED="1571483098046" MODIFIED="1571483098927"/>
</node>
<node TEXT="集合(set)" ID="ID_125457975" CREATED="1571483107683" MODIFIED="1571483127055">
<node TEXT="SADD key member1 [member2]&#xa;向集合添加一个或多个成员" ID="ID_1967640849" CREATED="1571483128596" MODIFIED="1571483135344"/>
<node TEXT="SCARD key&#xa;获取集合的成员数" ID="ID_1034655772" CREATED="1571483139140" MODIFIED="1571483139638"/>
<node TEXT="SDIFF key1 [key2]&#xa;返回给定所有集合的差集" ID="ID_1985197395" CREATED="1571483143063" MODIFIED="1571483144371"/>
<node TEXT="SDIFFSTORE destination key1 [key2]&#xa;返回给定所有集合的差集并存储在 destination 中" ID="ID_510507153" CREATED="1571483148563" MODIFIED="1571483153238"/>
<node TEXT="SINTER key1 [key2]&#xa;返回给定所有集合的交集" ID="ID_156578133" CREATED="1571483153621" MODIFIED="1571483154595"/>
<node TEXT="SINTERSTORE destination key1 [key2]&#xa;返回给定所有集合的交集并存储在 destination 中" ID="ID_1052039106" CREATED="1571483158545" MODIFIED="1571483159158"/>
<node TEXT="SISMEMBER key member&#xa;判断 member 元素是否是集合 key 的成员" ID="ID_1798220670" CREATED="1571483163297" MODIFIED="1571483164311"/>
<node TEXT="SMEMBERS key&#xa;返回集合中的所有成员" ID="ID_57050680" CREATED="1571483169348" MODIFIED="1571483170043"/>
<node TEXT="SMOVE source destination member&#xa;将 member 元素从 source 集合移动到 destination 集合" ID="ID_535220007" CREATED="1571483174496" MODIFIED="1571483175741"/>
<node TEXT="SPOP key&#xa;移除并返回集合中的一个随机元素" ID="ID_282114603" CREATED="1571483179685" MODIFIED="1571483180543"/>
<node TEXT="SRANDMEMBER key [count]&#xa;返回集合中一个或多个随机数" ID="ID_950064271" CREATED="1571483184249" MODIFIED="1571483185062"/>
<node TEXT="SREM key member1 [member2]&#xa;移除集合中一个或多个成员" ID="ID_1755296358" CREATED="1571483188768" MODIFIED="1571483189470"/>
<node TEXT="SUNION key1 [key2]&#xa;返回所有给定集合的并集" ID="ID_672858952" CREATED="1571483192862" MODIFIED="1571483196938"/>
<node TEXT="SUNIONSTORE destination key1 [key2]&#xa;所有给定集合的并集存储在 destination 集合中" ID="ID_321101502" CREATED="1571483201406" MODIFIED="1571483201974"/>
<node TEXT="SSCAN key cursor [MATCH pattern] [COUNT count]&#xa;迭代集合中的元素" ID="ID_1705494518" CREATED="1571483208801" MODIFIED="1571483209414"/>
</node>
<node TEXT="有序集合(sorted set)" ID="ID_901028804" CREATED="1571483472941" MODIFIED="1571483485027">
<node TEXT="ZADD key score1 member1 [score2 member2]&#xa;向有序集合添加一个或多个成员，或者更新已存在成员的分数" ID="ID_1291909270" CREATED="1571483486788" MODIFIED="1571483502725"/>
<node TEXT="ZCARD key&#xa;获取有序集合的成员数" ID="ID_315796490" CREATED="1571483516028" MODIFIED="1571483516773"/>
<node TEXT="ZCOUNT key min max&#xa;计算在有序集合中指定区间分数的成员数" ID="ID_1661394400" CREATED="1571483521823" MODIFIED="1571483522514"/>
<node TEXT="ZINCRBY key increment member&#xa;有序集合中对指定成员的分数加上增量 increment" ID="ID_1253316758" CREATED="1571483527243" MODIFIED="1571483527870"/>
<node TEXT="ZINTERSTORE destination numkeys key [key ...]&#xa;计算给定的一个或多个有序集的交集并将结果集存储在新的有序集合 key 中" ID="ID_882862884" CREATED="1571483532254" MODIFIED="1571483532962"/>
<node TEXT="ZLEXCOUNT key min max&#xa;在有序集合中计算指定字典区间内成员数量" ID="ID_284498256" CREATED="1571483537803" MODIFIED="1571483538412"/>
<node TEXT="ZRANGE key start stop [WITHSCORES]&#xa;通过索引区间返回有序集合指定区间内的成员" ID="ID_706077701" CREATED="1571483542333" MODIFIED="1571483542992"/>
<node TEXT="ZRANGEBYLEX key min max [LIMIT offset count]&#xa;通过字典区间返回有序集合的成员" ID="ID_1685264451" CREATED="1571483547942" MODIFIED="1571483548576"/>
<node TEXT="ZRANGEBYSCORE key min max [WITHSCORES] [LIMIT]&#xa;通过分数返回有序集合指定区间内的成员" ID="ID_962415228" CREATED="1571483555322" MODIFIED="1571483555938"/>
<node TEXT="ZRANK key member&#xa;返回有序集合中指定成员的索引" ID="ID_1983444833" CREATED="1571483560245" MODIFIED="1571483560789"/>
<node TEXT="ZREM key member [member ...]&#xa;移除有序集合中的一个或多个成员" ID="ID_1747331786" CREATED="1571483565281" MODIFIED="1571483566145"/>
<node TEXT="ZREMRANGEBYLEX key min max&#xa;移除有序集合中给定的字典区间的所有成员" ID="ID_836608880" CREATED="1571483573590" MODIFIED="1571483574233"/>
<node TEXT="ZREMRANGEBYRANK key start stop&#xa;移除有序集合中给定的排名区间的所有成员" ID="ID_205404283" CREATED="1571483577775" MODIFIED="1571483578315"/>
<node TEXT="ZREMRANGEBYSCORE key min max&#xa;移除有序集合中给定的分数区间的所有成员" ID="ID_945952599" CREATED="1571483583153" MODIFIED="1571483583733"/>
<node TEXT="ZREVRANGE key start stop [WITHSCORES]&#xa;返回有序集中指定区间内的成员，通过索引，分数从高到低" ID="ID_1172850435" CREATED="1571483587526" MODIFIED="1571483591693"/>
<node TEXT="ZREVRANGEBYSCORE key max min [WITHSCORES]&#xa;返回有序集中指定分数区间内的成员，分数从高到低排序" ID="ID_1704830529" CREATED="1571483592006" MODIFIED="1571483593170"/>
<node TEXT="ZREVRANK key member&#xa;返回有序集合中指定成员的排名，有序集成员按分数值递减(从大到小)排序" ID="ID_1734993733" CREATED="1571483600762" MODIFIED="1571483601512"/>
<node TEXT="ZSCORE key member&#xa;返回有序集中，成员的分数值" ID="ID_10234424" CREATED="1571483606204" MODIFIED="1571483606812"/>
<node TEXT="ZUNIONSTORE destination numkeys key [key ...]&#xa;计算给定的一个或多个有序集的并集，并存储在新的 key 中" ID="ID_921381686" CREATED="1571483610733" MODIFIED="1571483611354"/>
<node TEXT="ZSCAN key cursor [MATCH pattern] [COUNT count]&#xa;迭代有序集合中的元素（包括元素成员和元素分值）" ID="ID_367551017" CREATED="1571483618131" MODIFIED="1571483621728"/>
</node>
<node TEXT="HyperLogLog" ID="ID_751214520" CREATED="1571483759596" MODIFIED="1571483768043">
<node TEXT="PFADD key element [element ...]&#xa;添加指定元素到 HyperLogLog 中。" ID="ID_1693748943" CREATED="1571483769970" MODIFIED="1571483778305"/>
<node TEXT="PFCOUNT key [key ...]&#xa;返回给定 HyperLogLog 的基数估算值。" ID="ID_859713431" CREATED="1571483783807" MODIFIED="1571483784654"/>
<node TEXT="PFMERGE destkey sourcekey [sourcekey ...]&#xa;将多个 HyperLogLog 合并为一个 HyperLogLog" ID="ID_1252230948" CREATED="1571483789049" MODIFIED="1571483789840"/>
</node>
<node TEXT="发布订阅" ID="ID_921092743" CREATED="1571483799607" MODIFIED="1571483805949">
<node TEXT="PSUBSCRIBE pattern [pattern ...]&#xa;订阅一个或多个符合给定模式的频道。" ID="ID_68586030" CREATED="1571483807529" MODIFIED="1571483850843"/>
<node TEXT="PUBSUB subcommand [argument [argument ...]]&#xa;查看订阅与发布系统状态。" ID="ID_1481661738" CREATED="1571483856420" MODIFIED="1571483857177"/>
<node TEXT="PUBLISH channel message&#xa;将信息发送到指定的频道。" ID="ID_308226662" CREATED="1571483862059" MODIFIED="1571483862758"/>
<node TEXT="PUNSUBSCRIBE [pattern [pattern ...]]&#xa;退订所有给定模式的频道。" ID="ID_1254154745" CREATED="1571483890269" MODIFIED="1571483890872"/>
<node TEXT="SUBSCRIBE channel [channel ...]&#xa;订阅给定的一个或多个频道的信息。" ID="ID_858419468" CREATED="1571483896955" MODIFIED="1571483897706"/>
<node TEXT="UNSUBSCRIBE [channel [channel ...]]&#xa;指退订给定的频道。" ID="ID_71527132" CREATED="1571483902054" MODIFIED="1571483902719"/>
</node>
<node TEXT="事务" ID="ID_565759756" CREATED="1571483943480" MODIFIED="1571483946948">
<node TEXT="事务三个阶段" ID="ID_1444013810" CREATED="1571483952619" MODIFIED="1571484078866">
<node TEXT="1. 开始事务" ID="ID_1605451415" CREATED="1571484049741" MODIFIED="1571484056306"/>
<node TEXT="2. 命令入队" ID="ID_306185726" CREATED="1571484060034" MODIFIED="1571484064504"/>
<node TEXT="3. 执行事务" ID="ID_73836998" CREATED="1571484065605" MODIFIED="1571484070895"/>
</node>
<node TEXT="事务执行多个命令三个重要保证" ID="ID_1169789651" CREATED="1571484094231" MODIFIED="1571484117494">
<node TEXT="批量操作在发送 EXEC 命令前被放入队列缓存。" ID="ID_754543304" CREATED="1571484119013" MODIFIED="1571484125150"/>
<node TEXT="收到 EXEC 命令后进入事务执行，事务中任意命令执行失败，其余的命令依然被执行。" ID="ID_876822653" CREATED="1571484132838" MODIFIED="1571484134324"/>
<node TEXT="在事务执行过程，其他客户端提交的命令请求不会插入到事务执行命令序列中。" ID="ID_904193619" CREATED="1571484143072" MODIFIED="1571484144247"/>
</node>
<node TEXT="NOTE:&#xa;单个 Redis 命令的执行是原子性的，但 Redis 没有在事务上增加任何维持原子性的机制，所以 Redis 事务的执行并不是原子性的。&#xa;事务可以理解为一个打包的批量执行脚本，但批量指令并非原子化的操作，中间某条指令的失败不会导致前面已做指令的回滚，也不会造成后续的指令不做。" ID="ID_776648477" CREATED="1571484259953" MODIFIED="1571484289944"/>
<node TEXT="DISCARD&#xa;取消事务，放弃执行事务块内的所有命令。" ID="ID_644187560" CREATED="1571484160940" MODIFIED="1571484172008"/>
<node TEXT="EXEC&#xa;执行所有事务块内的命令。" ID="ID_1010044411" CREATED="1571484176876" MODIFIED="1571484177844"/>
<node TEXT="MULTI&#xa;标记一个事务块的开始。" ID="ID_1436518139" CREATED="1571484182044" MODIFIED="1571484182803"/>
<node TEXT="UNWATCH&#xa;取消 WATCH 命令对所有 key 的监视。" ID="ID_51976949" CREATED="1571484187043" MODIFIED="1571484194017"/>
<node TEXT="WATCH key [key ...]&#xa;监视一个(或多个) key ，如果在事务执行之前这个(或这些) key 被其他命令所改动，那么事务将被打断。" ID="ID_1427915488" CREATED="1571484194780" MODIFIED="1571484195693"/>
</node>
<node TEXT="内嵌lua脚本" ID="ID_1138060958" CREATED="1571484305737" MODIFIED="1571484339482">
<node TEXT="EVAL script numkeys key [key ...] arg [arg ...]&#xa;执行 Lua 脚本。" ID="ID_312080447" CREATED="1571484312719" MODIFIED="1571484346695"/>
<node TEXT="EVALSHA sha1 numkeys key [key ...] arg [arg ...]&#xa;执行 Lua 脚本。" ID="ID_1216174924" CREATED="1571484355581" MODIFIED="1571484356611"/>
<node TEXT="SCRIPT EXISTS script [script ...]&#xa;查看指定的脚本是否已经被保存在缓存当中。" ID="ID_1204521912" CREATED="1571484377938" MODIFIED="1571484378671"/>
<node TEXT="SCRIPT FLUSH&#xa;从脚本缓存中移除所有脚本" ID="ID_940040124" CREATED="1571484383827" MODIFIED="1571484384591"/>
<node TEXT="SCRIPT KILL&#xa;杀死当前正在运行的 Lua 脚本。" ID="ID_1353787719" CREATED="1571484389949" MODIFIED="1571484390758"/>
<node TEXT="SCRIPT LOAD script&#xa;将脚本 script 添加到脚本缓存中，但并不立即执行这个脚本。" ID="ID_1860904714" CREATED="1571484395891" MODIFIED="1571484396564"/>
</node>
<node TEXT="管理服务器" ID="ID_456659508" CREATED="1571484561154" MODIFIED="1571484578106"/>
</node>
<node TEXT="client连接" POSITION="left" ID="ID_1209573853" CREATED="1571457272429" MODIFIED="1571484443634">
<edge COLOR="#7c0000"/>
<node TEXT="redi-cli -h host -p port -a password" ID="ID_124197564" CREATED="1571457306146" MODIFIED="1571736638190"/>
</node>
</node>
</map>
