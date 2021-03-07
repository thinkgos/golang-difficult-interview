<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="go-swagger" LOCALIZED_STYLE_REF="styles.topic" FOLDED="false" ID="ID_946326403" CREATED="1574164404067" MODIFIED="1574165904390" LINK="https://github.com/swaggo/swag"><hook NAME="MapStyle" zoom="0.754">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_icon_for_attributes="true" show_note_icons="true" fit_to_viewport="false"/>

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
<hook NAME="AutomaticEdgeColor" COUNTER="7" RULE="ON_BRANCH_CREATION"/>
<node TEXT="General API info" POSITION="right" ID="ID_675591982" CREATED="1574164488430" MODIFIED="1574164916726">
<edge COLOR="#ff0000"/>
<node TEXT="@title Required. The title of the application." ID="ID_1544077363" CREATED="1574164502485" MODIFIED="1574164549299"/>
<node TEXT="@version Required. Provides the version of the application API." ID="ID_1920708217" CREATED="1574164552474" MODIFIED="1574164568093"/>
<node TEXT="@description A short description of the application." ID="ID_10932074" CREATED="1574164570899" MODIFIED="1574164600418"/>
<node TEXT="@tag.name name of a tag" ID="ID_1512059462" CREATED="1574164601561" MODIFIED="1574164615092"/>
<node TEXT="@tag.description Description of the tag" ID="ID_838532069" CREATED="1574164632337" MODIFIED="1574164635034"/>
<node TEXT="@tag.docs.url Url of the external Documentation of the tag" ID="ID_92832586" CREATED="1574164636820" MODIFIED="1574164649406"/>
<node TEXT="@tag.docs.description Description of the external Documentation of the tag" ID="ID_1024951731" CREATED="1574164668310" MODIFIED="1574164670196"/>
<node TEXT="@termsOfService The Terms of Service for the API." ID="ID_299103894" CREATED="1574164683341" MODIFIED="1574164685384"/>
<node TEXT="@contact.name The contact information for the exposed API." ID="ID_992878096" CREATED="1574164696258" MODIFIED="1574164698591"/>
<node TEXT="@contact.url The URL pointing to the contact information. MUST be in the format of a URL." ID="ID_458262450" CREATED="1574164705432" MODIFIED="1574164707292"/>
<node TEXT="@contact.email The email address of the contact person/organization. MUST be in the format of an email address." ID="ID_1366065855" CREATED="1574164715458" MODIFIED="1574164717137"/>
<node TEXT="@license.name Required. The license name used for the API." ID="ID_1686231871" CREATED="1574164725093" MODIFIED="1574164726822"/>
<node TEXT="@license.url A URL to the license used for the API. MUST be in the format of a URL." ID="ID_1232410838" CREATED="1574164732463" MODIFIED="1574164734791"/>
<node TEXT="@host The host (name or ip) serving the API." ID="ID_168667933" CREATED="1574164741106" MODIFIED="1574164742689"/>
<node TEXT="@BasePath The base path on which the API is served." ID="ID_619331343" CREATED="1574164749170" MODIFIED="1574164750890"/>
<node TEXT="@schemes The transfer protocol for the operation that separated by spaces." ID="ID_486324275" CREATED="1574164756695" MODIFIED="1574164758325"/>
<node TEXT="@x-name The extension key, must be start by x- and take only json value" ID="ID_1274939145" CREATED="1574164765244" MODIFIED="1574164767381">
<node TEXT="// @x-example-key {&quot;key&quot;: &quot;value&quot;}" ID="ID_606720089" CREATED="1574164777714" MODIFIED="1574164779500"/>
</node>
</node>
<node TEXT="Using markdown description" POSITION="right" ID="ID_1307352449" CREATED="1574164823531" MODIFIED="1574165792061">
<edge COLOR="#0000ff"/>
<node TEXT="@title Required. The title of the application." ID="ID_332796659" CREATED="1574164834867" MODIFIED="1574164845787"/>
<node TEXT="@version Required. Provides the version of the application API." ID="ID_1852913494" CREATED="1574164851389" MODIFIED="1574164853556"/>
<node TEXT="@description.markdown A short description of the application. Parsed from the api.md file. This is an alternative to @description" ID="ID_1656585136" CREATED="1574164871537" MODIFIED="1574165792060"/>
<node TEXT="@tag.name Name of a tag." ID="ID_635138927" CREATED="1574164886135" MODIFIED="1574164888590"/>
<node TEXT="@tag.description.markdown Description of the tag this is an alternative to tag.description. The description will be read from a file named like tagname.md" ID="ID_74769361" CREATED="1574164898737" MODIFIED="1574164900218"/>
</node>
<node TEXT="API Operation" POSITION="right" ID="ID_397767090" CREATED="1574164903004" MODIFIED="1574165787772">
<icon BUILTIN="bookmark"/>
<edge COLOR="#00ff00"/>
<node TEXT="@description A verbose explanation of the operation behavior." ID="ID_402360369" CREATED="1574164919122" MODIFIED="1574164940777"/>
<node TEXT="@id A unique string used to identify the operation. Must be unique among all API operations." ID="ID_596048997" CREATED="1574164941196" MODIFIED="1574164949276"/>
<node TEXT="@tags A list of tags to each API operation that separated by commas." ID="ID_1787644108" CREATED="1574164956095" MODIFIED="1574164957342"/>
<node TEXT="@summary A short summary of what the operation does." LOCALIZED_STYLE_REF="default" ID="ID_795693939" CREATED="1574164962667" MODIFIED="1574165919389">
<icon BUILTIN="yes"/>
</node>
<node TEXT="@accept A list of MIME types the APIs can consume. Value MUST be as described under Mime Types." ID="ID_296742437" CREATED="1574164974487" MODIFIED="1574165802615">
<icon BUILTIN="yes"/>
</node>
<node TEXT="@produce A list of MIME types the APIs can produce. Value MUST be as described under Mime Types." ID="ID_904656914" CREATED="1574164985118" MODIFIED="1574165805374">
<icon BUILTIN="yes"/>
</node>
<node TEXT="@param Parameters that separated by spaces." ID="ID_1369485718" CREATED="1574164990457" MODIFIED="1574165811060">
<icon BUILTIN="yes"/>
<node TEXT="param name,param type,data type,is mandatory?,comment attribute(optional)" ID="ID_1683164059" CREATED="1574165003665" MODIFIED="1574165841907">
<icon BUILTIN="info"/>
</node>
</node>
<node TEXT="@security Security to each API operation." ID="ID_1112160041" CREATED="1574165032868" MODIFIED="1574165041386"/>
<node TEXT="@success Success response that separated by spaces. return code,{param type},data type,comment" ID="ID_1713166829" CREATED="1574165049769" MODIFIED="1574165816651">
<icon BUILTIN="yes"/>
</node>
<node TEXT="@failure Failure response that separated by spaces. return code,{param type},data type,comment" ID="ID_171244674" CREATED="1574165059248" MODIFIED="1574165819205">
<icon BUILTIN="yes"/>
</node>
<node TEXT="@header Header in response that separated by spaces. return code,{param type},data type,comment" ID="ID_1542452868" CREATED="1574165067049" MODIFIED="1574165068290"/>
<node TEXT="@router Path definition that separated by spaces. path,[httpMethod]" ID="ID_1154272729" CREATED="1574165074323" MODIFIED="1574166225283">
<icon BUILTIN="yes"/>
</node>
<node TEXT="@x-name The extension key, must be start by x- and take only json value." ID="ID_966023047" CREATED="1574165081617" MODIFIED="1574165082849"/>
</node>
<node TEXT="Mime Type" POSITION="right" ID="ID_1542908565" CREATED="1574165095108" MODIFIED="1574165116454">
<edge COLOR="#ff00ff"/>
<node TEXT="json: application/json" ID="ID_730116015" CREATED="1574165119157" MODIFIED="1574165136189"/>
<node TEXT="xml: text/xml" ID="ID_1335522890" CREATED="1574165141876" MODIFIED="1574165154786"/>
<node TEXT="plain: text/plain" ID="ID_1748800629" CREATED="1574165159527" MODIFIED="1574165223552"/>
<node TEXT="html: text/html" ID="ID_1722939177" CREATED="1574165166731" MODIFIED="1574165227954"/>
<node TEXT="mpfd: multipart/form-data" ID="ID_1763215150" CREATED="1574165172265" MODIFIED="1574165231729"/>
<node TEXT="x-www-form-urlencoded: application/x-www-form-urlencoded" ID="ID_3654380" CREATED="1574165178449" MODIFIED="1574165237049"/>
<node TEXT="json-api: application/vnd.api+json" ID="ID_1325490082" CREATED="1574165184832" MODIFIED="1574165240302"/>
<node TEXT="json-stream: application/x-json-stream" ID="ID_531819581" CREATED="1574165191566" MODIFIED="1574165243427"/>
<node TEXT="octet-stream: application/octet-stream" ID="ID_1119352419" CREATED="1574165196772" MODIFIED="1574165246894"/>
<node TEXT="png: image/png" ID="ID_1821129848" CREATED="1574165202735" MODIFIED="1574165249890"/>
<node TEXT="jpeg: image/jpeg" ID="ID_943460059" CREATED="1574165208370" MODIFIED="1574165252779"/>
<node TEXT="gif: image/gif" ID="ID_733464226" CREATED="1574165214322" MODIFIED="1574165256028"/>
</node>
<node TEXT="Param Type" POSITION="right" ID="ID_1245225175" CREATED="1574165937195" MODIFIED="1574165945188">
<edge COLOR="#00ffff"/>
<node TEXT="query" ID="ID_1609378303" CREATED="1574165947219" MODIFIED="1574166205390">
<icon BUILTIN="yes"/>
</node>
<node TEXT="path" ID="ID_1294224719" CREATED="1574165967694" MODIFIED="1574166207826">
<icon BUILTIN="yes"/>
</node>
<node TEXT="header" ID="ID_624073230" CREATED="1574165952175" MODIFIED="1574165956268"/>
<node TEXT="body" ID="ID_1876290238" CREATED="1574165957026" MODIFIED="1574166210275">
<icon BUILTIN="yes"/>
</node>
<node TEXT="formData" ID="ID_1872480471" CREATED="1574165959987" MODIFIED="1574165975985"/>
</node>
<node TEXT="Data Type" POSITION="right" ID="ID_67501819" CREATED="1574165978569" MODIFIED="1574165985744">
<edge COLOR="#7c0000"/>
<node TEXT="string: string" ID="ID_1026473304" CREATED="1574165989224" MODIFIED="1574166002980"/>
<node TEXT="integer: int uint uint32 uint64" ID="ID_371791999" CREATED="1574166003276" MODIFIED="1574166016010"/>
<node TEXT="number: float32" ID="ID_925033361" CREATED="1574166016410" MODIFIED="1574166023477"/>
<node TEXT="boolean: bool" ID="ID_947876320" CREATED="1574166023785" MODIFIED="1574166031466"/>
<node TEXT="user defined struct" ID="ID_1054120621" CREATED="1574166032251" MODIFIED="1574166042749">
<icon BUILTIN="button_ok"/>
</node>
</node>
<node TEXT="Security" POSITION="right" ID="ID_743616797" CREATED="1574165986147" MODIFIED="1574166192937">
<icon BUILTIN="help"/>
<edge COLOR="#00007c"/>
</node>
</node>
</map>
