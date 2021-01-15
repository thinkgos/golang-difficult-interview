<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="casbin" FOLDED="false" ID="ID_216656331" CREATED="1561108585915" MODIFIED="1561108826248" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
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
<hook NAME="AutomaticEdgeColor" COUNTER="3" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Model" POSITION="right" ID="ID_57811491" CREATED="1561108829065" MODIFIED="1561108835755">
<edge COLOR="#00ff00"/>
<node TEXT="config" ID="ID_1517819254" CREATED="1561108743968" MODIFIED="1561108839566">
<node TEXT="[request_definition]" ID="ID_1612930558" CREATED="1561108753569" MODIFIED="1561108772378">
<node TEXT="&#x5217;&#xff1a;&#xa;[request_definition]&#xa;r = sub, obj, act&#xa;sub, obj, act &#x8868;&#x793a;&#x7ecf;&#x5178;&#x4e09;&#x5143;&#x7ec4;: &#x8bbf;&#x95ee;&#x5b9e;&#x4f53; (Subject)&#xff0c;&#x8bbf;&#x95ee;&#x8d44;&#x6e90; (Object) &#x548c;&#x8bbf;&#x95ee;&#x65b9;&#x6cd5; (Action)" ID="ID_1347195712" CREATED="1561108895401" MODIFIED="1561108984226"/>
</node>
<node TEXT="[policy_definition]" ID="ID_873933883" CREATED="1561108773069" MODIFIED="1561108780470">
<node TEXT="&#x4f8b;&#xff1a;&#xa;[policy_definition]&#xa;p = sub, obj, act&#xa;p2 = sub, act" ID="ID_1318793975" CREATED="1561109060593" MODIFIED="1561109101102"/>
</node>
<node TEXT="[policy_effect]" ID="ID_516353312" CREATED="1561108781001" MODIFIED="1561108850665"/>
<node TEXT="[matchers]" ID="ID_884940149" CREATED="1561108789736" MODIFIED="1561108796268"/>
<node TEXT="RBAC: [role_definition]" ID="ID_308080772" CREATED="1561108803987" MODIFIED="1561108820635"/>
<node TEXT="&#x6ce8;&#x91ca;:  # &#x5f00;&#x5934;" ID="ID_1380099931" CREATED="1561108860794" MODIFIED="1561108878315"/>
</node>
</node>
</node>
</map>
