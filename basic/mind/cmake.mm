<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="cmake" FOLDED="false" ID="ID_729204240" CREATED="1565452218849" MODIFIED="1565511965162" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.003">
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
<hook NAME="AutomaticEdgeColor" COUNTER="24" RULE="ON_BRANCH_CREATION"/>
<node TEXT="cmake_minimum_required (VERSION 2.8)" POSITION="right" ID="ID_1956425950" CREATED="1565452227850" MODIFIED="1565452232546">
<edge COLOR="#ff0000"/>
<node TEXT="cmake最小版本" ID="ID_490832677" CREATED="1565452234158" MODIFIED="1565452457762"/>
</node>
<node TEXT="project (Demo)" POSITION="right" ID="ID_1232170925" CREATED="1565452259990" MODIFIED="1565511294523">
<edge COLOR="#0000ff"/>
<node TEXT="Demo项目工程名称" ID="ID_1358078111" CREATED="1565452274476" MODIFIED="1565511291210"/>
</node>
<node TEXT="add_executable(Demo xxx.c..)" POSITION="right" ID="ID_1662145478" CREATED="1565452290654" MODIFIED="1565511390786">
<edge COLOR="#00ff00"/>
<node TEXT="生成可执行文件" ID="ID_1304099185" CREATED="1565452960331" MODIFIED="1565452966640"/>
<node TEXT="Demo 目标可执行文件" ID="ID_828332906" CREATED="1565452404455" MODIFIED="1565452950701"/>
<node TEXT="空格后面为源文件" ID="ID_1002207484" CREATED="1565452951184" MODIFIED="1565452992071"/>
</node>
<node TEXT=" target_link_libraries(Demo MathFunctions)" POSITION="right" ID="ID_825062236" CREATED="1565452884574" MODIFIED="1565511489125">
<edge COLOR="#7c7c00"/>
<node TEXT="添加链接库" ID="ID_717915140" CREATED="1565452936045" MODIFIED="1565452944366"/>
<node TEXT="Demo目标可执行文件" ID="ID_36457061" CREATED="1565452912169" MODIFIED="1565511477739"/>
<node TEXT="MathFunctions: 链接库" ID="ID_822238090" CREATED="1565453016198" MODIFIED="1565453040960"/>
</node>
<node TEXT="aux_source_directory(. VAR_SRCS)" POSITION="right" ID="ID_1843749603" CREATED="1565453098678" MODIFIED="1565453312866">
<edge COLOR="#007c7c"/>
<node TEXT="将当前目录所有源文件保存到变量" ID="ID_896021677" CREATED="1565453103906" MODIFIED="1565453124208"/>
<node TEXT=". : 当前目录所有文件" ID="ID_510618610" CREATED="1565453168968" MODIFIED="1565453177501"/>
<node TEXT="VAR_SRCS: 变量名" ID="ID_1260349951" CREATED="1565453124661" MODIFIED="1600930974502"/>
</node>
<node TEXT="固定变量" POSITION="left" ID="ID_1563387850" CREATED="1565511816518" MODIFIED="1565511833613" HGAP_QUANTITY="47.74999899417165 pt" VSHIFT_QUANTITY="-164.2499951049687 pt">
<edge COLOR="#0000ff"/>
<node TEXT="PROJECT_SOURCE_DIR" ID="ID_869701757" CREATED="1565511836214" MODIFIED="1565511838812">
<node TEXT="工程路径" ID="ID_161549299" CREATED="1565511863618" MODIFIED="1565511871702"/>
</node>
<node TEXT="PROJECT_BINARY_DIR" ID="ID_1370935880" CREATED="1565511848107" MODIFIED="1565511849580">
<node TEXT="二进制路径？？" ID="ID_387904879" CREATED="1565511875491" MODIFIED="1565511889440"/>
</node>
</node>
<node TEXT="命令，注释，空格组成" POSITION="left" ID="ID_650811951" CREATED="1565452337229" MODIFIED="1565452349931">
<edge COLOR="#00ffff"/>
</node>
<node TEXT="系统指令不区分大小写&#xa;变量和字符串区分大小写" POSITION="left" ID="ID_500873467" CREATED="1565452353855" MODIFIED="1565511347519">
<edge COLOR="#7c0000"/>
</node>
<node TEXT="# 表示注释" POSITION="left" ID="ID_844358342" CREATED="1565452311683" MODIFIED="1565452319092">
<edge COLOR="#ff00ff"/>
</node>
<node TEXT="set(key value): 来声明变量&#xa; ${var}: 取变量值" POSITION="left" ID="ID_1417466612" CREATED="1565453181493" MODIFIED="1565511557868">
<edge COLOR="#7c7c00"/>
</node>
<node TEXT="add_subdirectory(math)" POSITION="right" ID="ID_1642628838" CREATED="1565452824850" MODIFIED="1565452827880">
<edge COLOR="#00007c"/>
<node TEXT="添加子目录" ID="ID_755702494" CREATED="1565452830211" MODIFIED="1565452845158"/>
<node TEXT="matk: 子目录" ID="ID_1461408873" CREATED="1565453000184" MODIFIED="1565453007468"/>
</node>
<node TEXT="include_directories (&quot;${PROJECT_SOURCE_DIR}/math&quot;)" POSITION="right" ID="ID_847021167" CREATED="1565453721273" MODIFIED="1565453744137">
<edge COLOR="#0000ff"/>
<node TEXT=" 指定相关头文件路径" ID="ID_92136409" CREATED="1565453725104" MODIFIED="1565511702832"/>
</node>
<node TEXT="add_library (MathFunctions ${VAR_SRCS})" FOLDED="true" POSITION="right" ID="ID_295261529" CREATED="1565453048764" MODIFIED="1565511965160" HGAP_QUANTITY="26.7499996200204 pt" VSHIFT_QUANTITY="-39.74999881535772 pt">
<edge COLOR="#7c007c"/>
<node TEXT="生成链接库" ID="ID_1301634013" CREATED="1565453239127" MODIFIED="1565453249621"/>
<node TEXT="Mathfunctions: 库名" ID="ID_1507979812" CREATED="1565453250458" MODIFIED="1565453267824"/>
<node TEXT="VAR_SRCS: 生成库的源文件" ID="ID_1832695451" CREATED="1565453268174" MODIFIED="1565453308683"/>
</node>
<node TEXT="编译选项" POSITION="right" ID="ID_13883658" CREATED="1565453341209" MODIFIED="1565453365158">
<edge COLOR="#ff0000"/>
<node TEXT="configure_file" ID="ID_517015384" CREATED="1565453401211" MODIFIED="1565453417543">
<node TEXT="定义一个配置头文件，使用CMake的配置在源码中使用" ID="ID_1994952152" CREATED="1565511595006" MODIFIED="1565511631429"/>
<node TEXT="例：configure_file (&#xa;&quot;${PROJECT_SOURCE_DIR}/config.h.in&quot;&#xa;&quot;${PROJECT_BINARY_DIR}/config.h&quot;&#xa;)" ID="ID_1386598378" CREATED="1565453420207" MODIFIED="1565453447364"/>
</node>
<node TEXT="option" ID="ID_400791317" CREATED="1565453457017" MODIFIED="1565453460700">
<node TEXT="例 option(USE_MYMATH &quot;Use my math&quot; ON)" ID="ID_947340315" CREATED="1565453463291" MODIFIED="1565453539995"/>
<node TEXT="可选项，默认为ON，失能为OFF" ID="ID_1272156890" CREATED="1565453512250" MODIFIED="1565453555556"/>
</node>
<node TEXT="使用可选项" ID="ID_156354434" CREATED="1565453620316" MODIFIED="1565453627478">
<node TEXT="例 if(USE_MYMATH)&#xa;...&#xa;endif(USE_MYMATH)" ID="ID_1681914494" CREATED="1565453629148" MODIFIED="1565453681882"/>
</node>
<node TEXT="程序中使用可选项" ID="ID_1073809442" CREATED="1565512123196" MODIFIED="1565512131094">
<node TEXT="使用宏#ifdef #ifndef  #else #endif" ID="ID_475753895" CREATED="1565512132873" MODIFIED="1565512165586"/>
</node>
</node>
<node TEXT="安装与测试" POSITION="right" ID="ID_1206463078" CREATED="1565454061228" MODIFIED="1565454067487">
<edge COLOR="#ff00ff"/>
<node TEXT="生成makefile后可以后make install 和make test执行" ID="ID_46845032" CREATED="1565454069595" MODIFIED="1565454257876"/>
<node TEXT="安装" ID="ID_392472092" CREATED="1565454598588" MODIFIED="1565454603112">
<node TEXT="install (TARGETS MathFunctions DESTINATION bin)&#xa;install (FILES MathFunctions.h DESTINATION include)" ID="ID_1208708615" CREATED="1565454269208" MODIFIED="1565454355981">
<node TEXT=" MathFunctions库或程序的安装路径" ID="ID_796807087" CREATED="1565454288210" MODIFIED="1565454519054"/>
<node TEXT="头文件的安装路径" ID="ID_1621873260" CREATED="1565454315371" MODIFIED="1565454395508"/>
<node TEXT="/usr/local/bin是默认库和程序安装目录" ID="ID_961173650" CREATED="1565454432156" MODIFIED="1565454513078"/>
<node TEXT="/usr/local/include是默认的头文件安装目录" ID="ID_1510440601" CREATED="1565454520782" MODIFIED="1565454545004"/>
</node>
</node>
<node TEXT="测试" ID="ID_936650180" CREATED="1565454603557" MODIFIED="1565454607368">
<node TEXT="使用CTest的测试工具" ID="ID_1429253785" CREATED="1565454626946" MODIFIED="1565454680954"/>
</node>
<node TEXT="TARGETS包含六种形式：ARCHIVE, LIBRARY, RUNTIME,OBJECTS, FRAMEWORK, BUNDLE。注意Mathfunction安装的是LIBRARY，而根目录下的可执行文件是RUNTIME类型" ID="ID_1824672579" CREATED="1565512337095" MODIFIED="1565512355848"/>
<node TEXT="FILE 将给定的文件复制到指定目录。如果没有给定权限参数，则由该表单安装的文件默认为OWNER_WRITE、OWNER_READ、GROUP_READ和WORLD_READ。" ID="ID_633410797" CREATED="1565512397412" MODIFIED="1565512399045"/>
<node TEXT="DESTINATION在这里是一个相对路径，取默认值。在unix系统中指向 /usr/local 在windows上c:/Program Files/${PROJECT_NAME}。" ID="ID_549838344" CREATED="1565512409905" MODIFIED="1565512411180"/>
<node TEXT="默认指向/usr/local可设置CMAKE_INSTALL_PREFIX指定安装的目录" ID="ID_502764310" CREATED="1565454470595" MODIFIED="1565512474347"/>
</node>
<node TEXT="cmake -i 提供一个交互式配置界面" POSITION="left" ID="ID_1612220560" CREATED="1565453983611" MODIFIED="1565454007524">
<edge COLOR="#00ff00"/>
</node>
<node TEXT="gdb" POSITION="left" ID="ID_68810356" CREATED="1565454787445" MODIFIED="1565454802643" HGAP_QUANTITY="31.99999946355821 pt" VSHIFT_QUANTITY="122.99999633431446 pt">
<edge COLOR="#7c0000"/>
<node TEXT="只需Debug模式下开启-g选项" ID="ID_1416788809" CREATED="1565454806602" MODIFIED="1565454841144"/>
<node TEXT="set(CMAKE_BUILD_TYPE &quot;Debug&quot;)&#xa;set(CMAKE_CXX_FLAGS_DEBUG &quot;$ENV{CXXFLAGS} -O0 -Wall -g -ggdb&quot;)&#xa;set(CMAKE_CXX_FLAGS_RELEASE &quot;$ENV{CXXFLAGS} -O3 -Wall&quot;)" ID="ID_938073728" CREATED="1565454850207" MODIFIED="1565454863649"/>
<node TEXT="cmake -DCMAKE_BUILD_TYPE=Debug /path/xx" ID="ID_609381845" CREATED="1565454987576" MODIFIED="1565455002700"/>
</node>
<node TEXT="环境检查" POSITION="left" ID="ID_805545750" CREATED="1565455017767" MODIFIED="1565455026985">
<edge COLOR="#007c00"/>
<node TEXT="使用CheckFunctionExists.cmake宏来测试这些函数的是否存在" ID="ID_1441820613" CREATED="1565512565932" MODIFIED="1565512631108">
<node TEXT="include (CheckFunctionExists)&#xa;check_function_exists (log HAVE_LOG)&#xa;check_function_exists (exp HAVE_EXP)" ID="ID_350231436" CREATED="1565512640284" MODIFIED="1565512641896"/>
<node TEXT="在config.h.in添加相应定义的变量&#xa;// does the platform provide exp and log functions?&#xa;#cmakedefine HAVE_LOG&#xa;#cmakedefine HAVE_EXP" ID="ID_1498415176" CREATED="1565512650140" MODIFIED="1565512684831"/>
<node TEXT="log和exp的测试代码一定要在TutorialConfig.h的configure_file命令之前" ID="ID_1348567145" CREATED="1565512770465" MODIFIED="1565512772519"/>
</node>
</node>
<node TEXT="添加版本号" POSITION="left" ID="ID_1512211133" CREATED="1565455091097" MODIFIED="1565455100596">
<edge COLOR="#7c007c"/>
<node TEXT="set (Demo_VERSION_MAJOR 1)&#xa;set (Demo_VERSION_MINOR 0)" ID="ID_605026361" CREATED="1565455110635" MODIFIED="1565455125997"/>
<node TEXT="代码获取设定的版本&#xa;在config.h.in添加" ID="ID_1751406808" CREATED="1565455148080" MODIFIED="1565455197846">
<node TEXT="#define Demo_VERSION_MAJOR @Demo_VERSION_MAJOR@&#xa;#define Demo_VERSION_MINOR @Demo_VERSION_MINOR@" ID="ID_906728165" CREATED="1565455163223" MODIFIED="1565455168043"/>
</node>
</node>
<node TEXT="生成安装包cpack" POSITION="left" ID="ID_650501221" CREATED="1565455210765" MODIFIED="1565455231732">
<edge COLOR="#007c7c"/>
</node>
</node>
</map>
