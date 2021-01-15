<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="doxygen&#x6ce8;&#x91ca;&#x98ce;&#x683c;" FOLDED="false" ID="ID_1743048489" CREATED="1566050681634" MODIFIED="1566053777416" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.1">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

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
<hook NAME="AutomaticEdgeColor" COUNTER="13" RULE="ON_BRANCH_CREATION"/>
<node TEXT="&#x53d8;&#x91cf;&#xff0c;&#x5b8f;&#x5b9a;&#x4e49;&#xff0c;&#x7c7b;&#x578b;&#x5b9a;&#x4e49;" POSITION="right" ID="ID_905079401" CREATED="1566050693013" MODIFIED="1566052283263" HGAP_QUANTITY="-2.499999508261695 pt" VSHIFT_QUANTITY="-5.999999821186069 pt">
<edge COLOR="#ff0000"/>
<node TEXT="/** &#x7b80;&#x8981;&#x6587;&#x5b57;&#x8bf4;&#x660e; */&#xa;#define FLOAT float" ID="ID_260854016" CREATED="1566051521950" MODIFIED="1566051573433"/>
<node TEXT="/** @brief &#x7b80;&#x8981;&#x8bf4;&#x660e;&#x6587;&#x5b57;&#xff08;&#x5728;&#x524d;&#x9762;&#x52a0; @brief &#x662f;&#x6807;&#x51c6;&#x683c;&#x5f0f;&#xff09;*/&#xa;#define MIN_UINT 0" ID="ID_1125959957" CREATED="1566051557527" MODIFIED="1566051665116"/>
<node TEXT="/*&#xa; * &#x5206;&#x884c;&#x7684;&#x7b80;&#x8981;&#x8bf4;&#x660e; \n&#xa; *  &#x8fd9;&#x662f;&#x7b2c;&#x4e8c;&#x884c;&#x7684;&#x7b80;&#x8981;&#x8bf4;&#x660e;  */&#xa; int b;" ID="ID_1936231273" CREATED="1566051630585" MODIFIED="1566051634583"/>
</node>
<node TEXT="&#x679a;&#x4e3e;&#x7c7b;&#x578b;&#x5b9a;&#x4e49;,&#x7ed3;&#x6784;&#x4f53;&#x5b9a;&#x4e49;" POSITION="right" ID="ID_816749185" CREATED="1566050769250" MODIFIED="1566052288863">
<edge COLOR="#0000ff"/>
<node TEXT="/** &#x7b80;&#x8981;&#x8bf4;&#x660e; */&#xa;typedef enum TDayOfWeek&#xa; {&#xa;SUN = 0, /*!&lt;  &#x661f;&#x671f;&#x5929;&#xff08;&#x6ce8;&#x610f;&#xff0c;&#x8981;&#x4ee5; &#x201c;&lt;&#x201d; &#x5c0f;&#x4e8e;&#x53f7;&#x5f00;&#x5934;, &#x5426;&#x5219;&#x8868;&#x793a;&#x6ce8;&#x91ca;MON&#xff09; */&#xa;MON = 1, /**&lt;  &#x661f;&#x671f;&#x4e00; */&#xa;TUE = 2, /*!&lt;  &#x661f;&#x671f;&#x4e8c; */&#xa;WED = 3, /*!&lt;  &#x661f;&#x671f;&#x4e09; */&#xa;THU = 4, /*!&lt;  &#x661f;&#x671f;&#x56db; */&#xa;FRI = 5, /*!&lt;  &#x661f;&#x671f;&#x4e94; */&#xa;SAT = 6  /*!&lt;  &#x661f;&#x671f;&#x516d; */&#xa;}TEnumDayOfWeek;" ID="ID_1642336563" CREATED="1566052080410" MODIFIED="1566055696330"/>
</node>
<node TEXT="&#x6a21;&#x5757;&#x5b9a;&#x4e49;&#x548c;&#x52a0;&#x5165;" POSITION="right" ID="ID_1418208599" CREATED="1566050794697" MODIFIED="1566055121108" HGAP_QUANTITY="34.999999374151244 pt" VSHIFT_QUANTITY="-41.999998748302495 pt">
<edge COLOR="#ff00ff"/>
<node TEXT="&#x6a21;&#x5757;&#x5934;&#x548c;&#x6a21;&#x5757;&#x5c3e;&#xff0c;&#x4e2d;&#x95f4;&#x5b9a;&#x4e49;&#x7684;&#x5185;&#x5bb9;" ID="ID_1716005961" CREATED="1566051407747" MODIFIED="1566051425814"/>
<node TEXT="/**&#xa; * @defgroup &#x6a21;&#x5757;&#x540d; &#x6a21;&#x5757;&#x8bf4;&#x660e;&#x6587;&#x5b57;&#xa; * @{&#xa; */&#xa;...&#x5b9a;&#x4e49;&#x7684;&#x5185;&#x5bb9;...&#xa;/** @} */" ID="ID_685566252" CREATED="1566051431760" MODIFIED="1566055399879"/>
<node TEXT="&#x5b9a;&#x4e49;&#x6a21;&#x5757;&#xff1a; @defgroup &#x6a21;&#x5757;ID &#x6a21;&#x5757;&#x8bf4;&#x660e;" ID="ID_398609181" CREATED="1566055128829" MODIFIED="1566055593654"/>
<node TEXT="&#x52a0;&#x5165;&#x6a21;&#x5757;&#xff1a; @ingroup &#x6a21;&#x5757;ID" ID="ID_768868142" CREATED="1566055157692" MODIFIED="1566055578851"/>
<node TEXT="&#x52a0;&#x5165;&#x6a21;&#x5757;&#xff1a; @addtogroup &#x6a21;&#x5757;ID" ID="ID_1818124997" CREATED="1566055517490" MODIFIED="1566055613373"/>
</node>
<node TEXT="&#x5206;&#x7ec4;&#x5b9a;&#x4e49;" POSITION="right" ID="ID_468079893" CREATED="1566050801148" MODIFIED="1566050805596">
<edge COLOR="#00ffff"/>
<node TEXT="&#x7ec4;&#x5934;&#x548c;&#x7ec4;&#x5c3e;&#xff0c;&#x4e2d;&#x95f4;&#x5b9a;&#x4e49;&#x7684;&#x5185;&#x5bb9;" ID="ID_425080121" CREATED="1566051176574" MODIFIED="1566051404009"/>
<node TEXT="/**&#xa; * @name filename&#xa; * @{&#xa; */&#xa;...&#x5b9a;&#x4e49;&#x7684;&#x5185;&#x5bb9;...&#xa;/** @} */" ID="ID_966006247" CREATED="1566051260681" MODIFIED="1566051610812"/>
</node>
<node TEXT="&#x6ce8;&#x91ca;" POSITION="left" ID="ID_75967500" CREATED="1566053792285" MODIFIED="1566053800632">
<edge COLOR="#007c7c"/>
<node TEXT="&#x5355;&#x884c;&#x6ce8;&#x91ca;&#xff1a; /// &#x6216;//&#xff01;" ID="ID_831781458" CREATED="1566053803672" MODIFIED="1566053817571"/>
<node TEXT="&#x591a;&#x884c;&#x6ce8;&#x91ca;&#xff1a; &#x4ee5;/** &#x6216; /*!  &#x8d77;&#x5934;&#xff0c;&#x4ee5; */ &#x7ed3;&#x5c3e;" ID="ID_733998789" CREATED="1566053818845" MODIFIED="1566053877602"/>
</node>
<node TEXT="&#x51fd;&#x6570;&#x5b9a;&#x4e49;" POSITION="left" ID="ID_1648448930" CREATED="1566052307477" MODIFIED="1566052696094" HGAP_QUANTITY="28.24999957531692 pt" VSHIFT_QUANTITY="-4.499999865889553 pt">
<edge COLOR="#7c0000"/>
<node TEXT="&#x6307;&#x4ee4;&#x683c;&#x5f0f;&#xff1a;&#x6267;&#x884c;&#x7b26;+&#x6307;&#x4ee4;&#x64cd;&#x4f5c;&#x7b26;" ID="ID_238207191" CREATED="1566052520284" MODIFIED="1566052543014">
<node TEXT="&#x6267;&#x884c;&#x7b26;&#xff1a; @&#x6216;\" ID="ID_880538527" CREATED="1566052549540" MODIFIED="1566052572121"/>
<node TEXT="&#x6307;&#x4ee4;&#x64cd;&#x4f5c;&#x7b26;: param,return,retval,note&#x7b49;" ID="ID_82862597" CREATED="1566052577031" MODIFIED="1566052606489"/>
<node TEXT="&#x7279;&#x6b8a;&#x7b26;&#x53f7;&#x6307;&#x4ee4;&#x7b26;: -,#,::" ID="ID_829391481" CREATED="1566052608059" MODIFIED="1566052629748">
<node TEXT="-: &#x5e8f;&#x5217;,&#x751f;&#x6210;&#x4e00;&#x4e2a;&#x9ed1;&#x5fc3;&#x5708;" ID="ID_1900528984" CREATED="1566053275765" MODIFIED="1566053379156"/>
<node TEXT="-#: &#x6307;&#x5b9a;&#x6309;&#x987a;&#x5e8f;&#x6807;&#x8bb0;" ID="ID_406877425" CREATED="1566053382646" MODIFIED="1566053394552"/>
<node TEXT=":: &#x94fe;&#x63a5;&#x5230;&#x51fd;&#x6570;&#x529f;&#x80fd;" ID="ID_1254453255" CREATED="1566053302521" MODIFIED="1566053408823"/>
</node>
</node>
<node TEXT="&#x6307;&#x4ee4;&#x64cd;&#x4f5c;&#x7b26;&#x8bf4;&#x660e;" ID="ID_54854475" CREATED="1566052654704" MODIFIED="1566052667545">
<node TEXT="param: &#x6307;&#x5b9a;&#x51fd;&#x6570;&#x53c2;&#x6570;" ID="ID_611337842" CREATED="1566052671988" MODIFIED="1566052736966">
<node TEXT="@param &#x53c2;&#x6570;&#x540d; &#x53c2;&#x6570;&#x8bf4;&#x660e;" ID="ID_1743750311" CREATED="1566052738943" MODIFIED="1566052761078"/>
<node TEXT="@param [in] &#x53c2;&#x6570;&#x540d; &#x53c2;&#x6570;&#x8bf4;&#x660e;" ID="ID_706163328" CREATED="1566052762769" MODIFIED="1566052789474"/>
<node TEXT="@param [out] &#x53c2;&#x6570;&#x540d; &#x53c2;&#x6570;&#x8bf4;&#x660e;" ID="ID_1347672569" CREATED="1566052790399" MODIFIED="1566052807001"/>
<node TEXT="@param [in,out] &#x53c2;&#x6570;&#x540d; &#x53c2;&#x6570;&#x8bf4;&#x660e;" ID="ID_1103527692" CREATED="1566055710838" MODIFIED="1566055729656"/>
</node>
<node TEXT="return: &#x6307;&#x5b9a;&#x51fd;&#x6570;&#x8fd4;&#x56de;&#x8bf4;&#x660e;" FOLDED="true" ID="ID_626623802" CREATED="1566052826018" MODIFIED="1566052862551">
<node TEXT="@return &#x8bf4;&#x660e;&#xa;- -1&#x8868;&#x793a;&#x5199;&#x5165;&#x5931;&#x8d25; (&#x503c;&#x8bf4;&#x660e;)" ID="ID_475448558" CREATED="1566052845827" MODIFIED="1566052894846"/>
</node>
<node TEXT="retval: &#x6307;&#x4ee4;&#x51fd;&#x6570;&#x8fd4;&#x56de;&#x503c;&#x8bf4;&#x660e;" ID="ID_212145886" CREATED="1566052908565" MODIFIED="1566052953738">
<node TEXT="@retval &#x8fd4;&#x56de;&#x503c; &#x7b80;&#x8981;&#x8bf4;&#x660e;" ID="ID_1010546070" CREATED="1566052923388" MODIFIED="1566052938807"/>
</node>
<node TEXT="note: &#x6307;&#x5b9a;&#x51fd;&#x6570;&#x6ce8;&#x610f;&#x4e8b;&#x9879;&#x6216;&#x91cd;&#x8981;&#x7684;&#x6ce8;&#x89e3;&#x6307;&#x4ee4;&#x64cd;&#x4f5c;&#x7b26;" FOLDED="true" ID="ID_564472456" CREATED="1566052960740" MODIFIED="1566052982915">
<node TEXT="@note &#x7b80;&#x8981;&#x8bf4;&#x660e;" ID="ID_1542810788" CREATED="1566052985297" MODIFIED="1566052993497"/>
</node>
<node TEXT="pre: &#x6307;&#x5b9a;&#x51fd;&#x6570;&#x7684;&#x524d;&#x7f6e;&#x6761;&#x4ef6;" ID="ID_1221862963" CREATED="1566053008276" MODIFIED="1566053023275">
<node TEXT="@pre &#x7b80;&#x8981;&#x8bf4;&#x660e;" ID="ID_1047788447" CREATED="1566053026171" MODIFIED="1566053033722"/>
</node>
<node TEXT="par: &#x6307;&#x5b9a;&#x6269;&#x5c55;&#x6027;&#x8bf4;&#x660e;&#xff0c;&#x4e00;&#x822c;&#x4e0e;code encode&#x4f7f;&#x7528;" FOLDED="true" ID="ID_1160138510" CREATED="1566053072525" MODIFIED="1566053097579">
<node TEXT="@par &#x6269;&#x5c55;&#x540d;&#x5b57;" ID="ID_1092782019" CREATED="1566053100174" MODIFIED="1566053110979"/>
</node>
<node TEXT="code,endcode: &#x6307;&#x5b9a;&#x4ee3;&#x7801;&#x8bf4;&#x6709;" ID="ID_1745286685" CREATED="1566053128910" MODIFIED="1566053151909">
<node TEXT="@code&#xa;// &#x4ee3;&#x7801;&#x6ce8;&#x91ca;&#xa;...&#x4ee3;&#x7801;...&#xa;@endcode" ID="ID_763486045" CREATED="1566053166247" MODIFIED="1566053207393"/>
</node>
<node TEXT="see: &#x6307;&#x5b9a;&#x53c2;&#x8003;&#x4fe1;&#x606f;" FOLDED="true" ID="ID_864543009" CREATED="1566053215359" MODIFIED="1566053225568">
<node TEXT="@see &#x7b80;&#x8981;&#x53c2;&#x8003;&#x5185;&#x5bb9;" ID="ID_1375819320" CREATED="1566053230817" MODIFIED="1566053245943"/>
<node TEXT="@see &#x51fd;&#x6570;::XXX" ID="ID_1265728283" CREATED="1566053248404" MODIFIED="1566053264634"/>
</node>
<node TEXT="deprecated: &#x6307;&#x5b9a;&#x51fd;&#x6570;&#x8fc7;&#x65f6;" FOLDED="true" ID="ID_1603025066" CREATED="1566053331254" MODIFIED="1566053346052">
<node TEXT="@deprecated &#x7b80;&#x8981;&#x8bf4;&#x660e;" ID="ID_977437886" CREATED="1566053347947" MODIFIED="1566053358494"/>
</node>
</node>
</node>
<node TEXT="&#x6587;&#x4ef6;&#x6807;&#x8bb0;" POSITION="left" ID="ID_220953576" CREATED="1566055804396" MODIFIED="1566055810674">
<edge COLOR="#ff0000"/>
<node TEXT="file: &#x6307;&#x5b9a;&#x6587;&#x4ef6;&#x540d;" FOLDED="true" ID="ID_1150290839" CREATED="1566055816769" MODIFIED="1566055851099">
<node TEXT="@file &#x6587;&#x4ef6;&#x540d;" ID="ID_160871429" CREATED="1566055852845" MODIFIED="1566055859750"/>
</node>
<node TEXT="version: &#x6307;&#x5b9a;&#x7248; &#x672c;" FOLDED="true" ID="ID_248011456" CREATED="1566055863285" MODIFIED="1566055881685">
<node TEXT="@version &#x7248;&#x672c;" ID="ID_1224965317" CREATED="1566055883476" MODIFIED="1566055891160"/>
</node>
<node TEXT="date: &#x6307;&#x5b9a;&#x65f6;&#x95f4;" FOLDED="true" ID="ID_908499733" CREATED="1566055894579" MODIFIED="1566055903728">
<node TEXT="@date &#x65f6;&#x95f4;" ID="ID_1795186685" CREATED="1566055905245" MODIFIED="1566055911408"/>
</node>
<node TEXT="author: &#x6307;&#x5b9a;&#x4f5c;&#x8005;" ID="ID_1774858121" CREATED="1566055914110" MODIFIED="1566055923363">
<node TEXT="@author &#x6307;&#x5b9a;&#x4f5c;&#x8005;" ID="ID_1008802004" CREATED="1566055925396" MODIFIED="1566055938013"/>
</node>
</node>
<node TEXT="&#x5176;&#x5b83;&#x901a;&#x7528;&#x64cd;&#x4f5c;&#x7b26;" POSITION="left" ID="ID_920378792" CREATED="1566055945537" MODIFIED="1566055956598">
<edge COLOR="#0000ff"/>
<node TEXT="brief: &#x6307;&#x5b9a;&#x6982;&#x8981;&#x8bf4;&#x660e;" ID="ID_1974250619" CREATED="1566055966454" MODIFIED="1566055991678">
<node TEXT="@brief &#x8bf4;&#x660e;" ID="ID_299723739" CREATED="1566055993210" MODIFIED="1566056002446"/>
</node>
<node TEXT="details: &#x8be6;&#x7ec6;&#x63cf;&#x8ff0;" FOLDED="true" ID="ID_1504475051" CREATED="1566055055328" MODIFIED="1566055068229">
<node TEXT="@details &#x8be6;&#x7ec6;&#x8bf4;&#x660e;" ID="ID_900109835" CREATED="1566055070495" MODIFIED="1566055080232"/>
</node>
<node TEXT="attention: &#x6ce8;&#x610f;&#x4fe1;&#x606f;" ID="ID_1131063009" CREATED="1566056172902" MODIFIED="1566056188847"/>
<node TEXT="warning: &#x8b66;&#x544a;&#x4fe1;&#x606f;" ID="ID_1498836277" CREATED="1566056189596" MODIFIED="1566056201966"/>
<node TEXT="enum&#x5f15;&#x7528;&#x67d0;&#x4e2a;&#x679a;&#x4e3e;" ID="ID_1280177908" CREATED="1566056208447" MODIFIED="1566056230361"/>
<node TEXT="todo: &#x8868;&#x793a;&#x9700;&#x8981;&#x5b9e;&#x73b0;" ID="ID_1851469853" CREATED="1566056580934" MODIFIED="1566056600885"/>
</node>
</node>
</map>
