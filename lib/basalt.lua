local aa={}local ba=true;local ca=require
local da=function(ab)
for bb,cb in pairs(aa)do
if(type(cb)=="table")then for db,_c in pairs(cb)do if(db==ab)then
return _c()end end else if(bb==ab)then return cb()end end end;return ca(ab)end
local _b=function(ab)if(ab~=nil)then return aa[ab]end;return aa end
aa["theme"]=function(...)
return
{BasaltBG=colors.lightGray,BasaltText=colors.black,FrameBG=colors.gray,FrameText=colors.black,ButtonBG=colors.gray,ButtonText=colors.black,CheckboxBG=colors.gray,CheckboxText=colors.black,InputBG=colors.gray,InputText=colors.black,TextfieldBG=colors.gray,TextfieldText=colors.black,ListBG=colors.gray,ListText=colors.black,MenubarBG=colors.gray,MenubarText=colors.black,DropdownBG=colors.gray,DropdownText=colors.black,RadioBG=colors.gray,RadioText=colors.black,SelectionBG=colors.black,SelectionText=colors.lightGray,GraphicBG=colors.black,ImageBG=colors.black,PaneBG=colors.black,ProgramBG=colors.black,ProgressbarBG=colors.gray,ProgressbarText=colors.black,ProgressbarActiveBG=colors.black,ScrollbarBG=colors.lightGray,ScrollbarText=colors.gray,ScrollbarSymbolColor=colors.black,SliderBG=false,SliderText=colors.gray,SliderSymbolColor=colors.black,SwitchBG=colors.lightGray,SwitchText=colors.gray,SwitchBGSymbol=colors.black,SwitchInactive=colors.red,SwitchActive=colors.green,LabelBG=false,LabelText=colors.black}end
aa["Object"]=function(...)local ab=da("basaltEvent")local bb=da("utils")
local cb=bb.splitString;local db=bb.numberFromString;local _c=bb.getValueFromXML
return
function(ac)local bc="Object"local cc={}local dc=1
local _d;local ad="topLeft"local bd=false;local cd=true;local dd=false;local __a=false;local a_a=false;local b_a=false
local c_a={left=false,right=false,top=false,bottom=false}local d_a=colors.black;local _aa=true;local aaa=false;local baa,caa,daa,_ba=0,0,0,0;local aba=true;local bba={}
local cba=ab()
cc={x=1,y=1,width=1,height=1,bgColor=colors.black,bgSymbol=" ",bgSymbolColor=colors.black,fgColor=colors.white,transparentColor=false,name=ac or"Object",parent=nil,show=function(dba)cd=true
dba:updateDraw()return dba end,hide=function(dba)cd=false;dba:updateDraw()return dba end,enable=function(dba)
_aa=true;return dba end,disable=function(dba)_aa=false;return dba end,isEnabled=function(dba)return _aa end,generateXMLEventFunction=function(dba,_ca,aca)
local bca=function(cca)
if(
cca:sub(1,1)=="#")then
local dca=dba:getBaseFrame():getDeepObject(cca:sub(2,cca:len()))
if(dca~=nil)and(dca.internalObjetCall~=nil)then _ca(dba,function()
dca:internalObjetCall()end)end else
_ca(dba,dba:getBaseFrame():getVariable(cca))end end;if(type(aca)=="string")then bca(aca)elseif(type(aca)=="table")then
for cca,dca in pairs(aca)do bca(dca)end end;return dba end,setValuesByXMLData=function(dba,_ca)
local aca=dba:getBaseFrame()if(_c("x",_ca)~=nil)then
dba:setPosition(_c("x",_ca),dba.y)end;if(_c("y",_ca)~=nil)then
dba:setPosition(dba.x,_c("y",_ca))end;if(_c("width",_ca)~=nil)then
dba:setSize(_c("width",_ca),dba.height)end;if(_c("height",_ca)~=nil)then
dba:setSize(dba.width,_c("height",_ca))end;if(_c("bg",_ca)~=nil)then
dba:setBackground(colors[_c("bg",_ca)])end;if(_c("fg",_ca)~=nil)then
dba:setForeground(colors[_c("fg",_ca)])end;if(_c("value",_ca)~=nil)then
dba:setValue(colors[_c("value",_ca)])end
if(_c("visible",_ca)~=nil)then if
(_c("visible",_ca))then dba:show()else dba:hide()end end
if(_c("enabled",_ca)~=nil)then if(_c("enabled",_ca))then dba:enable()else
dba:disable()end end;if(_c("zIndex",_ca)~=nil)then
dba:setZIndex(_c("zIndex",_ca))end;if(_c("anchor",_ca)~=nil)then
dba:setAnchor(_c("anchor",_ca))end;if(_c("shadowColor",_ca)~=nil)then
dba:setShadow(colors[_c("shadowColor",_ca)])end;if(_c("border",_ca)~=nil)then
dba:setBorder(colors[_c("border",_ca)])end;if(_c("borderLeft",_ca)~=nil)then
c_a["left"]=_c("borderLeft",_ca)end;if(_c("borderTop",_ca)~=nil)then
c_a["top"]=_c("borderTop",_ca)end;if(_c("borderRight",_ca)~=nil)then
c_a["right"]=_c("borderRight",_ca)end;if(_c("borderBottom",_ca)~=nil)then
c_a["bottom"]=_c("borderBottom",_ca)end;if(_c("borderColor",_ca)~=nil)then
dba:setBorder(colors[_c("borderColor",_ca)])end;if
(_c("ignoreOffset",_ca)~=nil)then
if(_c("ignoreOffset",_ca))then dba:ignoreOffset(true)end end;if
(_c("onClick",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onClick,_c("onClick",_ca))end;if
(_c("onClickUp",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onClickUp,_c("onClickUp",_ca))end;if
(_c("onScroll",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onScroll,_c("onScroll",_ca))end;if
(_c("onDrag",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onDrag,_c("onDrag",_ca))end;if(_c("onHover",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onHover,_c("onHover",_ca))end;if
(_c("onLeave",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onLeave,_c("onLeave",_ca))end;if(_c("onKey",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onKey,_c("onKey",_ca))end;if(_c("onKeyUp",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onKeyUp,_c("onKeyUp",_ca))end;if
(_c("onChange",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onChange,_c("onChange",_ca))end;if
(_c("onResize",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onResize,_c("onResize",_ca))end;if
(_c("onReposition",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onReposition,_c("onReposition",_ca))end;if
(_c("onEvent",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onEvent,_c("onEvent",_ca))end;if
(_c("onGetFocus",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onGetFocus,_c("onGetFocus",_ca))end;if
(_c("onLoseFocus",_ca)~=nil)then
dba:generateXMLEventFunction(dba.onLoseFocus,_c("onLoseFocus",_ca))end
dba:updateDraw()return dba end,isVisible=function(dba)return
cd end,setFocus=function(dba)if(dba.parent~=nil)then
dba.parent:setFocusedObject(dba)end;return dba end,setZIndex=function(dba,_ca)
dc=_ca
if(dba.parent~=nil)then dba.parent:removeObject(dba)
dba.parent:addObject(dba)dba:updateEventHandlers()end;return dba end,updateEventHandlers=function(dba)
for _ca,aca in
pairs(bba)do if(aca)then dba.parent:addEvent(_ca,dba)end end end,getZIndex=function(dba)return dc end,getType=function(dba)return bc end,getName=function(dba)return
dba.name end,remove=function(dba)if(dba.parent~=nil)then
dba.parent:removeObject(dba)end;dba:updateDraw()return dba end,setParent=function(dba,_ca)
if(
_ca.getType~=nil and _ca:getType()=="Frame")then
dba:remove()_ca:addObject(dba)if(dba.draw)then dba:show()end end;return dba end,setValue=function(dba,_ca)
if(
_d~=_ca)then _d=_ca;dba:updateDraw()dba:valueChangedHandler()end;return dba end,getValue=function(dba)return _d end,getDraw=function(dba)return
aba end,updateDraw=function(dba,_ca)aba=_ca;if(_ca==nil)then aba=true end;if(aba)then if(dba.parent~=nil)then
dba.parent:updateDraw()end end;return dba end,getEventSystem=function(dba)return
cba end,getParent=function(dba)return dba.parent end,setPosition=function(dba,_ca,aca,bca)
if(type(_ca)=="number")then dba.x=
bca and dba:getX()+_ca or _ca end;if(type(aca)=="number")then
dba.y=bca and dba:getY()+aca or aca end
if(dba.parent~=nil)then if(type(_ca)=="string")then
dba.x=dba.parent:newDynamicValue(dba,_ca)end;if(type(aca)=="string")then
dba.y=dba.parent:newDynamicValue(dba,aca)end
dba.parent:recalculateDynamicValues()end;cba:sendEvent("basalt_reposition",dba)
dba:updateDraw()return dba end,getX=function(dba)return

type(dba.x)=="number"and dba.x or math.floor(dba.x[1]+0.5)end,getY=function(dba)return

type(dba.y)=="number"and dba.y or math.floor(dba.y[1]+0.5)end,getPosition=function(dba)return
dba:getX(),dba:getY()end,getVisibility=function(dba)return cd end,setVisibility=function(dba,_ca)
cd=_ca or not cd;dba:updateDraw()return dba end,setSize=function(dba,_ca,aca,bca)if(type(_ca)==
"number")then
dba.width=bca and dba:getWidth()+_ca or _ca end
if(type(aca)=="number")then dba.height=bca and
dba:getHeight()+aca or aca end
if(dba.parent~=nil)then if(type(_ca)=="string")then
dba.width=dba.parent:newDynamicValue(dba,_ca)end;if(type(aca)=="string")then
dba.height=dba.parent:newDynamicValue(dba,aca)end
dba.parent:recalculateDynamicValues()end;cba:sendEvent("basalt_resize",dba)
dba:updateDraw()return dba end,getHeight=function(dba)
return
type(dba.height)=="number"and dba.height or
math.floor(dba.height[1]+0.5)end,getWidth=function(dba)return

type(dba.width)=="number"and dba.width or math.floor(dba.width[1]+0.5)end,getSize=function(dba)return
dba:getWidth(),dba:getHeight()end,calculateDynamicValues=function(dba)
if(
type(dba.width)=="table")then dba.width:calculate()end
if(type(dba.height)=="table")then dba.height:calculate()end
if(type(dba.x)=="table")then dba.x:calculate()end
if(type(dba.y)=="table")then dba.y:calculate()end;dba:updateDraw()return dba end,setBackground=function(dba,_ca,aca,bca)dba.bgColor=
_ca or false
dba.bgSymbol=aca or(dba.bgColor~=false and dba.bgSymbol or
false)dba.bgSymbolColor=bca or dba.bgSymbolColor
dba:updateDraw()return dba end,setTransparent=function(dba,_ca)dba.transparentColor=
_ca or false;dba.bgSymbol=false;dba.bgSymbolColor=false
dba:updateDraw()return dba end,getBackground=function(dba)return
dba.bgColor end,setForeground=function(dba,_ca)dba.fgColor=_ca or false
dba:updateDraw()return dba end,getForeground=function(dba)return dba.fgColor end,setShadow=function(dba,_ca)if(
_ca==false)then b_a=false else d_a=_ca;b_a=true end
dba:updateDraw()return dba end,isShadowActive=function(dba)return b_a end,setBorder=function(dba,...)
if(
...~=nil)then local _ca={...}
for aca,bca in pairs(_ca)do if(bca=="left")or(#_ca==1)then
c_a["left"]=_ca[1]end;if(bca=="top")or(#_ca==1)then
c_a["top"]=_ca[1]end;if(bca=="right")or(#_ca==1)then
c_a["right"]=_ca[1]end;if(bca=="bottom")or(#_ca==1)then
c_a["bottom"]=_ca[1]end end end;dba:updateDraw()return dba end,getBorder=function(dba,_ca)if(
_ca=="left")then return borderLeft end
if(_ca=="top")then return borderTop end;if(_ca=="right")then return borderRight end;if(_ca=="bottom")then
return borderBottom end end,draw=function(dba)
if
(cd)then
if(dba.parent~=nil)then local _ca,aca=dba:getAnchorPosition()
local bca,cca=dba:getSize()local dca,_da=dba.parent:getSize()
if(_ca+bca<1)or(_ca>dca)or(aca+
cca<1)or(aca>_da)then return false end;if(dba.transparentColor~=false)then
dba.parent:drawForegroundBox(_ca,aca,bca,cca,dba.transparentColor)end;if(dba.bgColor~=false)then
dba.parent:drawBackgroundBox(_ca,aca,bca,cca,dba.bgColor)end
if(dba.bgSymbol~=false)then
dba.parent:drawTextBox(_ca,aca,bca,cca,dba.bgSymbol)if(dba.bgSymbol~=" ")then
dba.parent:drawForegroundBox(_ca,aca,bca,cca,dba.bgSymbolColor)end end
if(b_a)then
dba.parent:drawBackgroundBox(_ca+1,aca+cca,bca,1,d_a)
dba.parent:drawBackgroundBox(_ca+bca,aca+1,1,cca,d_a)
dba.parent:drawForegroundBox(_ca+1,aca+cca,bca,1,d_a)
dba.parent:drawForegroundBox(_ca+bca,aca+1,1,cca,d_a)end;local ada=dba.bgColor
if(c_a["left"]~=false)then
dba.parent:drawTextBox(_ca,aca,1,cca,"\149")if(ada~=false)then
dba.parent:drawBackgroundBox(_ca,aca,1,cca,dba.bgColor)end
dba.parent:drawForegroundBox(_ca,aca,1,cca,c_a["left"])end
if(c_a["top"]~=false)then
dba.parent:drawTextBox(_ca,aca,bca,1,"\131")if(ada~=false)then
dba.parent:drawBackgroundBox(_ca,aca,bca,1,dba.bgColor)end
dba.parent:drawForegroundBox(_ca,aca,bca,1,c_a["top"])end
if(c_a["left"]~=false)and(c_a["top"]~=false)then
dba.parent:drawTextBox(_ca,aca,1,1,"\151")if(ada~=false)then
dba.parent:drawBackgroundBox(_ca,aca,1,1,dba.bgColor)end
dba.parent:drawForegroundBox(_ca,aca,1,1,c_a["left"])end
if(c_a["right"]~=false)then
dba.parent:drawTextBox(_ca+bca-1,aca,1,cca,"\149")if(ada~=false)then
dba.parent:drawForegroundBox(_ca+bca-1,aca,1,cca,dba.bgColor)end
dba.parent:drawBackgroundBox(_ca+bca-1,aca,1,cca,c_a["right"])end
if(c_a["bottom"]~=false)then
dba.parent:drawTextBox(_ca,aca+cca-1,bca,1,"\143")if(ada~=false)then
dba.parent:drawForegroundBox(_ca,aca+cca-1,bca,1,dba.bgColor)end
dba.parent:drawBackgroundBox(_ca,aca+cca-1,bca,1,c_a["bottom"])end
if(c_a["top"]~=false)and(c_a["right"]~=false)then dba.parent:drawTextBox(
_ca+bca-1,aca,1,1,"\148")if
(ada~=false)then
dba.parent:drawForegroundBox(_ca+bca-1,aca,1,1,dba.bgColor)end
dba.parent:drawBackgroundBox(_ca+bca-1,aca,1,1,c_a["right"])end
if(c_a["right"]~=false)and(c_a["bottom"]~=false)then
dba.parent:drawTextBox(
_ca+bca-1,aca+cca-1,1,1,"\133")if(ada~=false)then
dba.parent:drawForegroundBox(_ca+bca-1,aca+cca-1,1,1,dba.bgColor)end
dba.parent:drawBackgroundBox(_ca+bca-1,
aca+cca-1,1,1,c_a["right"])end
if(c_a["bottom"]~=false)and(c_a["left"]~=false)then dba.parent:drawTextBox(_ca,
aca+cca-1,1,1,"\138")if(ada~=false)then
dba.parent:drawForegroundBox(
_ca-1,aca+cca-1,1,1,dba.bgColor)end
dba.parent:drawBackgroundBox(_ca,aca+cca-1,1,1,c_a["left"])end end;aba=false;return true end;return false end,getAbsolutePosition=function(dba,_ca,aca)
if(
_ca==nil)or(aca==nil)then _ca,aca=dba:getAnchorPosition()end
if(dba.parent~=nil)then
local bca,cca=dba.parent:getAbsolutePosition()_ca=bca+_ca-1;aca=cca+aca-1 end;return _ca,aca end,getAnchorPosition=function(dba,_ca,aca,bca)if(
_ca==nil)then _ca=dba:getX()end
if(aca==nil)then aca=dba:getY()end
if(dba.parent~=nil)then local cca,dca=dba.parent:getSize()
if(ad=="top")then _ca=math.floor(
cca/2)+_ca-1 elseif(ad=="topRight")then
_ca=cca+_ca-1 elseif(ad=="right")then _ca=cca+_ca-1
aca=math.floor(dca/2)+aca-1 elseif(ad=="bottomRight")then _ca=cca+_ca-1;aca=dca+aca-1 elseif(ad=="bottom")then _ca=math.floor(
cca/2)+_ca-1;aca=dca+aca-1 elseif(ad==
"bottomLeft")then aca=dca+aca-1 elseif(ad=="left")then
aca=math.floor(dca/2)+aca-1 elseif(ad=="center")then _ca=math.floor(cca/2)+_ca-1;aca=math.floor(
dca/2)+aca-1 end;local _da,ada=dba.parent:getOffsetInternal()if not(bd or bca)then return _ca+
_da,aca+ada end end;return _ca,aca end,ignoreOffset=function(dba,_ca)
bd=_ca;if(_ca==nil)then bd=true end;return dba end,getBaseFrame=function(dba)
if(
dba.parent~=nil)then return dba.parent:getBaseFrame()end;return dba end,setAnchor=function(dba,_ca)ad=_ca
dba:updateDraw()return dba end,getAnchor=function(dba)return ad end,onChange=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("value_changed",aca)end end;return dba end,onClick=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("mouse_click",aca)end end
if(dba.parent~=nil)then
dba.parent:addEvent("mouse_click",dba)bba["mouse_click"]=true
dba.parent:addEvent("mouse_up",dba)bba["mouse_up"]=true end;return dba end,onClickUp=function(dba,...)for _ca,aca in
pairs(table.pack(...))do
if(type(aca)=="function")then dba:registerEvent("mouse_up",aca)end end
if(dba.parent~=nil)then
dba.parent:addEvent("mouse_click",dba)bba["mouse_click"]=true
dba.parent:addEvent("mouse_up",dba)bba["mouse_up"]=true end;return dba end,onRelease=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("mouse_release",aca)end end
if(dba.parent~=nil)then
dba.parent:addEvent("mouse_click",dba)bba["mouse_click"]=true
dba.parent:addEvent("mouse_up",dba)bba["mouse_up"]=true end;return dba end,onScroll=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("mouse_scroll",aca)end end
if(dba.parent~=nil)then
dba.parent:addEvent("mouse_scroll",dba)bba["mouse_scroll"]=true end;return dba end,onHover=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("mouse_hover",aca)end end;if(dba.parent~=nil)then
dba.parent:addEvent("mouse_move",dba)bba["mouse_move"]=true end
return dba end,onLeave=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("mouse_leave",aca)end end;if(dba.parent~=nil)then
dba.parent:addEvent("mouse_move",dba)bba["mouse_move"]=true end
return dba end,onDrag=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("mouse_drag",aca)end end
if(dba.parent~=nil)then
dba.parent:addEvent("mouse_drag",dba)bba["mouse_drag"]=true
dba.parent:addEvent("mouse_click",dba)bba["mouse_click"]=true
dba.parent:addEvent("mouse_up",dba)bba["mouse_up"]=true end;return dba end,onEvent=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("other_event",aca)end end;if(dba.parent~=nil)then
dba.parent:addEvent("other_event",dba)bba["other_event"]=true end;return
dba end,onKey=function(dba,...)
if
(_aa)then
for _ca,aca in pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("key",aca)end end;if(dba.parent~=nil)then dba.parent:addEvent("key",dba)
bba["key"]=true end end;return dba end,onChar=function(dba,...)
if
(_aa)then
for _ca,aca in pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("char",aca)end end;if(dba.parent~=nil)then dba.parent:addEvent("char",dba)
bba["char"]=true end end;return dba end,onResize=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("basalt_resize",aca)end end;return dba end,onReposition=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("basalt_reposition",aca)end end;return dba end,onKeyUp=function(dba,...)for _ca,aca in
pairs(table.pack(...))do
if(type(aca)=="function")then dba:registerEvent("key_up",aca)end end;if(dba.parent~=nil)then
dba.parent:addEvent("key_up",dba)bba["key_up"]=true end;return dba end,isFocused=function(dba)if(
dba.parent~=nil)then
return dba.parent:getFocusedObject()==dba end;return false end,onGetFocus=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("get_focus",aca)end end;if(dba.parent~=nil)then
dba.parent:addEvent("mouse_click",dba)bba["mouse_click"]=true end;return
dba end,onLoseFocus=function(dba,...)
for _ca,aca in
pairs(table.pack(...))do if(type(aca)=="function")then
dba:registerEvent("lose_focus",aca)end end;if(dba.parent~=nil)then
dba.parent:addEvent("mouse_click",dba)bba["mouse_click"]=true end;return
dba end,registerEvent=function(dba,_ca,aca)return
cba:registerEvent(_ca,aca)end,removeEvent=function(dba,_ca,aca)
return cba:removeEvent(_ca,aca)end,sendEvent=function(dba,_ca,...)return cba:sendEvent(_ca,dba,...)end,isCoordsInObject=function(dba,_ca,aca)
if
(cd)and(_aa)then if(_ca==nil)or(aca==nil)then return false end
local bca,cca=dba:getAbsolutePosition()local dca,_da=dba:getSize()
if
(bca<=_ca)and(bca+dca>_ca)and(cca<=aca)and(cca+_da>aca)then return true end end;return false end,mouseHandler=function(dba,_ca,aca,bca,cca)
if
(dba:isCoordsInObject(aca,bca))then local dca,_da=dba:getAbsolutePosition()
local ada=cba:sendEvent("mouse_click",dba,"mouse_click",_ca,aca-
(dca-1),bca- (_da-1),cca)if(ada==false)then return false end;if(dba.parent~=nil)then
dba.parent:setFocusedObject(dba)end;a_a=true;aaa=true;baa,caa=aca,bca;return true end;return false end,mouseUpHandler=function(dba,_ca,aca,bca)
aaa=false
if(a_a)then local cca,dca=dba:getAbsolutePosition()
local _da=cba:sendEvent("mouse_release",dba,"mouse_release",_ca,aca- (
cca-1),bca- (dca-1))a_a=false end
if(dba:isCoordsInObject(aca,bca))then local cca,dca=dba:getAbsolutePosition()
local _da=cba:sendEvent("mouse_up",dba,"mouse_up",_ca,
aca- (cca-1),bca- (dca-1))if(_da==false)then return false end;return true end;return false end,dragHandler=function(dba,_ca,aca,bca)
if
(aaa)then local cca,dca=dba:getAbsolutePosition()
local _da=cba:sendEvent("mouse_drag",dba,"mouse_drag",_ca,aca- (cca-1),
bca- (dca-1),baa-aca,caa-bca,aca,bca)baa,caa=aca,bca;if(_da~=nil)then return _da end;if(dba.parent~=nil)then
dba.parent:setFocusedObject(dba)end;return true end
if(dba:isCoordsInObject(aca,bca))then
local cca,dca=dba:getAbsolutePosition(dba:getAnchorPosition())baa,caa=aca,bca;daa,_ba=cca-aca,dca-bca end;return false end,scrollHandler=function(dba,_ca,aca,bca)
if
(dba:isCoordsInObject(aca,bca))then local cca,dca=dba:getAbsolutePosition()
local _da=cba:sendEvent("mouse_scroll",dba,"mouse_scroll",_ca,aca-
(cca-1),bca- (dca-1))if(_da==false)then return false end;if(dba.parent~=nil)then
dba.parent:setFocusedObject(dba)end;return true end;return false end,hoverHandler=function(dba,_ca,aca,bca)
if
(dba:isCoordsInObject(_ca,aca))then
local cca=cba:sendEvent("mouse_hover",dba,"mouse_hover",_ca,aca,bca)if(cca==false)then return false end;__a=true;return true end
if(__a)then
local cca=cba:sendEvent("mouse_leave",dba,"mouse_leave",_ca,aca,bca)if(cca==false)then return false end;__a=false end;return false end,keyHandler=function(dba,_ca,aca)if
(_aa)and(cd)then
if(dba:isFocused())then
local bca=cba:sendEvent("key",dba,"key",_ca,aca)if(bca==false)then return false end;return true end end;return
false end,keyUpHandler=function(dba,_ca)if
(_aa)and(cd)then
if(dba:isFocused())then
local aca=cba:sendEvent("key_up",dba,"key_up",_ca)if(aca==false)then return false end;return true end end;return
false end,charHandler=function(dba,_ca)if
(_aa)and(cd)then
if(dba:isFocused())then
local aca=cba:sendEvent("char",dba,"char",_ca)if(aca==false)then return false end;return true end end
return false end,valueChangedHandler=function(dba)
cba:sendEvent("value_changed",dba,_d)end,eventHandler=function(dba,_ca,aca,bca,cca,dca)
local _da=cba:sendEvent("other_event",dba,_ca,aca,bca,cca,dca)if(_da~=nil)then return _da end;return true end,getFocusHandler=function(dba)
local _ca=cba:sendEvent("get_focus",dba)if(_ca~=nil)then return _ca end;return true end,loseFocusHandler=function(dba)
aaa=false;local _ca=cba:sendEvent("lose_focus",dba)
if(_ca~=nil)then return _ca end;return true end,init=function(dba)
if
(dba.parent~=nil)then for _ca,aca in pairs(bba)do
if(aca)then dba.parent:addEvent(_ca,dba)end end end;if not(dd)then dd=true;return true end;return false end}cc.__index=cc;return cc end end
aa["Frame"]=function(...)local ab=da("module")local bb=da("Object")
local cb=da("loadObjects")local db=da("basaltDraw")local _c=da("utils")local ac=ab("layout")
local bc=ab("basaltMon")local cc=_c.uuid;local dc=_c.rpairs;local _d=_c.getValueFromXML;local ad=_c.tableCount
local bd,cd,dd=string.sub,math.min,math.max
return
function(__a,a_a,b_a,c_a)local d_a=bb(__a)local _aa="Frame"local aaa={}local baa={}local caa={}local daa={}local _ba={}local aba={}
local bba={}local cba={}local dba=0;local _ca=b_a or term.current()local aca=""local bca=false
local cca=false;local dca=false;local _da=0;local ada=0;local bda=false;local cda=0;local dda=false;local __b=false;local a_b=""local b_b=false
local c_b=false;local d_b;local _ab;local aab=true;local bab=true;local cab=false;local dab={}d_a:setZIndex(10)
local _bb=db(_ca)local abb=false;local bbb=1;local cbb=1;local dbb=colors.white;local _cb,acb=0,0;local bcb={}local function ccb(_bc,abc)if(abc~=nil)then
abc:setValuesByXMLData(_bc)end end
local function dcb(_bc,abc,bbc)
if(_bc~=nil)then if(
_bc.properties~=nil)then _bc={_bc}end
for cbc,dbc in pairs(_bc)do
local _cc=abc(bbc,dbc["@id"]or cc())table.insert(bcb,_cc)ccb(dbc,_cc)end end end
local function _db(_bc)for abc,bbc in pairs(aaa)do
for cbc,dbc in pairs(bbc)do if(dbc:getName()==_bc)then return dbc end end end end
local function adb(_bc)local abc=_db(_bc)if(abc~=nil)then return abc end
for bbc,cbc in pairs(aaa)do
for dbc,_cc in pairs(cbc)do if(
_cc:getType()=="Frame")then local acc=_cc:getDeepObject(_bc)
if(acc~=nil)then return acc end end end end end
local function bdb(_bc)local abc=_bc:getZIndex()
if(_db(_bc.name)~=nil)then return nil end
if(aaa[abc]==nil)then
for x=1,#baa+1 do if(baa[x]~=nil)then if(abc==baa[x])then break end;if
(abc>baa[x])then table.insert(baa,x,abc)break end else
table.insert(baa,abc)end end;if(#baa<=0)then table.insert(baa,abc)end;aaa[abc]={}end;_bc.parent=caa;if(_bc.init~=nil)then _bc:init()end
table.insert(aaa[abc],_bc)return _bc end
local function cdb(_bc,abc)
for bbc,cbc in pairs(daa)do
for dbc,_cc in pairs(cbc)do
for acc,bcc in pairs(_cc)do
if(bcc==abc)then
table.remove(daa[bbc][dbc],acc)if(_bc.parent~=nil)then if(ad(daa[bbc])<=0)then
_bc.parent:removeEvent(bbc,_bc)end end end end end end end
local function ddb(_bc,abc)
for bbc,cbc in pairs(aaa)do
for dbc,_cc in pairs(cbc)do
if(type(abc)=="string")then
if(_cc:getName()==abc)then
table.remove(aaa[bbc],dbc)cdb(caa,_cc)_bc:updateDraw()return true end else if(_cc==abc)then table.remove(aaa[bbc],dbc)cdb(caa,_cc)
_bc:updateDraw()return true end end end end;return false end;local function __c(_bc,abc,bbc)
for cbc,dbc in pairs(daa[abc])do for _cc,acc in pairs(dbc)do
if(acc:getName()==bbc)then return acc end end end end
local function a_c(_bc,abc,bbc)
local cbc=bbc:getZIndex()if(daa[abc]==nil)then daa[abc]={}end;if(_ba[abc]==nil)then
_ba[abc]={}end
if(__c(_bc,abc,bbc.name)~=nil)then return nil end
if(_bc.parent~=nil)then _bc.parent:addEvent(abc,_bc)end;dab[abc]=true
if(daa[abc][cbc]==nil)then
for x=1,#_ba[abc]+1 do
if
(_ba[abc][x]~=nil)then if(cbc==_ba[abc][x])then break end;if(cbc>_ba[abc][x])then
table.insert(_ba[abc],x,cbc)break end else
table.insert(_ba[abc],cbc)end end
if(#_ba[abc]<=0)then table.insert(_ba[abc],cbc)end;daa[abc][cbc]={}end;table.insert(daa[abc][cbc],bbc)return bbc end
local function b_c(_bc,abc,bbc)
if(daa[abc]~=nil)then
for cbc,dbc in pairs(daa[abc])do
for _cc,acc in pairs(dbc)do
if(acc==bbc)then
table.remove(daa[abc][cbc],_cc)if(#daa[abc][cbc]<=0)then daa[abc][cbc]=nil
if(_bc.parent~=nil)then if(
ad(daa[abc])<=0)then dab[abc]=false
_bc.parent:removeEvent(abc,_bc)end end end;return
true end end end end;return false end
local function c_c(_bc)local abc,bbc=pcall(load("return ".._bc))
if not(abc)then error(_bc..
" is not a valid dynamic code")end;return load("return ".._bc)()end
local function d_c(_bc,abc,bbc)for cbc,dbc in pairs(cba)do
if(dbc[2]==bbc)and(dbc[4]==abc)then return dbc end end;dba=dba+1
cba[dba]={0,bbc,{},abc,dba}return cba[dba]end
local function _ac(_bc,abc)local bbc={}local cbc={}for dbc in abc:gmatch("%a+%.x")do local _cc=dbc:gsub("%.x","")
if
(_cc~="self")and(_cc~="parent")then table.insert(bbc,_cc)end end
for dbc in
abc:gmatch("%w+%.y")do local _cc=dbc:gsub("%.y","")if(_cc~="self")and(_cc~="parent")then
table.insert(bbc,_cc)end end;for dbc in abc:gmatch("%a+%.w")do local _cc=dbc:gsub("%.w","")
if(_cc~="self")and
(_cc~="parent")then table.insert(bbc,_cc)end end
for dbc in
abc:gmatch("%a+%.h")do local _cc=dbc:gsub("%.h","")if(_cc~="self")and(_cc~="parent")then
table.insert(bbc,_cc)end end
for dbc,_cc in pairs(bbc)do cbc[_cc]=_db(_cc)if(cbc[_cc]==nil)then
error("Dynamic Values - unable to find object ".._cc)end end;cbc["self"]=_bc;cbc["parent"]=_bc:getParent()return cbc end
local function aac(_bc,abc)local bbc=_bc;for cbc in _bc:gmatch("%w+%.x")do
bbc=bbc:gsub(cbc,abc[cbc:gsub("%.x","")]:getX())end;for cbc in _bc:gmatch("%w+%.y")do
bbc=bbc:gsub(cbc,abc[cbc:gsub("%.y","")]:getY())end;for cbc in _bc:gmatch("%w+%.w")do
bbc=bbc:gsub(cbc,abc[cbc:gsub("%.w","")]:getWidth())end;for cbc in _bc:gmatch("%w+%.h")do
bbc=bbc:gsub(cbc,abc[cbc:gsub("%.h","")]:getHeight())end;return bbc end
local function bac(_bc)
if(#cba>0)then
for n=1,dba do
if(cba[n]~=nil)then local abc;if(#cba[n][3]<=0)then
cba[n][3]=_ac(cba[n][4],cba[n][2])end
abc=aac(cba[n][2],cba[n][3])cba[n][1]=c_c(abc)if(cba[n][4]:getType()=="Frame")then
cba[n][4]:recalculateDynamicValues()end end end
for abc,bbc in pairs(baa)do if(aaa[bbc]~=nil)then
for cbc,dbc in pairs(aaa[bbc])do if(dbc.eventHandler~=nil)then
dbc:eventHandler("dynamicValueEvent",_bc)end end end end end end;local function cac(_bc)return cba[_bc][1]end
local function dac(_bc)
for abc,bbc in pairs(aaa)do
for cbc,dbc in pairs(bbc)do
if
(dbc.getHeight~=nil)and(dbc.getY~=nil)then
local _cc,acc=dbc:getHeight(),dbc:getY()if(_cc+acc-_bc:getHeight()>cda)then
cda=dd(_cc+acc-_bc:getHeight(),0)end end end end end
caa={barActive=false,barBackground=colors.gray,barTextcolor=colors.black,barText="New Frame",barTextAlign="left",addEvent=a_c,removeEvent=b_c,removeEvents=cdb,getEvent=__c,newDynamicValue=d_c,recalculateDynamicValues=bac,getDynamicValue=cac,getType=function(_bc)return _aa end,setFocusedObject=function(_bc,abc)
if(_ab~=abc)then if
(_ab~=nil)then _ab:loseFocusHandler()end;if(abc~=nil)then
abc:getFocusHandler()end;_ab=abc end;return _bc end,getVariable=function(_bc,abc)return
c_a.getVariable(abc)end,setSize=function(_bc,abc,bbc,cbc)
d_a.setSize(_bc,abc,bbc,cbc)if(_bc.parent==nil)then _bb=db(_ca)end
for dbc,_cc in pairs(baa)do if(aaa[_cc]~=nil)then
for acc,bcc in
pairs(aaa[_cc])do if(bcc.eventHandler~=nil)then
bcc:eventHandler("basalt_resize",bcc,_bc)end end end end;_bc:recalculateDynamicValues()aab=false;return _bc end,setTheme=function(_bc,abc,bbc)
if(
type(abc)=="table")then bba=abc elseif(type(abc)=="string")then bba[abc]=bbc end;_bc:updateDraw()return _bc end,getTheme=function(_bc,abc)
return
bba[abc]or(_bc.parent~=nil and _bc.parent:getTheme(abc)or
c_a.getTheme(abc))end,setPosition=function(_bc,abc,bbc,cbc)
d_a.setPosition(_bc,abc,bbc,cbc)
for dbc,_cc in pairs(baa)do if(aaa[_cc]~=nil)then
for acc,bcc in pairs(aaa[_cc])do if(bcc.eventHandler~=nil)then
bcc:eventHandler("basalt_reposition",bcc,_bc)end end end end;_bc:recalculateDynamicValues()return _bc end,getBasaltInstance=function(_bc)return
c_a end,setOffset=function(_bc,abc,bbc)
_cb=abc~=nil and
math.floor(abc<0 and math.abs(abc)or-abc)or _cb
acb=bbc~=nil and
math.floor(bbc<0 and math.abs(bbc)or-bbc)or acb;_bc:updateDraw()return _bc end,getOffsetInternal=function(_bc)return
_cb,acb end,getOffset=function(_bc)
return _cb<0 and math.abs(_cb)or-_cb,
acb<0 and math.abs(acb)or-acb end,removeFocusedObject=function(_bc)if(_ab~=nil)then
_ab:loseFocusHandler()end;_ab=nil;return _bc end,getFocusedObject=function(_bc)
return _ab end,setCursor=function(_bc,abc,bbc,cbc,dbc)
if(_bc.parent~=nil)then local _cc,acc=_bc:getAnchorPosition()
_bc.parent:setCursor(
abc or false,(bbc or 0)+_cc-1,(cbc or 0)+acc-1,dbc or dbb)else
local _cc,acc=_bc:getAbsolutePosition(_bc:getAnchorPosition(_bc:getX(),_bc:getY(),true))abb=abc or false;if(bbc~=nil)then bbb=_cc+bbc-1 end;if(cbc~=nil)then cbb=acc+
cbc-1 end;dbb=dbc or dbb;if(abb)then
_ca.setTextColor(dbb)_ca.setCursorPos(bbb,cbb)_ca.setCursorBlink(abb)else
_ca.setCursorBlink(false)end end;return _bc end,setMovable=function(_bc,abc)
if(
_bc.parent~=nil)then b_b=abc or not b_b
_bc.parent:addEvent("mouse_click",_bc)dab["mouse_click"]=true
_bc.parent:addEvent("mouse_up",_bc)dab["mouse_up"]=true
_bc.parent:addEvent("mouse_drag",_bc)dab["mouse_drag"]=true end;return _bc end,setScrollable=function(_bc,abc)bda=(
abc or abc==nil)and true or false
if(
_bc.parent~=nil)then _bc.parent:addEvent("mouse_scroll",_bc)end;dab["mouse_scroll"]=true;return _bc end,setScrollAmount=function(_bc,abc)cda=
abc or cda;bab=false;return _bc end,getScrollAmount=function(_bc)return bab and dac(_bc)or
cda end,show=function(_bc)d_a.show(_bc)
if(_bc.parent==
nil)then c_a.setActiveFrame(_bc)if(bca)and not(cca)then
c_a.setMonitorFrame(aca,_bc)elseif(cca)then c_a.setMonitorFrame(_bc:getName(),_bc,aca)else
c_a.setMainFrame(_bc)end end;return _bc end,hide=function(_bc)
d_a.hide(_bc)
if(_bc.parent==nil)then if(activeFrame==_bc)then activeFrame=nil end
if(bca)and
not(cca)then if(c_a.getMonitorFrame(aca)==_bc)then
c_a.setActiveFrame(nil)end elseif(cca)then
if(
c_a.getMonitorFrame(_bc:getName())==_bc)then c_a.setActiveFrame(nil)end else
if(c_a.getMainFrame()==_bc)then c_a.setMainFrame(nil)end end end;return _bc end,addLayout=function(_bc,abc)
if(
abc~=nil)then
if(fs.exists(abc))then local bbc=fs.open(abc,"r")
local cbc=ac:ParseXmlText(bbc.readAll())bbc.close()bcb={}_bc:setValuesByXMLData(cbc)end end;return _bc end,getLastLayout=function(_bc)return
bcb end,addLayoutFromString=function(_bc,abc)if(abc~=nil)then local bbc=ac:ParseXmlText(abc)
_bc:setValuesByXMLData(bbc)end;return _bc end,setValuesByXMLData=function(_bc,abc)
d_a.setValuesByXMLData(_bc,abc)if(_d("movable",abc)~=nil)then if(_d("movable",abc))then
_bc:setMovable(true)end end;if(
_d("scrollable",abc)~=nil)then
if(_d("scrollable",abc))then _bc:setScrollable(true)end end;if
(_d("monitor",abc)~=nil)then
_bc:setMonitor(_d("monitor",abc)):show()end;if(_d("mirror",abc)~=nil)then
_bc:setMirror(_d("mirror",abc))end
if(_d("bar",abc)~=nil)then if(_d("bar",abc))then
_bc:showBar(true)else _bc:showBar(false)end end
if(_d("barText",abc)~=nil)then _bc.barText=_d("barText",abc)end;if(_d("barBG",abc)~=nil)then
_bc.barBackground=colors[_d("barBG",abc)]end;if(_d("barFG",abc)~=nil)then
_bc.barTextcolor=colors[_d("barFG",abc)]end;if(_d("barAlign",abc)~=nil)then
_bc.barTextAlign=_d("barAlign",abc)end;if(_d("layout",abc)~=nil)then
_bc:addLayout(_d("layout",abc))end;if(_d("xOffset",abc)~=nil)then
_bc:setOffset(_d("xOffset",abc),acb)end;if(_d("yOffset",abc)~=nil)then
_bc:setOffset(acb,_d("yOffset",abc))end;if(_d("scrollAmount",abc)~=nil)then
_bc:setScrollAmount(_d("scrollAmount",abc))end;local bbc=abc:children()
for cbc,dbc in
pairs(bbc)do if(dbc.___name~="animation")then
local _cc=dbc.___name:gsub("^%l",string.upper)
if(cb[_cc]~=nil)then dcb(dbc,_bc["add".._cc],_bc)end end end;dcb(abc["frame"],_bc.addFrame,_bc)
dcb(abc["animation"],_bc.addAnimation,_bc)return _bc end,showBar=function(_bc,abc)_bc.barActive=
abc or not _bc.barActive;_bc:updateDraw()
return _bc end,setBar=function(_bc,abc,bbc,cbc)_bc.barText=abc or""_bc.barBackground=
bbc or _bc.barBackground
_bc.barTextcolor=cbc or _bc.barTextcolor;_bc:updateDraw()return _bc end,setBarTextAlign=function(_bc,abc)_bc.barTextAlign=
abc or"left"_bc:updateDraw()return _bc end,setMirror=function(_bc,abc)if(
_bc.parent~=nil)then
error("Frame has to be a base frame in order to attach a mirror.")end;a_b=abc;if(mirror~=nil)then
_bb.setMirror(mirror)end;dda=true;return _bc end,removeMirror=function(_bc)mirror=
nil;dda=false;_bb.setMirror(nil)return _bc end,setMonitorScale=function(_bc,abc)if
(bca)then _ca.setTextScale(abc)end;return _bc end,setMonitor=function(_bc,abc,bbc)
if(
abc~=nil)and(abc~=false)then
if(type(abc)=="string")then
if(
peripheral.getType(abc)=="monitor")then _ca=peripheral.wrap(abc)dca=true end
if(_bc.parent~=nil)then _bc.parent:removeObject(_bc)end;bca=true;c_a.setMonitorFrame(abc,_bc)elseif(type(abc)=="table")then
_ca=bc(abc)dca=true;bca=true;cca=true
c_a.setMonitorFrame(_bc:getName(),_bc,true)end else _ca=parentTerminal;bca=false;cca=false
if(type(aca)=="string")then
if(
c_a.getMonitorFrame(aca)==_bc)then c_a.setMonitorFrame(aca,nil)end else
if(c_a.getMonitorFrame(_bc:getName())==_bc)then c_a.setMonitorFrame(_bc:getName(),
nil)end end end;if(bbc~=nil)then _ca.setTextScale(bbc)end;_bb=db(_ca)
_bc:setSize(_ca.getSize())aab=true;aca=abc or nil;_bc:updateDraw()return _bc end,loseFocusHandler=function(_bc)
d_a.loseFocusHandler(_bc)if(_ab~=nil)then _ab:loseFocusHandler()_ab=nil end end,getFocusHandler=function(_bc)
d_a.getFocusHandler(_bc)
if(_bc.parent~=nil)then
if(b_b)then _bc.parent:removeEvents(_bc)
_bc.parent:removeObject(_bc)_bc.parent:addObject(_bc)for abc,bbc in pairs(dab)do if(bbc)then
_bc.parent:addEvent(abc,_bc)end end
_bc:updateDraw()end end;if(_ab~=nil)then _ab:getFocusHandler()end end,eventHandler=function(_bc,abc,...)
d_a.eventHandler(_bc,abc,...)
if(daa["other_event"]~=nil)then
for bbc,cbc in ipairs(_ba["other_event"])do
if(
daa["other_event"][cbc]~=nil)then for dbc,_cc in dc(daa["other_event"][cbc])do
if
(_cc.eventHandler~=nil)then if(_cc:eventHandler(abc,...))then return true end end end end end end;if(aab)and not(bca)then
if(_bc.parent==nil)then if(abc=="term_resize")then
_bc:setSize(_ca.getSize())aab=true end end end
if(bca)then
if(aab)then
if
(abc=="monitor_resize")then
if(type(aca)=="string")then _bc:setSize(_ca.getSize())elseif(
type(aca)=="table")then
for bbc,cbc in pairs(aca)do for dbc,_cc in pairs(cbc)do if(p1 ==_cc)then
_bc:setSize(_ca.getSize())end end end end;aab=true;_bc:updateDraw()end end
if(abc=="peripheral")and(p1 ==aca)then if
(peripheral.getType(aca)=="monitor")then dca=true;_ca=peripheral.wrap(aca)_bb=db(_ca)
_bc:updateDraw()end end
if(abc=="peripheral_detach")and(p1 ==aca)then dca=false end end
if(dda)then if(peripheral.getType(a_b)=="monitor")then __b=true
_bb.setMirror(peripheral.wrap(a_b))end;if(abc=="peripheral_detach")and
(p1 ==a_b)then dca=false end
if
(abc=="monitor_touch")and(a_b==p1)then _bc:mouseHandler(1,p2,p3,true)end end
if(abc=="terminate")and(_bc.parent==nil)then c_a.stop()end end,mouseHandler=function(_bc,abc,bbc,cbc,dbc,_cc)
if
(cca)then if(_ca.calculateClick~=nil)then
bbc,cbc=_ca.calculateClick(_cc,bbc,cbc)end end
if(d_a.mouseHandler(_bc,abc,bbc,cbc))then
if(daa["mouse_click"]~=nil)then
_bc:setCursor(false)
for acc,bcc in ipairs(_ba["mouse_click"])do
if
(daa["mouse_click"][bcc]~=nil)then for ccc,dcc in dc(daa["mouse_click"][bcc])do
if(dcc.mouseHandler~=nil)then if
(dcc:mouseHandler(abc,bbc,cbc))then return true end end end end end end
if(b_b)then
local acc,bcc=_bc:getAbsolutePosition(_bc:getAnchorPosition())if
(bbc>=acc)and(bbc<=acc+_bc:getWidth()-1)and(cbc==bcc)then c_b=true;_da=acc-bbc
ada=yOff and 1 or 0 end end;_bc:removeFocusedObject()return true end;return false end,mouseUpHandler=function(_bc,abc,bbc,cbc)if
(c_b)then c_b=false end
if(d_a.mouseUpHandler(_bc,abc,bbc,cbc))then
if
(daa["mouse_up"]~=nil)then
for dbc,_cc in ipairs(_ba["mouse_up"])do
if(daa["mouse_up"][_cc]~=nil)then
for acc,bcc in
dc(daa["mouse_up"][_cc])do if(bcc.mouseUpHandler~=nil)then
if(bcc:mouseUpHandler(abc,bbc,cbc))then return true end end end end end end;return true end;return false end,scrollHandler=function(_bc,abc,bbc,cbc)
if
(d_a.scrollHandler(_bc,abc,bbc,cbc))then
if(daa["mouse_scroll"]~=nil)then
for _cc,acc in pairs(_ba["mouse_scroll"])do
if(
daa["mouse_scroll"][acc]~=nil)then
for bcc,ccc in dc(daa["mouse_scroll"][acc])do if(ccc.scrollHandler~=
nil)then
if(ccc:scrollHandler(abc,bbc,cbc))then return true end end end end end end;local dbc=acb
if(bda)then dac(_bc)if(abc>0)or(abc<0)then
acb=dd(cd(acb-abc,0),-cda)_bc:updateDraw()end end;_bc:removeFocusedObject()if(acb==dbc)then return false end
return true end;return false end,hoverHandler=function(_bc,abc,bbc,cbc)
if
(d_a.hoverHandler(_bc,abc,bbc,cbc))then
if(daa["mouse_move"]~=nil)then
for dbc,_cc in pairs(_ba["mouse_move"])do
if(
daa["mouse_move"][_cc]~=nil)then for acc,bcc in dc(daa["mouse_move"][_cc])do
if
(bcc.hoverHandler~=nil)then if(bcc:hoverHandler(abc,bbc,cbc))then return true end end end end end end end;return false end,dragHandler=function(_bc,abc,bbc,cbc)
if
(c_b)then local dbc,_cc=_bc.parent:getOffsetInternal()dbc=dbc<0 and
math.abs(dbc)or-dbc;_cc=
_cc<0 and math.abs(_cc)or-_cc;local acc=1;local bcc=1;if(_bc.parent~=nil)then
acc,bcc=_bc.parent:getAbsolutePosition(_bc.parent:getAnchorPosition())end
_bc:setPosition(
bbc+_da- (acc-1)+dbc,cbc+ada- (bcc-1)+_cc)_bc:updateDraw()return true end
if(_bc:isVisible())and(_bc:isEnabled())then
if
(daa["mouse_drag"]~=nil)then
for dbc,_cc in ipairs(_ba["mouse_drag"])do
if
(daa["mouse_drag"][_cc]~=nil)then for acc,bcc in dc(daa["mouse_drag"][_cc])do
if(bcc.dragHandler~=nil)then if
(bcc:dragHandler(abc,bbc,cbc))then return true end end end end end end end;d_a.dragHandler(_bc,abc,bbc,cbc)return false end,keyHandler=function(_bc,abc,bbc)
if
(_bc:isFocused())or(_bc.parent==nil)then
local cbc=_bc:getEventSystem():sendEvent("key",_bc,"key",abc)if(cbc==false)then return false end
if(daa["key"]~=nil)then
for dbc,_cc in pairs(_ba["key"])do
if(
daa["key"][_cc]~=nil)then
for acc,bcc in dc(daa["key"][_cc])do if(bcc.keyHandler~=nil)then if
(bcc:keyHandler(abc,bbc))then return true end end end end end end end;return false end,keyUpHandler=function(_bc,abc)
if
(_bc:isFocused())or(_bc.parent==nil)then
local bbc=_bc:getEventSystem():sendEvent("key_up",_bc,"key_up",abc)if(bbc==false)then return false end
if(daa["key_up"]~=nil)then
for cbc,dbc in
pairs(_ba["key_up"])do
if(daa["key_up"][dbc]~=nil)then for _cc,acc in dc(daa["key_up"][dbc])do
if(
acc.keyUpHandler~=nil)then if(acc:keyUpHandler(abc))then return true end end end end end end end;return false end,charHandler=function(_bc,abc)
if
(_bc:isFocused())or(_bc.parent==nil)then
local bbc=_bc:getEventSystem():sendEvent("char",_bc,"char",abc)if(bbc==false)then return false end
if(daa["char"]~=nil)then
for cbc,dbc in
pairs(_ba["char"])do
if(daa["char"][dbc]~=nil)then for _cc,acc in dc(daa["char"][dbc])do
if
(acc.charHandler~=nil)then if(acc:charHandler(abc))then return true end end end end end end end;return false end,setText=function(_bc,abc,bbc,cbc)
local dbc,_cc=_bc:getAnchorPosition()
if(bbc>=1)and(bbc<=_bc:getHeight())then
if(_bc.parent~=nil)then
_bc.parent:setText(dd(
abc+ (dbc-1),dbc),_cc+bbc-1,bd(cbc,dd(1 -abc+1,1),dd(
_bc:getWidth()-abc+1,1)))else
_bb.setText(dd(abc+ (dbc-1),dbc),_cc+bbc-1,bd(cbc,dd(1 -abc+1,1),dd(
_bc:getWidth()-abc+1,1)))end end end,setBG=function(_bc,abc,bbc,cbc)
local dbc,_cc=_bc:getAnchorPosition()
if(bbc>=1)and(bbc<=_bc:getHeight())then
if(_bc.parent~=nil)then
_bc.parent:setBG(dd(
abc+ (dbc-1),dbc),_cc+bbc-1,bd(cbc,dd(1 -abc+1,1),dd(
_bc:getWidth()-abc+1,1)))else
_bb.setBG(dd(abc+ (dbc-1),dbc),_cc+bbc-1,bd(cbc,dd(1 -abc+1,1),dd(
_bc:getWidth()-abc+1,1)))end end end,setFG=function(_bc,abc,bbc,cbc)
local dbc,_cc=_bc:getAnchorPosition()
if(bbc>=1)and(bbc<=_bc:getHeight())then
if(_bc.parent~=nil)then
_bc.parent:setFG(dd(
abc+ (dbc-1),dbc),_cc+bbc-1,bd(cbc,dd(1 -abc+1,1),dd(
_bc:getWidth()-abc+1,1)))else
_bb.setFG(dd(abc+ (dbc-1),dbc),_cc+bbc-1,bd(cbc,dd(1 -abc+1,1),dd(
_bc:getWidth()-abc+1,1)))end end end,writeText=function(_bc,abc,bbc,cbc,dbc,_cc)
local acc,bcc=_bc:getAnchorPosition()
if(bbc>=1)and(bbc<=_bc:getHeight())then
if(_bc.parent~=nil)then
_bc.parent:writeText(dd(
abc+ (acc-1),acc),bcc+bbc-1,bd(cbc,dd(1 -abc+1,1),
_bc:getWidth()-abc+1),dbc,_cc)else
_bb.writeText(dd(abc+ (acc-1),acc),bcc+bbc-1,bd(cbc,dd(1 -abc+1,1),dd(
_bc:getWidth()-abc+1,1)),dbc,_cc)end end end,blit=function(_bc,abc,bbc,cbc,dbc,_cc)
local acc,bcc=_bc:getAnchorPosition()
if(bbc>=1)and(bbc<=_bc:getHeight())then
local ccc=_bc:getWidth()
if(_bc.parent~=nil)then
cbc=bd(cbc,dd(1 -abc+1,1),ccc-abc+1)dbc=bd(dbc,dd(1 -abc+1,1),ccc-abc+1)_cc=bd(_cc,dd(
1 -abc+1,1),ccc-abc+1)
_bc.parent:blit(dd(
abc+ (acc-1),acc),bcc+bbc-1,cbc,dbc,_cc)else
cbc=bd(cbc,dd(1 -abc+1,1),dd(ccc-abc+1,1))
dbc=bd(dbc,dd(1 -abc+1,1),dd(ccc-abc+1,1))
_cc=bd(_cc,dd(1 -abc+1,1),dd(ccc-abc+1,1))
_bb.blit(dd(abc+ (acc-1),acc),bcc+bbc-1,cbc,dbc,_cc)end end end,drawBackgroundBox=function(_bc,abc,bbc,cbc,dbc,_cc)
local acc,bcc=_bc:getAnchorPosition()
dbc=(bbc<1 and(
dbc+bbc>_bc:getHeight()and _bc:getHeight()or dbc+bbc-1)or(
dbc+
bbc>_bc:getHeight()and _bc:getHeight()-bbc+1 or dbc))
cbc=(abc<1 and(cbc+abc>_bc:getWidth()and _bc:getWidth()or cbc+
abc-1)or(

cbc+abc>_bc:getWidth()and _bc:getWidth()-abc+1 or cbc))
if(_bc.parent~=nil)then
_bc.parent:drawBackgroundBox(dd(abc+ (acc-1),acc),dd(bbc+ (bcc-1),bcc),cbc,dbc,_cc)else
_bb.drawBackgroundBox(dd(abc+ (acc-1),acc),dd(bbc+ (bcc-1),bcc),cbc,dbc,_cc)end end,drawTextBox=function(_bc,abc,bbc,cbc,dbc,_cc)
local acc,bcc=_bc:getAnchorPosition()
dbc=(bbc<1 and(
dbc+bbc>_bc:getHeight()and _bc:getHeight()or dbc+bbc-1)or(
dbc+
bbc>_bc:getHeight()and _bc:getHeight()-bbc+1 or dbc))
cbc=(abc<1 and(cbc+abc>_bc:getWidth()and _bc:getWidth()or cbc+
abc-1)or(

cbc+abc>_bc:getWidth()and _bc:getWidth()-abc+1 or cbc))
if(_bc.parent~=nil)then
_bc.parent:drawTextBox(dd(abc+ (acc-1),acc),dd(bbc+ (bcc-1),bcc),cbc,dbc,bd(_cc,1,1))else
_bb.drawTextBox(dd(abc+ (acc-1),acc),dd(bbc+ (bcc-1),bcc),cbc,dbc,bd(_cc,1,1))end end,drawForegroundBox=function(_bc,abc,bbc,cbc,dbc,_cc)
local acc,bcc=_bc:getAnchorPosition()
dbc=(bbc<1 and(
dbc+bbc>_bc:getHeight()and _bc:getHeight()or dbc+bbc-1)or(
dbc+
bbc>_bc:getHeight()and _bc:getHeight()-bbc+1 or dbc))
cbc=(abc<1 and(cbc+abc>_bc:getWidth()and _bc:getWidth()or cbc+
abc-1)or(

cbc+abc>_bc:getWidth()and _bc:getWidth()-abc+1 or cbc))
if(_bc.parent~=nil)then
_bc.parent:drawForegroundBox(dd(abc+ (acc-1),acc),dd(bbc+ (bcc-1),bcc),cbc,dbc,_cc)else
_bb.drawForegroundBox(dd(abc+ (acc-1),acc),dd(bbc+ (bcc-1),bcc),cbc,dbc,_cc)end end,draw=function(_bc,abc)if
(bca)and not(dca)then return false end
if(_bc.parent==nil)then if(_bc:getDraw()==
false)then return false end end
if(d_a.draw(_bc))then
local bbc,cbc=_bc:getAbsolutePosition(_bc:getAnchorPosition())local dbc,_cc=_bc:getAnchorPosition()local acc,bcc=_bc:getSize()
if(
_bc.parent==nil)then
if(_bc.bgColor~=false)then
_bb.drawBackgroundBox(dbc,_cc,acc,bcc,_bc.bgColor)_bb.drawTextBox(dbc,_cc,acc,bcc," ")end;if(_bc.fgColor~=false)then
_bb.drawForegroundBox(dbc,_cc,acc,bcc,_bc.fgColor)end end
if(_bc.barActive)then
if(_bc.parent~=nil)then
_bc.parent:writeText(dbc,_cc,_c.getTextHorizontalAlign(_bc.barText,acc,_bc.barTextAlign),_bc.barBackground,_bc.barTextcolor)else
_bb.writeText(dbc,_cc,_c.getTextHorizontalAlign(_bc.barText,acc,_bc.barTextAlign),_bc.barBackground,_bc.barTextcolor)end
if(_bc:getBorder("left"))then
if(_bc.parent~=nil)then
_bc.parent:drawBackgroundBox(dbc-1,_cc,1,1,_bc.barBackground)if(_bc.bgColor~=false)then
_bc.parent:drawBackgroundBox(dbc-1,_cc+1,1,bcc-1,_bc.bgColor)end end end
if(_bc:getBorder("top"))then if(_bc.parent~=nil)then
_bc.parent:drawBackgroundBox(dbc-1,_cc-1,acc+1,1,_bc.barBackground)end end end;for ccc,dcc in dc(baa)do
if(aaa[dcc]~=nil)then for _dc,adc in pairs(aaa[dcc])do
if(adc.draw~=nil)then adc:draw()end end end end end end,updateTerm=function(_bc)if
(bca)and not(dca)then return false end;_bb.update()end,addObject=function(_bc,abc)return
bdb(abc)end,removeObject=ddb,getObject=function(_bc,abc)return _db(abc)end,getDeepObject=function(_bc,abc)return adb(abc)end,addFrame=function(_bc,abc)local bbc=c_a.newFrame(
abc or cc(),_bc,nil,c_a)return bdb(bbc)end,init=function(_bc)
if
not(cab)then
if(a_a~=nil)then d_a.width,d_a.height=a_a:getSize()
_bc:setBackground(a_a:getTheme("FrameBG"))
_bc:setForeground(a_a:getTheme("FrameText"))else d_a.width,d_a.height=_ca.getSize()
_bc:setBackground(c_a.getTheme("BasaltBG"))
_bc:setForeground(c_a.getTheme("BasaltText"))end;cab=true end end}
for _bc,abc in pairs(cb)do caa["add".._bc]=function(bbc,cbc)
return bdb(abc(cbc or cc(),bbc))end end;setmetatable(caa,d_a)return caa end end
aa["main"]=function(...)local ab=da("basaltEvent")()local bb=da("Frame")
local cb=da("theme")local db=da("utils")local _c=da("basaltLogs")local ac=db.uuid
local bc=db.createText;local cc=db.tableCount;local dc=300;local _d=50;local ad=term.current()local bd="1.6.3"local cd=fs.getDir(
table.pack(...)[2]or"")
local dd,__a,a_a,b_a,c_a,d_a={},{},{},{},{},{}local _aa,aaa,baa,caa;local daa={}if
not term.isColor or not term.isColor()then
error('Basalt requires an advanced (golden) computer to run.',0)end;local function _ba()caa=false
ad.clear()ad.setCursorPos(1,1)end
local aba=function(cab)
ad.clear()ad.setBackgroundColor(colors.black)
ad.setTextColor(colors.red)local dab,_bb=ad.getSize()if(daa.logging)then _c(cab,"Error")end;local abb=bc(
"Basalt error: "..cab,dab)local bbb=1;for cbb,dbb in pairs(abb)do
ad.setCursorPos(1,bbb)ad.write(dbb)bbb=bbb+1 end;ad.setCursorPos(1,
bbb+1)caa=false end
local function bba(cab)
assert(cab~="function","Schedule needs a function in order to work!")return
function(...)local dab=coroutine.create(cab)
local _bb,abb=coroutine.resume(dab,...)if(_bb)then table.insert(d_a,dab)else aba(abb)end end end;local cba=function(cab,dab)c_a[cab]=dab end
local dba=function(cab)return c_a[cab]end;local _ca=function(cab)cb=cab end
local aca=function(cab)return cb[cab]end
local bca={getMainFrame=function()return _aa end,setVariable=cba,getVariable=dba,getTheme=aca,setMainFrame=function(cab)_aa=cab end,getActiveFrame=function()return aaa end,setActiveFrame=function(cab)aaa=cab end,getFocusedObject=function()return
baa end,setFocusedObject=function(cab)baa=cab end,getMonitorFrame=function(cab)
return a_a[cab]or b_a[cab][1]end,setMonitorFrame=function(cab,dab,_bb)if(_aa==dab)then _aa=nil end;if(_bb)then
b_a[cab]={dab,sides}else a_a[cab]=dab end
if(dab==nil)then b_a[cab]=nil end end,getBaseTerm=function()
return ad end,schedule=bba,stop=_ba,newFrame=bb,getDirectory=function()return cd end}
local function cca(cab,dab,_bb,abb,bbb)
if(#d_a>0)then local cbb={}
for n=1,#d_a do
if(d_a[n]~=nil)then
if
(coroutine.status(d_a[n])=="suspended")then
local dbb,_cb=coroutine.resume(d_a[n],cab,dab,_bb,abb,bbb)if not(dbb)then aba(_cb)end else table.insert(cbb,n)end end end
for n=1,#cbb do table.remove(d_a,cbb[n]- (n-1))end end end
local function dca()if(caa==false)then return end;if(_aa~=nil)then _aa:draw()
_aa:updateTerm()end
for cab,dab in pairs(a_a)do dab:draw()dab:updateTerm()end
for cab,dab in pairs(b_a)do dab[1]:draw()dab[1]:updateTerm()end end;local _da,ada,bda=nil,nil,nil;local cda=nil
local function dda(cab,dab,_bb)_da,ada,bda=_da,dab,_bb;if(cda==nil)then
cda=os.startTimer(dc/1000)end end
local function __b()cda=nil;_aa:hoverHandler(ada,bda,_da)aaa=_aa end;local a_b,b_b,c_b=nil,nil,nil;local d_b=nil;local function _ab()d_b=nil;_aa:dragHandler(a_b,b_b,c_b)
aaa=_aa end;local function aab(cab,dab,_bb)a_b,b_b,c_b=cab,dab,_bb
if(_d<50)then _ab()else if(d_b==nil)then d_b=os.startTimer(
_d/1000)end end end
local function bab(cab,dab,_bb,abb,bbb)
if(
ab:sendEvent("basaltEventCycle",cab,dab,_bb,abb,bbb)==false)then return end
if(_aa~=nil)then
if(cab=="mouse_click")then
_aa:mouseHandler(dab,_bb,abb,false)aaa=_aa elseif(cab=="mouse_drag")then aab(dab,_bb,abb)elseif(cab=="mouse_up")then
_aa:mouseUpHandler(dab,_bb,abb,bbb)aaa=_aa elseif(cab=="mouse_scroll")then
_aa:scrollHandler(dab,_bb,abb,bbb)aaa=_aa elseif(cab=="mouse_move")then dda(dab,_bb,abb)end end
if(cab=="monitor_touch")then if(a_a[dab]~=nil)then
a_a[dab]:mouseHandler(1,_bb,abb,true)aaa=a_a[dab]end
if(cc(b_a)>0)then for cbb,dbb in pairs(b_a)do
dbb[1]:mouseHandler(1,_bb,abb,true,dab)end end end
if(cab=="char")then if(aaa~=nil)then aaa:charHandler(dab)end end;if(cab=="key_up")then if(aaa~=nil)then aaa:keyUpHandler(dab)end
dd[dab]=false end;if(cab=="key")then if(aaa~=nil)then
aaa:keyHandler(dab,_bb)end;dd[dab]=true end
if(
cab=="terminate")then if(aaa~=nil)then aaa:eventHandler(cab)
if(caa==false)then return end end end
if




(cab~="mouse_click")and(cab~="mouse_up")and(cab~="mouse_scroll")and(cab~="mouse_drag")and
(cab~="mouse_move")and(cab~="key")and(cab~="key_up")and(cab~="char")and(cab~="terminate")then
if(cab=="timer")and(dab==cda)then __b()elseif(cab=="timer")and(dab==d_b)then
_ab()else
for cbb,dbb in pairs(__a)do dbb:eventHandler(cab,dab,_bb,abb,bbb)end end end;cca(cab,dab,_bb,abb,bbb)dca()end
daa={logging=false,setTheme=_ca,getTheme=aca,drawFrames=dca,getVersion=function()return bd end,setVariable=cba,getVariable=dba,setBaseTerm=function(cab)ad=cab end,log=function(...)_c(...)end,setMouseMoveThrottle=function(cab)
if
(_HOST:find("CraftOS%-PC"))then if(config.get("mouse_move_throttle")~=10)then
config.set("mouse_move_throttle",10)end
if(cab<100)then dc=100 else dc=cab end;return true end;return false end,setMouseDragThrottle=function(cab)if(
cab<=0)then _d=0 else d_b=nil;_d=cab end end,autoUpdate=function(cab)
caa=cab;if(cab==nil)then caa=true end;local function dab()dca()while caa do
bab(os.pullEventRaw())end end
local _bb,abb=xpcall(dab,debug.traceback)if not(_bb)then aba(abb)return end end,update=function(cab,dab,_bb,abb,bbb)
if(
cab~=nil)then
local cbb,dbb=xpcall(bab,debug.traceback,cab,dab,_bb,abb,bbb)if not(cbb)then aba(dbb)return end end end,stop=_ba,stopUpdate=_ba,isKeyDown=function(cab)if(
dd[cab]==nil)then return false end;return dd[cab]end,getFrame=function(cab)for dab,_bb in
pairs(__a)do if(_bb.name==cab)then return _bb end end end,getActiveFrame=function()return
aaa end,setActiveFrame=function(cab)
if(cab:getType()=="Frame")then aaa=cab;return true end;return false end,onEvent=function(...)
for cab,dab in
pairs(table.pack(...))do if(type(dab)=="function")then
ab:registerEvent("basaltEventCycle",dab)end end end,schedule=bba,createFrame=function(cab)
cab=cab or ac()
for _bb,abb in pairs(__a)do if(abb.name==cab)then return nil end end;local dab=bb(cab,nil,nil,bca)dab:init()
table.insert(__a,dab)if
(_aa==nil)and(dab:getName()~="basaltDebuggingFrame")then dab:show()end;return dab end,removeFrame=function(cab)__a[cab]=
nil end,setProjectDir=function(cab)cd=cab end,debug=function(...)local cab={...}if(_aa==nil)then print(...)
return end
if(_aa.name~="basaltDebuggingFrame")then if(_aa~=daa.debugFrame)then
daa.debugLabel:setParent(_aa)end end;local dab=""
for _bb,abb in pairs(cab)do dab=dab..
tostring(abb).. (#cab~=_bb and", "or"")end;daa.debugLabel:setText("[Debug] "..dab)
for _bb,abb in
pairs(bc(dab,daa.debugList:getWidth()))do daa.debugList:addItem(abb)end;if(daa.debugList:getItemCount()>50)then
daa.debugList:removeItem(1)end
daa.debugList:setValue(daa.debugList:getItem(daa.debugList:getItemCount()))if
(daa.debugList.getItemCount()>daa.debugList:getHeight())then
daa.debugList:setOffset(daa.debugList:getItemCount()-
daa.debugList:getHeight())end
daa.debugLabel:show()end}
daa.debugFrame=daa.createFrame("basaltDebuggingFrame"):showBar():setBackground(colors.lightGray):setBar("Debug",colors.black,colors.gray)
daa.debugFrame:addButton("back"):setAnchor("topRight"):setSize(1,1):setText("\22"):onClick(function()if(
daa.oldFrame~=nil)then daa.oldFrame:show()end end):setBackground(colors.red):show()
daa.debugList=daa.debugFrame:addList("debugList"):setSize("parent.w - 2","parent.h - 3"):setPosition(2,3):setScrollable(true):show()
daa.debugLabel=daa.debugFrame:addLabel("debugLabel"):onClick(function()
daa.oldFrame=_aa;daa.debugFrame:show()end):setBackground(colors.black):setForeground(colors.white):setAnchor("bottomLeft"):ignoreOffset():setZIndex(20):show()return daa end
aa["loadObjects"]=function(...)local ab={}if(ba)then
for db,_c in pairs(_b("objects"))do ab[db]=_c()end;return ab end;local bb=table.pack(...)local cb=fs.getDir(
bb[2]or"Basalt")if(cb==nil)then
error("Unable to find directory "..bb[2]..
" please report this bug to our discord.")end;for db,_c in
pairs(fs.list(fs.combine(cb,"objects")))do
if(_c~="example.lua")then local ac=_c:gsub(".lua","")ab[ac]=da(ac)end end;return ab end;aa["objects"]={}
aa["objects"]["Button"]=function(...)local ab=da("Object")
local bb=da("utils")local cb=bb.getValueFromXML;local db=da("tHex")
return
function(_c)local ac=ab(_c)local bc="Button"
local cc="center"local dc="center"ac:setZIndex(5)ac:setValue("Button")
ac.width=12;ac.height=3
local _d={init=function(ad)
if(ac.init(ad))then
ad.bgColor=ad.parent:getTheme("ButtonBG")ad.fgColor=ad.parent:getTheme("ButtonText")end end,getType=function(ad)return bc end,setHorizontalAlign=function(ad,bd)
cc=bd;ad:updateDraw()return ad end,setVerticalAlign=function(ad,bd)dc=bd
ad:updateDraw()return ad end,setText=function(ad,bd)ac:setValue(bd)ad:updateDraw()return
ad end,setValuesByXMLData=function(ad,bd)ac.setValuesByXMLData(ad,bd)
if(
cb("text",bd)~=nil)then ad:setText(cb("text",bd))end;if(cb("horizontalAlign",bd)~=nil)then
cc=cb("horizontalAlign",bd)end;if(cb("verticalAlign",bd)~=nil)then
dc=cb("verticalAlign",bd)end;return ad end,draw=function(ad)
if
(ac.draw(ad))then
if(ad.parent~=nil)then local bd,cd=ad:getAnchorPosition()
local dd,__a=ad:getSize()local a_a=bb.getTextVerticalAlign(__a,dc)
for n=1,__a do
if(n==a_a)then
ad.parent:setText(bd,cd+ (
n-1),bb.getTextHorizontalAlign(ad:getValue(),dd,cc))
ad.parent:setFG(bd,cd+ (n-1),bb.getTextHorizontalAlign(db[ad.fgColor]:rep(ad:getValue():len()),dd,cc))end end end end end}return setmetatable(_d,ac)end end
aa["objects"]["Dropdown"]=function(...)local ab=da("Object")local bb=da("utils")
local cb=da("utils").getValueFromXML
return
function(db)local _c=ab(db)local ac="Dropdown"_c.width=12;_c.height=1;_c:setZIndex(6)
local bc={}local cc;local dc;local _d=true;local ad="left"local bd=0;local cd=16;local dd=6;local __a="\16"local a_a="\31"local b_a=false
local c_a={getType=function(d_a)return
ac end,setValuesByXMLData=function(d_a,_aa)_c.setValuesByXMLData(d_a,_aa)
if(
cb("selectionBG",_aa)~=nil)then cc=colors[cb("selectionBG",_aa)]end;if(cb("selectionFG",_aa)~=nil)then
dc=colors[cb("selectionFG",_aa)]end;if(cb("dropdownWidth",_aa)~=nil)then
cd=cb("dropdownWidth",_aa)end;if(cb("dropdownHeight",_aa)~=nil)then
dd=cb("dropdownHeight",_aa)end;if(cb("offset",_aa)~=nil)then
bd=cb("offset",_aa)end
if(_aa["item"]~=nil)then local aaa=_aa["item"]if(
aaa.properties~=nil)then aaa={aaa}end;for baa,caa in pairs(aaa)do
d_a:addItem(cb("text",caa),colors[cb("bg",caa)],colors[cb("fg",caa)])end end end,setOffset=function(d_a,_aa)
bd=_aa;d_a:updateDraw()return d_a end,getOffset=function(d_a)return bd end,addItem=function(d_a,_aa,aaa,baa,...)
table.insert(bc,{text=_aa,bgCol=
aaa or d_a.bgColor,fgCol=baa or d_a.fgColor,args={...}})d_a:updateDraw()return d_a end,getAll=function(d_a)return
bc end,removeItem=function(d_a,_aa)table.remove(bc,_aa)d_a:updateDraw()
return d_a end,getItem=function(d_a,_aa)return bc[_aa]end,getItemIndex=function(d_a)
local _aa=d_a:getValue()for aaa,baa in pairs(bc)do if(baa==_aa)then return aaa end end end,clear=function(d_a)
bc={}d_a:setValue({})d_a:updateDraw()return d_a end,getItemCount=function(d_a)return
#bc end,editItem=function(d_a,_aa,aaa,baa,caa,...)table.remove(bc,_aa)
table.insert(bc,_aa,{text=aaa,bgCol=baa or d_a.bgColor,fgCol=
caa or d_a.fgColor,args={...}})d_a:updateDraw()return d_a end,selectItem=function(d_a,_aa)d_a:setValue(
bc[_aa]or{})d_a:updateDraw()return d_a end,setSelectedItem=function(d_a,_aa,aaa,baa)cc=
_aa or d_a.bgColor;dc=aaa or d_a.fgColor;_d=baa
d_a:updateDraw()return d_a end,setDropdownSize=function(d_a,_aa,aaa)cd,dd=_aa,aaa
d_a:updateDraw()return d_a end,mouseHandler=function(d_a,_aa,aaa,baa)
if(b_a)then
local caa,daa=d_a:getAbsolutePosition(d_a:getAnchorPosition())
if(_aa==1)then
if(#bc>0)then
for n=1,dd do
if(bc[n+bd]~=nil)then
if(caa<=aaa)and(caa+cd>aaa)and
(daa+n==baa)then d_a:setValue(bc[n+bd])
d_a:updateDraw()
local _ba=d_a:getEventSystem():sendEvent("mouse_click",d_a,"mouse_click",dir,aaa,baa)if(_ba==false)then return _ba end;return true end end end end end end
if(_c.mouseHandler(d_a,_aa,aaa,baa))then b_a=(not b_a)d_a:updateDraw()
return true else if(b_a)then d_a:updateDraw()b_a=false end;return false end end,mouseUpHandler=function(d_a,_aa,aaa,baa)
if
(b_a)then
local caa,daa=d_a:getAbsolutePosition(d_a:getAnchorPosition())
if(_aa==1)then
if(#bc>0)then
for n=1,dd do
if(bc[n+bd]~=nil)then
if(caa<=aaa)and(caa+cd>aaa)and
(daa+n==baa)then b_a=false;d_a:updateDraw()
local _ba=d_a:getEventSystem():sendEvent("mouse_up",d_a,"mouse_up",dir,aaa,baa)if(_ba==false)then return _ba end;return true end end end end end end end,scrollHandler=function(d_a,_aa,aaa,baa)
if
(b_a)and(d_a:isFocused())then bd=bd+_aa;if(bd<0)then bd=0 end;if(_aa==1)then
if(#bc>dd)then if(bd>
#bc-dd)then bd=#bc-dd end else bd=math.min(#bc-1,0)end end
local caa=d_a:getEventSystem():sendEvent("mouse_scroll",d_a,"mouse_scroll",_aa,aaa,baa)if(caa==false)then return caa end;d_a:updateDraw()return true end end,draw=function(d_a)
if
(_c.draw(d_a))then local _aa,aaa=d_a:getAnchorPosition()local baa,caa=d_a:getSize()
if(
d_a.parent~=nil)then if(d_a.bgColor~=false)then
d_a.parent:drawBackgroundBox(_aa,aaa,baa,caa,d_a.bgColor)end;local daa=d_a:getValue()
local _ba=bb.getTextHorizontalAlign((
daa~=nil and daa.text or""),baa,ad):sub(1,
baa-1).. (b_a and a_a or __a)
d_a.parent:writeText(_aa,aaa,_ba,d_a.bgColor,d_a.fgColor)
if(b_a)then
for n=1,dd do
if(bc[n+bd]~=nil)then
if(bc[n+bd]==daa)then
if(_d)then
d_a.parent:writeText(_aa,aaa+n,bb.getTextHorizontalAlign(bc[
n+bd].text,cd,ad),cc,dc)else
d_a.parent:writeText(_aa,aaa+n,bb.getTextHorizontalAlign(bc[n+bd].text,cd,ad),bc[
n+bd].bgCol,bc[n+bd].fgCol)end else
d_a.parent:writeText(_aa,aaa+n,bb.getTextHorizontalAlign(bc[n+bd].text,cd,ad),bc[
n+bd].bgCol,bc[n+bd].fgCol)end end end end end end end,init=function(d_a)
d_a.parent:addEvent("mouse_click",d_a)d_a.parent:addEvent("mouse_up",d_a)
d_a.parent:addEvent("mouse_scroll",d_a)
if(_c.init(d_a))then
d_a.bgColor=d_a.parent:getTheme("DropdownBG")d_a.fgColor=d_a.parent:getTheme("DropdownText")
cc=d_a.parent:getTheme("SelectionBG")dc=d_a.parent:getTheme("SelectionText")end end}return setmetatable(c_a,_c)end end
aa["objects"]["Image"]=function(...)local ab=da("Object")
local bb=da("utils").getValueFromXML
return
function(cb)local db=ab(cb)local _c="Image"db:setZIndex(2)local ac;local bc;local cc=false
local function dc()
local ad={[0]={8,4,3,6,5},{4,14,8,7},{6,10,8,7},{9,11,8,0},{1,14,8,0},{13,12,8,0},{2,10,8,0},{15,8,10,11,12,14},{0,7,1,9,2,13},{3,11,8,7},{2,6,7,15},{9,3,7,15},{13,5,7,15},{5,12,8,7},{1,4,7,15},{7,10,11,12,14}}local bd,cd,dd={},{},{}for i=0,15 do cd[2 ^i]=i end
do local aaa="0123456789abcdef"
for i=1,16 do bd[aaa:sub(i,i)]=
i-1;bd[i-1]=aaa:sub(i,i)
dd[aaa:sub(i,i)]=2 ^ (i-1)dd[2 ^ (i-1)]=aaa:sub(i,i)local baa=ad[i-1]for i=1,#baa do
baa[i]=2 ^baa[i]end end end
local function __a(aaa)local baa=ad[cd[aaa[#aaa][1]]]
for j=1,#baa do local caa=baa[j]for i=1,#aaa-1
do if aaa[i][1]==caa then return i end end end;return 1 end
local function a_a(aaa,baa)
if not baa then local daa={}baa={}for i=1,6 do local _ba=aaa[i]local aba=baa[_ba]
baa[_ba],daa[i]=aba and(aba+1)or 1,_ba end;aaa=daa end;local caa={}for daa,_ba in pairs(baa)do caa[#caa+1]={daa,_ba}end
if#
caa>1 then
while#caa>2 do
table.sort(caa,function(dba,_ca)return dba[2]>_ca[2]end)local _ba,aba=__a(caa),#caa;local bba,cba=caa[aba][1],caa[_ba][1]for i=1,6 do
if aaa[i]==
bba then aaa[i]=cba;caa[_ba][2]=caa[_ba][2]+1 end end;caa[aba]=nil end;local daa=128;for i=1,#aaa-1 do
if aaa[i]~=aaa[6]then daa=daa+2 ^ (i-1)end end;return string.char(daa),dd[caa[1][1]==aaa[6]and
caa[2][1]or caa[1][1]],
dd[aaa[6]]else
return"\128",dd[aaa[1]],dd[aaa[1]]end end
local b_a,c_a,d_a,_aa={{},{},{}},0,#ac+#ac%3,db.bgColor or colors.black;for i=1,#ac do if#ac[i]>c_a then c_a=#ac[i]end end
for y=0,d_a-1,3
do local aaa,baa,caa,daa={},{},{},1
for x=0,c_a-1,2 do local _ba,aba={},{}
for yy=1,3 do
for xx=1,2 do
_ba[#_ba+1]=(ac[y+yy]and
ac[y+yy][x+xx])and
(ac[y+yy][x+xx]==0 and _aa or ac[y+yy][x+xx])or _aa;aba[_ba[#_ba]]=
aba[_ba[#_ba]]and(aba[_ba[#_ba]]+1)or 1 end end;aaa[daa],baa[daa],caa[daa]=a_a(_ba,aba)daa=daa+1 end
b_a[1][#b_a[1]+1],b_a[2][#b_a[2]+1],b_a[3][#b_a[3]+1]=table.concat(aaa),table.concat(baa),table.concat(caa)end;b_a.width,b_a.height=#b_a[1][1],#b_a[1]bc=b_a end
local _d={init=function(ad)ad.bgColor=ad.parent:getTheme("ImageBG")end,getType=function(ad)return
_c end,loadImage=function(ad,bd)ac=paintutils.loadImage(bd)cc=false
ad:updateDraw()return ad end,shrink=function(ad)dc()cc=true
ad:updateDraw()return ad end,setValuesByXMLData=function(ad,bd)db.setValuesByXMLData(ad,bd)
if(
bb("shrink",bd)~=nil)then if(bb("shrink",bd))then ad:shrink()end end
if(bb("path",bd)~=nil)then ad:loadImage(bb("path",bd))end;return ad end,draw=function(ad)
if
(db.draw(ad))then
if(ad.parent~=nil)then
if(ac~=nil)then local bd,cd=ad:getAnchorPosition()
local dd,__a=ad:getSize()
if(cc)then local a_a,b_a,c_a=bc[1],bc[2],bc[3]
for i=1,bc.height do local d_a=a_a[i]
if type(d_a)=="string"then ad.parent:setText(bd,
cd+i-1,d_a)
ad.parent:setFG(bd,cd+i-1,b_a[i])ad.parent:setBG(bd,cd+i-1,c_a[i])elseif
type(d_a)=="table"then ad.parent:setText(bd,cd+i-1,d_a[2])ad.parent:setFG(bd,
cd+i-1,b_a[i])
ad.parent:setBG(bd,cd+i-1,c_a[i])end end else
for yPos=1,math.min(#ac,__a)do local a_a=ac[yPos]
for xPos=1,math.min(#a_a,dd)do if a_a[xPos]>0 then
ad.parent:drawBackgroundBox(
bd+xPos-1,cd+yPos-1,1,1,a_a[xPos])end end end end end end end end}return setmetatable(_d,db)end end
aa["objects"]["Checkbox"]=function(...)local ab=da("Object")local bb=da("utils")
local cb=bb.getValueFromXML
return
function(db)local _c=ab(db)local ac="Checkbox"_c:setZIndex(5)
_c:setValue(false)_c.width=1;_c.height=1;local bc="\42"
local cc={getType=function(dc)return ac end,setSymbol=function(dc,_d)bc=_d
dc:updateDraw()return dc end,mouseHandler=function(dc,_d,ad,bd)
if(_c.mouseHandler(dc,_d,ad,bd))then
if(_d==1)then
if(
dc:getValue()~=true)and(dc:getValue()~=false)then
dc:setValue(false)else dc:setValue(not dc:getValue())end;dc:updateDraw()return true end end;return false end,touchHandler=function(dc,_d,ad)return
dc:mouseHandler(1,_d,ad)end,setValuesByXMLData=function(dc,_d)
_c.setValuesByXMLData(dc,_d)
if(cb("checked",_d)~=nil)then if(cb("checked",_d))then dc:setValue(true)else
dc:setValue(false)end end;return dc end,draw=function(dc)
if
(_c.draw(dc))then
if(dc.parent~=nil)then local _d,ad=dc:getAnchorPosition()
local bd,cd=dc:getSize()local dd=bb.getTextVerticalAlign(cd,"center")if
(dc.bgColor~=false)then
dc.parent:drawBackgroundBox(_d,ad,bd,cd,dc.bgColor)end
for n=1,cd do
if(n==dd)then
if(dc:getValue()==true)then
dc.parent:writeText(_d,
ad+ (n-1),bb.getTextHorizontalAlign(bc,bd,"center"),dc.bgColor,dc.fgColor)else
dc.parent:writeText(_d,ad+ (n-1),bb.getTextHorizontalAlign(" ",bd,"center"),dc.bgColor,dc.fgColor)end end end end end end,init=function(dc)
dc.parent:addEvent("mouse_click",dc)dc.parent:addEvent("mouse_up",dc)
if(_c.init(dc))then
dc.bgColor=dc.parent:getTheme("CheckboxBG")dc.fgColor=dc.parent:getTheme("CheckboxText")end end}return setmetatable(cc,_c)end end
aa["objects"]["Pane"]=function(...)local ab=da("Object")local bb=da("basaltLogs")
return
function(cb)
local db=ab(cb)local _c="Pane"
local ac={getType=function(bc)return _c end,setBackground=function(bc,cc,dc,_d)db.setBackground(bc,cc,dc,_d)
return bc end,init=function(bc)
if(db.init(bc))then
bc.bgColor=bc.parent:getTheme("PaneBG")bc.fgColor=bc.parent:getTheme("PaneBG")end end}return setmetatable(ac,db)end end
aa["objects"]["Animation"]=function(...)local ab=da("utils").getValueFromXML
local bb=da("basaltEvent")
local cb,db,_c,ac,bc,cc=math.floor,math.sin,math.cos,math.pi,math.sqrt,math.pow
local dc=function(cab,dab,_bb)return cab+ (dab-cab)*_bb end;local _d=function(cab)return cab end
local ad=function(cab)return 1 -cab end;local bd=function(cab)return cab*cab*cab end;local cd=function(cab)return
ad(bd(ad(cab)))end;local dd=function(cab)return
dc(bd(cab),cd(cab),cab)end;local __a=function(cab)return
db((cab*ac)/2)end;local a_a=function(cab)return
ad(_c((cab*ac)/2))end;local b_a=function(cab)return
- (_c(ac*x)-1)/2 end
local c_a=function(cab)
local dab=1.70158;local _bb=dab+1;return _bb*cab^3 -dab*cab^2 end;local d_a=function(cab)return cab^3 end
local _aa=function(cab)local dab=(2 *ac)/3;return

cab==0 and 0 or(cab==1 and 1 or(-2 ^ (10 *cab-10)*
db((cab*10 -10.75)*dab)))end
local function aaa(cab)return cab==0 and 0 or 2 ^ (10 *cab-10)end
local function baa(cab)return cab==0 and 0 or 2 ^ (10 *cab-10)end
local function caa(cab)local dab=1.70158;local _bb=dab*1.525;return
cab<0.5 and( (2 *cab)^2 *
( (_bb+1)*2 *cab-_bb))/2 or
(
(2 *cab-2)^2 * ( (_bb+1)* (cab*2 -2)+_bb)+2)/2 end;local function daa(cab)return
cab<0.5 and 4 *cab^3 or 1 - (-2 *cab+2)^3 /2 end
local function _ba(cab)
local dab=(2 *ac)/4.5
return
cab==0 and 0 or(cab==1 and 1 or
(
cab<0.5 and- (2 ^ (20 *cab-10)*
db((20 *cab-11.125)*dab))/2 or
(2 ^ (-20 *cab+10)*db((20 *cab-11.125)*dab))/2 +1))end
local function aba(cab)return
cab==0 and 0 or(cab==1 and 1 or
(
cab<0.5 and 2 ^ (20 *cab-10)/2 or(2 -2 ^ (-20 *cab+10))/2))end;local function bba(cab)return
cab<0.5 and 2 *cab^2 or 1 - (-2 *cab+2)^2 /2 end;local function cba(cab)return
cab<0.5 and 8 *
cab^4 or 1 - (-2 *cab+2)^4 /2 end;local function dba(cab)return
cab<0.5 and 16 *
cab^5 or 1 - (-2 *cab+2)^5 /2 end;local function _ca(cab)
return cab^2 end;local function aca(cab)return cab^4 end
local function bca(cab)return cab^5 end;local function cca(cab)local dab=1.70158;local _bb=dab+1;return
1 +_bb* (cab-1)^3 +dab* (cab-1)^2 end;local function dca(cab)return 1 -
(1 -cab)^3 end
local function _da(cab)local dab=(2 *ac)/3;return

cab==0 and 0 or(cab==1 and 1 or(
2 ^ (-10 *cab)*db((cab*10 -0.75)*dab)+1))end
local function ada(cab)return cab==1 and 1 or 1 -2 ^ (-10 *cab)end;local function bda(cab)return 1 - (1 -cab)* (1 -cab)end;local function cda(cab)return 1 - (
1 -cab)^4 end;local function dda(cab)
return 1 - (1 -cab)^5 end
local function __b(cab)return 1 -bc(1 -cc(cab,2))end;local function a_b(cab)return bc(1 -cc(cab-1,2))end
local function b_b(cab)return

cab<0.5 and(1 -bc(
1 -cc(2 *cab,2)))/2 or(bc(1 -cc(-2 *cab+2,2))+1)/2 end
local function c_b(cab)local dab=7.5625;local _bb=2.75
if(cab<1 /_bb)then return dab*cab*cab elseif(cab<2 /_bb)then local abb=cab-
1.5 /_bb;return dab*abb*abb+0.75 elseif(cab<2.5 /_bb)then local abb=cab-
2.25 /_bb;return dab*abb*abb+0.9375 else
local abb=cab-2.625 /_bb;return dab*abb*abb+0.984375 end end;local function d_b(cab)return 1 -c_b(1 -cab)end;local function _ab(cab)return
x<0.5 and(1 -
c_b(1 -2 *cab))/2 or(1 +c_b(2 *cab-1))/2 end
local aab={linear=_d,lerp=dc,flip=ad,easeIn=bd,easeInSine=a_a,easeInBack=c_a,easeInCubic=d_a,easeInElastic=_aa,easeInExpo=baa,easeInQuad=_ca,easeInQuart=aca,easeInQuint=bca,easeInCirc=__b,easeInBounce=d_b,easeOut=cd,easeOutSine=__a,easeOutBack=cca,easeOutCubic=dca,easeOutElastic=_da,easeOutExpo=ada,easeOutQuad=bda,easeOutQuart=cda,easeOutQuint=dda,easeOutCirc=a_b,easeOutBounce=c_b,easeInOut=dd,easeInOutSine=b_a,easeInOutBack=caa,easeInOutCubic=daa,easeInOutElastic=_ba,easeInOutExpo=aba,easeInOutQuad=bba,easeInOutQuart=cba,easeInOutQuint=dba,easeInOutCirc=b_b,easeInOutBounce=_ab}local bab={}
return
function(cab)local dab={}local _bb="Animation"local abb;local bbb={}local cbb=0;local dbb=false;local _cb=1;local acb=false
local bcb=bb()local ccb=0;local dcb;local _db=false;local adb=false;local bdb="easeOut"local cdb;local function ddb(c_c)for d_c,_ac in pairs(c_c)do
_ac(dab,bbb[_cb].t,_cb)end end
local function __c(c_c)if(_cb==1)then
c_c:animationStartHandler()end;if(bbb[_cb]~=nil)then ddb(bbb[_cb].f)
cbb=bbb[_cb].t end;_cb=_cb+1
if(bbb[_cb]==nil)then if(acb)then _cb=1;cbb=0 else
c_c:animationDoneHandler()return end end;if(bbb[_cb].t>0)then
abb=os.startTimer(bbb[_cb].t-cbb)else __c(c_c)end end
local function a_c(c_c,d_c)for n=1,#bbb do
if(bbb[n].t==c_c)then table.insert(bbb[n].f,d_c)return end end
for n=1,#bbb do
if(bbb[n].t>c_c)then if
(bbb[n-1]~=nil)then if(bbb[n-1].t<c_c)then
table.insert(bbb,n-1,{t=c_c,f={d_c}})return end else
table.insert(bbb,n,{t=c_c,f={d_c}})return end end end
if(#bbb<=0)then table.insert(bbb,1,{t=c_c,f={d_c}})return elseif(
bbb[#bbb].t<c_c)then table.insert(bbb,{t=c_c,f={d_c}})end end
local function b_c(c_c,d_c,_ac,aac,bac,cac,dac,_bc)local abc=cdb;local bbc,cbc;local dbc=""if(abc.parent~=nil)then
dbc=abc.parent:getName()end;dbc=dbc..abc:getName()
a_c(aac+0.05,function()
if
(dac~=nil)then if(bab[dac]==nil)then bab[dac]={}end;if(bab[dac][dbc]~=nil)then
if(
bab[dac][dbc]~=_bc)then bab[dac][dbc]:cancel()end end;bab[dac][dbc]=_bc end;bbc,cbc=bac(abc)end)
for n=0.05,_ac+0.01,0.05 do
a_c(aac+n,function()
local _cc=math.floor(aab.lerp(bbc,c_c,aab[bdb](n/_ac))+0.5)
local acc=math.floor(aab.lerp(cbc,d_c,aab[bdb](n/_ac))+0.5)cac(abc,_cc,acc)
if(dac~=nil)then if(n>=_ac-0.01)then if(bab[dac][dbc]==_bc)then bab[dac][dbc]=
nil end end end end)end end
dab={name=cab,getType=function(c_c)return _bb end,getBaseFrame=function(c_c)if(c_c.parent~=nil)then
return c_c.parent:getBaseFrame()end;return c_c end,setMode=function(c_c,d_c)
bdb=d_c;return c_c end,addMode=function(c_c,d_c,_ac)aab[d_c]=_ac;return c_c end,generateXMLEventFunction=function(c_c,d_c,_ac)
local aac=function(bac)
if(
bac:sub(1,1)=="#")then
local cac=c_c:getBaseFrame():getDeepObject(bac:sub(2,bac:len()))
if(cac~=nil)and(cac.internalObjetCall~=nil)then d_c(c_c,function()
cac:internalObjetCall()end)end else
d_c(c_c,c_c:getBaseFrame():getVariable(bac))end end;if(type(_ac)=="string")then aac(_ac)elseif(type(_ac)=="table")then
for bac,cac in pairs(_ac)do aac(cac)end end;return c_c end,setValuesByXMLData=function(c_c,d_c)_db=
ab("loop",d_c)==true and true or false
if(
ab("object",d_c)~=nil)then
local _ac=c_c:getBaseFrame():getDeepObject(ab("object",d_c))if(_ac==nil)then
_ac=c_c:getBaseFrame():getVariable(ab("object",d_c))end
if(_ac~=nil)then c_c:setObject(_ac)end end
if(d_c["move"]~=nil)then local _ac=ab("x",d_c["move"])
local aac=ab("y",d_c["move"])local bac=ab("duration",d_c["move"])
local cac=ab("time",d_c["move"])c_c:move(_ac,aac,bac,cac)end
if(d_c["size"]~=nil)then local _ac=ab("width",d_c["size"])
local aac=ab("height",d_c["size"])local bac=ab("duration",d_c["size"])
local cac=ab("time",d_c["size"])c_c:size(_ac,aac,bac,cac)end
if(d_c["offset"]~=nil)then local _ac=ab("x",d_c["offset"])
local aac=ab("y",d_c["offset"])local bac=ab("duration",d_c["offset"])
local cac=ab("time",d_c["offset"])c_c:offset(_ac,aac,bac,cac)end
if(d_c["textColor"]~=nil)then
local _ac=ab("duration",d_c["textColor"])local aac=ab("time",d_c["textColor"])local bac={}
local cac=d_c["textColor"]["color"]
if(cac~=nil)then if(cac.properties~=nil)then cac={cac}end;for dac,_bc in pairs(cac)do
table.insert(bac,colors[_bc:value()])end end;if(_ac~=nil)and(#bac>0)then
c_c:changeTextColor(_ac,aac or 0,table.unpack(bac))end end
if(d_c["background"]~=nil)then
local _ac=ab("duration",d_c["background"])local aac=ab("time",d_c["background"])local bac={}
local cac=d_c["background"]["color"]
if(cac~=nil)then if(cac.properties~=nil)then cac={cac}end;for dac,_bc in pairs(cac)do
table.insert(bac,colors[_bc:value()])end end;if(_ac~=nil)and(#bac>0)then
c_c:changeBackground(_ac,aac or 0,table.unpack(bac))end end
if(d_c["text"]~=nil)then local _ac=ab("duration",d_c["text"])
local aac=ab("time",d_c["text"])local bac={}local cac=d_c["text"]["text"]
if(cac~=nil)then if(cac.properties~=nil)then
cac={cac}end;for dac,_bc in pairs(cac)do
table.insert(bac,_bc:value())end end;if(_ac~=nil)and(#bac>0)then
c_c:changeText(_ac,aac or 0,table.unpack(bac))end end;if(ab("onDone",d_c)~=nil)then
c_c:generateXMLEventFunction(c_c.onDone,ab("onDone",d_c))end;if(ab("onStart",d_c)~=nil)then
c_c:generateXMLEventFunction(c_c.onDone,ab("onStart",d_c))end
if
(ab("autoDestroy",d_c)~=nil)then if(ab("autoDestroy",d_c))then adb=true end end;bdb=ab("mode",d_c)or bdb
if(ab("play",d_c)~=nil)then if
(ab("play",d_c))then c_c:play(_db)end end;return c_c end,getZIndex=function(c_c)return
1 end,getName=function(c_c)return c_c.name end,setObject=function(c_c,d_c)cdb=d_c;return c_c end,move=function(c_c,d_c,_ac,aac,bac,cac)cdb=
cac or cdb
b_c(d_c,_ac,aac,bac or 0,cdb.getPosition,cdb.setPosition,"position",c_c)return c_c end,offset=function(c_c,d_c,_ac,aac,bac,cac)cdb=
cac or cdb
b_c(d_c,_ac,aac,bac or 0,cdb.getOffset,cdb.setOffset,"offset",c_c)return c_c end,size=function(c_c,d_c,_ac,aac,bac,cac)cdb=cac or
cdb
b_c(d_c,_ac,aac,bac or 0,cdb.getSize,cdb.setSize,"size",c_c)return c_c end,changeText=function(c_c,d_c,_ac,...)
local aac={...}_ac=_ac or 0;cdb=obj or cdb;for n=1,#aac do
a_c(_ac+n* (d_c/#aac),function()
cdb.setText(cdb,aac[n])end)end;return c_c end,changeBackground=function(c_c,d_c,_ac,...)
local aac={...}_ac=_ac or 0;cdb=obj or cdb;for n=1,#aac do
a_c(_ac+n* (d_c/#aac),function()
cdb.setBackground(cdb,aac[n])end)end;return c_c end,changeTextColor=function(c_c,d_c,_ac,...)
local aac={...}_ac=_ac or 0;cdb=obj or cdb;for n=1,#aac do
a_c(_ac+n* (d_c/#aac),function()
cdb.setForeground(cdb,aac[n])end)end;return c_c end,add=function(c_c,d_c,_ac)
dcb=d_c
a_c((_ac or ccb)+
(bbb[#bbb]~=nil and bbb[#bbb].t or 0),d_c)return c_c end,wait=function(c_c,d_c)ccb=d_c;return c_c end,rep=function(c_c,d_c)
if(
dcb~=nil)then for n=1,d_c or 1 do
a_c((wait or ccb)+
(bbb[#bbb]~=nil and bbb[#bbb].t or 0),dcb)end end;return c_c end,onDone=function(c_c,d_c)
bcb:registerEvent("animation_done",d_c)return c_c end,onStart=function(c_c,d_c)
bcb:registerEvent("animation_start",d_c)return c_c end,setAutoDestroy=function(c_c,d_c)
adb=d_c~=nil and d_c or true;return c_c end,animationDoneHandler=function(c_c)
bcb:sendEvent("animation_done",c_c)c_c.parent:removeEvent("other_event",c_c)if(adb)then
c_c.parent:removeObject(c_c)c_c=nil end end,animationStartHandler=function(c_c)
bcb:sendEvent("animation_start",c_c)end,clear=function(c_c)bbb={}dcb=nil;ccb=0;_cb=1;cbb=0;acb=false;return c_c end,play=function(c_c,d_c)
c_c:cancel()dbb=true;acb=d_c and true or false;_cb=1;cbb=0
if(bbb[_cb]~=nil)then
if(
bbb[_cb].t>0)then abb=os.startTimer(bbb[_cb].t)else __c(c_c)end else c_c:animationDoneHandler()end;c_c.parent:addEvent("other_event",c_c)return c_c end,cancel=function(c_c)if(
abb~=nil)then os.cancelTimer(abb)acb=false end
dbb=false;c_c.parent:removeEvent("other_event",c_c)return c_c end,internalObjetCall=function(c_c)
c_c:play(_db)end,eventHandler=function(c_c,d_c,_ac)if(dbb)then
if(d_c=="timer")and(_ac==abb)then if(bbb[_cb]~=nil)then
__c(c_c)else c_c:animationDoneHandler()end end end end}dab.__index=dab;return dab end end
aa["objects"]["Input"]=function(...)local ab=da("Object")local bb=da("utils")
local cb=da("basaltLogs")local db=bb.getValueFromXML
return
function(_c)local ac=ab(_c)local bc="Input"local cc="text"local dc=0
ac:setZIndex(5)ac:setValue("")ac.width=10;ac.height=1;local _d=1;local ad=1;local bd=""local cd;local dd
local __a=bd;local a_a=false
local b_a={getType=function(c_a)return bc end,setInputType=function(c_a,d_a)if(d_a=="password")or(d_a=="number")or(d_a==
"text")then cc=d_a end
c_a:updateDraw()return c_a end,setDefaultText=function(c_a,d_a,_aa,aaa)bd=d_a
cd=aaa or cd;dd=_aa or dd;if(c_a:isFocused())then __a=""else __a=bd end
c_a:updateDraw()return c_a end,getInputType=function(c_a)
return cc end,setValue=function(c_a,d_a)ac.setValue(c_a,tostring(d_a))
if not(a_a)then
if
(c_a:isFocused())then _d=tostring(d_a):len()+1;ad=math.max(1,_d-
c_a:getWidth()+1)
local _aa,aaa=c_a:getAnchorPosition()
c_a.parent:setCursor(true,_aa+_d-ad,aaa+
math.floor(c_a:getHeight()/2),c_a.fgColor)end end;c_a:updateDraw()return c_a end,getValue=function(c_a)
local d_a=ac.getValue(c_a)
return cc=="number"and tonumber(d_a)or d_a end,setInputLimit=function(c_a,d_a)
dc=tonumber(d_a)or dc;c_a:updateDraw()return c_a end,getInputLimit=function(c_a)return dc end,setValuesByXMLData=function(c_a,d_a)
ac.setValuesByXMLData(c_a,d_a)local _aa,aaa
if(db("defaultBG",d_a)~=nil)then _aa=db("defaultBG",d_a)end
if(db("defaultFG",d_a)~=nil)then aaa=db("defaultFG",d_a)end;if(db("default",d_a)~=nil)then
c_a:setDefaultText(db("default",d_a),aaa~=nil and colors[aaa],
_aa~=nil and colors[_aa])end
if(db("limit",d_a)~=
nil)then c_a:setInputLimit(db("limit",d_a))end;if(db("type",d_a)~=nil)then
c_a:setInputType(db("type",d_a))end;return c_a end,getFocusHandler=function(c_a)
ac.getFocusHandler(c_a)
if(c_a.parent~=nil)then local d_a,_aa=c_a:getAnchorPosition()__a=""if(bd~="")then
c_a:updateDraw()end
c_a.parent:setCursor(true,d_a+_d-ad,_aa+math.max(math.ceil(
c_a:getHeight()/2 -1,1)),c_a.fgColor)end end,loseFocusHandler=function(c_a)
ac.loseFocusHandler(c_a)if(c_a.parent~=nil)then __a=bd;if(bd~="")then c_a:updateDraw()end
c_a.parent:setCursor(false)end end,keyHandler=function(c_a,d_a)
if
(ac.keyHandler(c_a,d_a))then local _aa,aaa=c_a:getSize()a_a=true
if(d_a==keys.backspace)then
local bba=tostring(ac.getValue())if(_d>1)then
c_a:setValue(bba:sub(1,_d-2)..bba:sub(_d,bba:len()))if(_d>1)then _d=_d-1 end
if(ad>1)then if(_d<ad)then ad=ad-1 end end end end;if(d_a==keys.enter)then if(c_a.parent~=nil)then end end
if(
d_a==keys.right)then
local bba=tostring(ac.getValue()):len()_d=_d+1;if(_d>bba)then _d=bba+1 end;if(_d<1)then _d=1 end;if
(_d<ad)or(_d>=_aa+ad)then ad=_d-_aa+1 end;if(ad<1)then ad=1 end end
if(d_a==keys.left)then _d=_d-1;if(_d>=1)then
if(_d<ad)or(_d>=_aa+ad)then ad=_d end end;if(_d<1)then _d=1 end;if(ad<1)then ad=1 end end;local baa,caa=c_a:getAnchorPosition()
local daa=tostring(ac.getValue())
local _ba=(_d<=daa:len()and _d-1 or daa:len())- (ad-1)local aba=c_a:getX()
if(_ba>aba+_aa-1)then _ba=aba+_aa-1 end;if(c_a.parent~=nil)then
c_a.parent:setCursor(true,baa+_ba,caa+
math.max(math.ceil(aaa/2 -1,1)),c_a.fgColor)end
c_a:updateDraw()a_a=false;return true end;return false end,charHandler=function(c_a,d_a)
if
(ac.charHandler(c_a,d_a))then a_a=true;local _aa,aaa=c_a:getSize()local baa=ac.getValue()
if(
baa:len()<dc or dc<=0)then
if(cc=="number")then local cba=baa;if
(#baa==0 and d_a=="-")or(d_a==".")or(tonumber(d_a)~=nil)then
c_a:setValue(
baa:sub(1,_d-1)..d_a..baa:sub(_d,baa:len()))_d=_d+1 end;if(
tonumber(ac.getValue())==nil)then end else
c_a:setValue(baa:sub(1,_d-1)..d_a..
baa:sub(_d,baa:len()))_d=_d+1 end;if(_d>=_aa+ad)then ad=ad+1 end end;local caa,daa=c_a:getAnchorPosition()
local _ba=tostring(ac.getValue())
local aba=(_d<=_ba:len()and _d-1 or _ba:len())- (ad-1)local bba=c_a:getX()
if(aba>bba+_aa-1)then aba=bba+_aa-1 end;if(c_a.parent~=nil)then
c_a.parent:setCursor(true,caa+aba,daa+
math.max(math.ceil(aaa/2 -1,1)),c_a.fgColor)end;a_a=false
c_a:updateDraw()return true end;return false end,mouseHandler=function(c_a,d_a,_aa,aaa)
if
(ac.mouseHandler(c_a,d_a,_aa,aaa))then local baa,caa=c_a:getAnchorPosition()
local daa,_ba=c_a:getAbsolutePosition(baa,caa)local aba,bba=c_a:getSize()_d=_aa-daa+ad;local cba=ac.getValue()if(_d>
cba:len())then _d=cba:len()+1 end;if(_d<ad)then ad=_d-1
if(ad<1)then ad=1 end end
c_a.parent:setCursor(true,baa+_d-ad,caa+
math.max(math.ceil(bba/2 -1,1)),c_a.fgColor)return true end end,dragHandler=function(c_a,d_a,_aa,aaa,baa,caa)
if
(c_a:isFocused())then if(c_a:isCoordsInObject(_aa,aaa))then
if(ac.dragHandler(c_a,d_a,_aa,aaa,baa,caa))then return true end end
c_a.parent:removeFocusedObject()end end,eventHandler=function(c_a,d_a,_aa,aaa,baa,caa)
if
(ac.eventHandler(c_a,d_a,_aa,aaa,baa,caa))then
if(d_a=="paste")then
if(c_a:isFocused())then local daa=ac.getValue()
local _ba,aba=c_a:getSize()a_a=true
if(cc=="number")then local bca=daa
if(_aa==".")or(tonumber(_aa)~=nil)then
c_a:setValue(daa:sub(1,
_d-1).._aa..daa:sub(_d,daa:len()))_d=_d+_aa:len()end
if(tonumber(ac.getValue())==nil)then c_a:setValue(bca)end else
c_a:setValue(daa:sub(1,_d-1).._aa..daa:sub(_d,daa:len()))_d=_d+_aa:len()end;if(_d>=_ba+ad)then ad=(_d+1)-_ba end
local bba,cba=c_a:getAnchorPosition()local dba=tostring(ac.getValue())
local _ca=(
_d<=dba:len()and _d-1 or dba:len())- (ad-1)local aca=c_a:getX()
if(_ca>aca+_ba-1)then _ca=aca+_ba-1 end;if(c_a.parent~=nil)then
c_a.parent:setCursor(true,bba+_ca,cba+
math.max(math.ceil(aba/2 -1,1)),c_a.fgColor)end
c_a:updateDraw()a_a=false end end end end,draw=function(c_a)
if
(ac.draw(c_a))then
if(c_a.parent~=nil)then local d_a,_aa=c_a:getAnchorPosition()
local aaa,baa=c_a:getSize()local caa=bb.getTextVerticalAlign(baa,"center")if
(c_a.bgColor~=false)then
c_a.parent:drawBackgroundBox(d_a,_aa,aaa,baa,c_a.bgColor)end
for n=1,baa do
if(n==caa)then
local daa=tostring(ac.getValue())local _ba=c_a.bgColor;local aba=c_a.fgColor;local bba;if(daa:len()<=0)then bba=__a
_ba=cd or _ba;aba=dd or aba end;bba=__a
if(daa~="")then bba=daa end;bba=bba:sub(ad,aaa+ad-1)local cba=aaa-bba:len()if(cba<0)then
cba=0 end;if(cc=="password")and(daa~="")then
bba=string.rep("*",bba:len())end
bba=bba..string.rep(c_a.bgSymbol,cba)
c_a.parent:writeText(d_a,_aa+ (n-1),bba,_ba,aba)end end;if(c_a:isFocused())then
c_a.parent:setCursor(true,d_a+_d-ad,_aa+
math.floor(c_a:getHeight()/2),c_a.fgColor)end end end end,init=function(c_a)
if(
c_a.parent~=nil)then c_a.parent:addEvent("mouse_click",c_a)
c_a.parent:addEvent("key",c_a)c_a.parent:addEvent("char",c_a)
c_a.parent:addEvent("other_event",c_a)c_a.parent:addEvent("mouse_drag",c_a)end
if(ac.init(c_a))then
c_a.bgColor=c_a.parent:getTheme("InputBG")c_a.fgColor=c_a.parent:getTheme("InputText")end end}return setmetatable(b_a,ac)end end
aa["objects"]["Menubar"]=function(...)local ab=da("Object")local bb=da("utils")
local cb=bb.getValueFromXML;local db=da("tHex")
return
function(_c)local ac=ab(_c)local bc="Menubar"local cc={}ac.width=30;ac.height=1
ac:setZIndex(5)local dc={}local _d;local ad;local bd=true;local cd="left"local dd=0;local __a=1;local a_a=false
local function b_a()local c_a=0;local d_a=0
local _aa=cc:getWidth()
for n=1,#dc do if(d_a+dc[n].text:len()+__a*2 >_aa)then
if(
d_a<_aa)then
c_a=c_a+ (dc[n].text:len()+__a*2 - (_aa-d_a))else c_a=c_a+dc[n].text:len()+__a*2 end end;d_a=
d_a+dc[n].text:len()+__a*2 end;return c_a end
cc={getType=function(c_a)return bc end,addItem=function(c_a,d_a,_aa,aaa,...)
table.insert(dc,{text=tostring(d_a),bgCol=_aa or c_a.bgColor,fgCol=aaa or c_a.fgColor,args={...}})if(#dc==1)then c_a:setValue(dc[1])end
c_a:updateDraw()return c_a end,getAll=function(c_a)return
dc end,getItemIndex=function(c_a)local d_a=c_a:getValue()for _aa,aaa in pairs(dc)do
if(aaa==d_a)then return _aa end end end,clear=function(c_a)
dc={}c_a:setValue({})c_a:updateDraw()return c_a end,setSpace=function(c_a,d_a)__a=
d_a or __a;c_a:updateDraw()return c_a end,setOffset=function(c_a,d_a)dd=
d_a or 0;if(dd<0)then dd=0 end;local _aa=b_a()if(dd>_aa)then dd=_aa end
c_a:updateDraw()return c_a end,getOffset=function(c_a)return dd end,setScrollable=function(c_a,d_a)
a_a=d_a;if(d_a==nil)then a_a=true end;return c_a end,setValuesByXMLData=function(c_a,d_a)
ac.setValuesByXMLData(c_a,d_a)if(cb("selectionBG",d_a)~=nil)then
_d=colors[cb("selectionBG",d_a)]end;if(cb("selectionFG",d_a)~=nil)then
ad=colors[cb("selectionFG",d_a)]end;if(cb("scrollable",d_a)~=nil)then
if
(cb("scrollable",d_a))then c_a:setScrollable(true)else c_a:setScrollable(false)end end
if(
cb("offset",d_a)~=nil)then c_a:setOffset(cb("offset",d_a))end
if(cb("space",d_a)~=nil)then __a=cb("space",d_a)end
if(d_a["item"]~=nil)then local _aa=d_a["item"]
if(_aa.properties~=nil)then _aa={_aa}end;for aaa,baa in pairs(_aa)do
c_a:addItem(cb("text",baa),colors[cb("bg",baa)],colors[cb("fg",baa)])end end;return c_a end,removeItem=function(c_a,d_a)
table.remove(dc,d_a)c_a:updateDraw()return c_a end,getItem=function(c_a,d_a)
return dc[d_a]end,getItemCount=function(c_a)return#dc end,editItem=function(c_a,d_a,_aa,aaa,baa,...)table.remove(dc,d_a)
table.insert(dc,d_a,{text=_aa,bgCol=
aaa or c_a.bgColor,fgCol=baa or c_a.fgColor,args={...}})c_a:updateDraw()return c_a end,selectItem=function(c_a,d_a)c_a:setValue(
dc[d_a]or{})c_a:updateDraw()return c_a end,setSelectedItem=function(c_a,d_a,_aa,aaa)_d=
d_a or c_a.bgColor;ad=_aa or c_a.fgColor;bd=aaa
c_a:updateDraw()return c_a end,mouseHandler=function(c_a,d_a,_aa,aaa)
if
(ac.mouseHandler(c_a,d_a,_aa,aaa))then
local baa,caa=c_a:getAbsolutePosition(c_a:getAnchorPosition())local daa,_ba=c_a:getSize()local aba=0
for n=1,#dc do
if(dc[n]~=nil)then
if
(baa+aba<=_aa+dd)and(baa+aba+
dc[n].text:len()+ (__a*2)>_aa+dd)and(caa==aaa)then
c_a:setValue(dc[n])
c_a:getEventSystem():sendEvent(event,c_a,event,0,_aa,aaa,dc[n])end;aba=aba+dc[n].text:len()+__a*2 end end;c_a:updateDraw()return true end;return false end,scrollHandler=function(c_a,d_a,_aa,aaa)
if
(ac.scrollHandler(c_a,d_a,_aa,aaa))then if(a_a)then dd=dd+d_a;if(dd<0)then dd=0 end;local baa=b_a()if(dd>baa)then dd=baa end
c_a:updateDraw()end;return true end;return false end,draw=function(c_a)
if
(ac.draw(c_a))then
if(c_a.parent~=nil)then local d_a,_aa=c_a:getAnchorPosition()
local aaa,baa=c_a:getSize()if(c_a.bgColor~=false)then
c_a.parent:drawBackgroundBox(d_a,_aa,aaa,baa,c_a.bgColor)end;local caa=""local daa=""local _ba=""
for aba,bba in pairs(dc)do
local cba=
(" "):rep(__a)..bba.text.. (" "):rep(__a)caa=caa..cba
if(bba==c_a:getValue())then daa=daa..
db[_d or bba.bgCol or c_a.bgColor]:rep(cba:len())_ba=_ba..
db[
ad or bba.FgCol or c_a.fgColor]:rep(cba:len())else daa=daa..
db[bba.bgCol or c_a.bgColor]:rep(cba:len())_ba=_ba..
db[bba.FgCol or c_a.fgColor]:rep(cba:len())end end
c_a.parent:setText(d_a,_aa,caa:sub(dd+1,aaa+dd))
c_a.parent:setBG(d_a,_aa,daa:sub(dd+1,aaa+dd))
c_a.parent:setFG(d_a,_aa,_ba:sub(dd+1,aaa+dd))end end end,init=function(c_a)
c_a.parent:addEvent("mouse_click",c_a)c_a.parent:addEvent("mouse_scroll",c_a)
if
(ac.init(c_a))then c_a.bgColor=c_a.parent:getTheme("MenubarBG")
c_a.fgColor=c_a.parent:getTheme("MenubarText")_d=c_a.parent:getTheme("SelectionBG")
ad=c_a.parent:getTheme("SelectionText")end end}return setmetatable(cc,ac)end end
aa["objects"]["List"]=function(...)local ab=da("Object")local bb=da("utils")
local cb=bb.getValueFromXML
return
function(db)local _c=ab(db)local ac="List"_c.width=16;_c.height=6;_c:setZIndex(5)local bc={}
local cc;local dc;local _d=true;local ad="left"local bd=0;local cd=true
local dd={getType=function(__a)return ac end,addItem=function(__a,a_a,b_a,c_a,...)
table.insert(bc,{text=a_a,bgCol=b_a or __a.bgColor,fgCol=
c_a or __a.fgColor,args={...}})if(#bc==1)then __a:setValue(bc[1])end
__a:updateDraw()return __a end,setOffset=function(__a,a_a)
bd=a_a;__a:updateDraw()return __a end,getOffset=function(__a)return bd end,removeItem=function(__a,a_a)
table.remove(bc,a_a)__a:updateDraw()return __a end,getItem=function(__a,a_a)
return bc[a_a]end,getAll=function(__a)return bc end,getItemIndex=function(__a)local a_a=__a:getValue()for b_a,c_a in pairs(bc)do if
(c_a==a_a)then return b_a end end end,clear=function(__a)
bc={}__a:setValue({})__a:updateDraw()return __a end,getItemCount=function(__a)return
#bc end,editItem=function(__a,a_a,b_a,c_a,d_a,...)table.remove(bc,a_a)
table.insert(bc,a_a,{text=b_a,bgCol=c_a or __a.bgColor,fgCol=
d_a or __a.fgColor,args={...}})__a:updateDraw()return __a end,selectItem=function(__a,a_a)__a:setValue(
bc[a_a]or{})__a:updateDraw()return __a end,setSelectedItem=function(__a,a_a,b_a,c_a)cc=
a_a or __a.bgColor;dc=b_a or __a.fgColor;_d=c_a~=nil and c_a or
true;__a:updateDraw()return __a end,setScrollable=function(__a,a_a)
cd=a_a;if(a_a==nil)then cd=true end;__a:updateDraw()return __a end,setValuesByXMLData=function(__a,a_a)
_c.setValuesByXMLData(__a,a_a)if(cb("selectionBG",a_a)~=nil)then
cc=colors[cb("selectionBG",a_a)]end;if(cb("selectionFG",a_a)~=nil)then
dc=colors[cb("selectionFG",a_a)]end;if(cb("scrollable",a_a)~=nil)then
if
(cb("scrollable",a_a))then __a:setScrollable(true)else __a:setScrollable(false)end end;if(
cb("offset",a_a)~=nil)then bd=cb("offset",a_a)end
if(a_a["item"]~=
nil)then local b_a=a_a["item"]
if(b_a.properties~=nil)then b_a={b_a}end;for c_a,d_a in pairs(b_a)do
__a:addItem(cb("text",d_a),colors[cb("bg",d_a)],colors[cb("fg",d_a)])end end;return __a end,scrollHandler=function(__a,a_a,b_a,c_a)
if
(_c.scrollHandler(__a,a_a,b_a,c_a))then
if(cd)then local d_a,_aa=__a:getSize()bd=bd+a_a;if(bd<0)then bd=0 end
if(a_a>=1)then if(#bc>_aa)then if(bd>
#bc-_aa)then bd=#bc-_aa end;if(bd>=#bc)then bd=#bc-1 end else bd=
bd-1 end end;__a:updateDraw()end;return true end;return false end,mouseHandler=function(__a,a_a,b_a,c_a)
if
(_c.mouseHandler(__a,a_a,b_a,c_a))then
local d_a,_aa=__a:getAbsolutePosition(__a:getAnchorPosition())local aaa,baa=__a:getSize()
if(#bc>0)then for n=1,baa do
if(bc[n+bd]~=nil)then if(d_a<=b_a)and
(d_a+aaa>b_a)and(_aa+n-1 ==c_a)then
__a:setValue(bc[n+bd])__a:updateDraw()end end end end;return true end;return false end,dragHandler=function(__a,a_a,b_a,c_a)return
__a:mouseHandler(a_a,b_a,c_a)end,touchHandler=function(__a,a_a,b_a)return
__a:mouseHandler(1,a_a,b_a)end,draw=function(__a)
if(_c.draw(__a))then
if
(__a.parent~=nil)then local a_a,b_a=__a:getAnchorPosition()local c_a,d_a=__a:getSize()if(
__a.bgColor~=false)then
__a.parent:drawBackgroundBox(a_a,b_a,c_a,d_a,__a.bgColor)end
for n=1,d_a do
if(bc[n+bd]~=nil)then
if(bc[n+bd]==
__a:getValue())then
if(_d)then
__a.parent:writeText(a_a,b_a+n-1,bb.getTextHorizontalAlign(bc[n+bd].text,c_a,ad),cc,dc)else
__a.parent:writeText(a_a,b_a+n-1,bb.getTextHorizontalAlign(bc[n+bd].text,c_a,ad),bc[
n+bd].bgCol,bc[n+bd].fgCol)end else
__a.parent:writeText(a_a,b_a+n-1,bb.getTextHorizontalAlign(bc[n+bd].text,c_a,ad),bc[
n+bd].bgCol,bc[n+bd].fgCol)end end end end end end,init=function(__a)
__a.parent:addEvent("mouse_click",__a)__a.parent:addEvent("mouse_drag",__a)
__a.parent:addEvent("mouse_scroll",__a)
if(_c.init(__a))then __a.bgColor=__a.parent:getTheme("ListBG")
__a.fgColor=__a.parent:getTheme("ListText")cc=__a.parent:getTheme("SelectionBG")
dc=__a.parent:getTheme("SelectionText")end end}return setmetatable(dd,_c)end end
aa["objects"]["Program"]=function(...)local ab=da("Object")local bb=da("tHex")
local cb=da("process")local db=da("utils").getValueFromXML;local _c=string.sub
return
function(ac,bc)local cc=ab(ac)
local dc="Program"cc:setZIndex(5)local _d;local ad;local bd={}
local function cd(baa,caa,daa,_ba,aba)local bba,cba=1,1
local dba,_ca=colors.black,colors.white;local aca=false;local bca=false;local cca={}local dca={}local _da={}local ada={}local bda;local cda={}for i=0,15 do local abb=2 ^i
ada[abb]={bc:getBasaltInstance().getBaseTerm().getPaletteColour(abb)}end;local function dda()
bda=(" "):rep(daa)
for n=0,15 do local abb=2 ^n;local bbb=bb[abb]cda[abb]=bbb:rep(daa)end end
local function __b()dda()local abb=bda
local bbb=cda[colors.white]local cbb=cda[colors.black]
for n=1,_ba do
cca[n]=_c(cca[n]==nil and abb or cca[n]..abb:sub(1,
daa-cca[n]:len()),1,daa)
_da[n]=_c(_da[n]==nil and bbb or _da[n]..
bbb:sub(1,daa-_da[n]:len()),1,daa)
dca[n]=_c(dca[n]==nil and cbb or dca[n]..
cbb:sub(1,daa-dca[n]:len()),1,daa)end;cc.updateDraw(cc)end;__b()local function a_b()if
bba>=1 and cba>=1 and bba<=daa and cba<=_ba then else end end
local function b_b(abb,bbb,cbb)
local dbb=bba;local _cb=dbb+#abb-1
if cba>=1 and cba<=_ba then
if dbb<=daa and _cb>=1 then
if dbb==1 and _cb==
daa then cca[cba]=abb;_da[cba]=bbb;dca[cba]=cbb else local acb,bcb,ccb
if dbb<1 then local __c=
1 -dbb+1;local a_c=daa-dbb+1;acb=_c(abb,__c,a_c)
bcb=_c(bbb,__c,a_c)ccb=_c(cbb,__c,a_c)elseif _cb>daa then local __c=daa-dbb+1;acb=_c(abb,1,__c)
bcb=_c(bbb,1,__c)ccb=_c(cbb,1,__c)else acb=abb;bcb=bbb;ccb=cbb end;local dcb=cca[cba]local _db=_da[cba]local adb=dca[cba]local bdb,cdb,ddb
if dbb>1 then local __c=dbb-1;bdb=
_c(dcb,1,__c)..acb;cdb=_c(_db,1,__c)..bcb
ddb=_c(adb,1,__c)..ccb else bdb=acb;cdb=bcb;ddb=ccb end
if _cb<daa then local __c=_cb+1;bdb=bdb.._c(dcb,__c,daa)
cdb=cdb.._c(_db,__c,daa)ddb=ddb.._c(adb,__c,daa)end;cca[cba]=bdb;_da[cba]=cdb;dca[cba]=ddb end;_d:updateDraw()end;bba=_cb+1;if(bca)then a_b()end end end
local function c_b(abb,bbb,cbb)
if(cbb~=nil)then local dbb=cca[bbb]if(dbb~=nil)then
cca[bbb]=_c(dbb:sub(1,abb-1)..cbb..dbb:sub(abb+
(cbb:len()),daa),1,daa)end end;_d:updateDraw()end
local function d_b(abb,bbb,cbb)
if(cbb~=nil)then local dbb=dca[bbb]if(dbb~=nil)then
dca[bbb]=_c(dbb:sub(1,abb-1)..cbb..dbb:sub(abb+
(cbb:len()),daa),1,daa)end end;_d:updateDraw()end
local function _ab(abb,bbb,cbb)
if(cbb~=nil)then local dbb=_da[bbb]if(dbb~=nil)then
_da[bbb]=_c(dbb:sub(1,abb-1)..cbb..dbb:sub(abb+
(cbb:len()),daa),1,daa)end end;_d:updateDraw()end
local aab=function(abb)
if type(abb)~="number"then
error("bad argument #1 (expected number, got "..type(abb)..")",2)elseif bb[abb]==nil then
error("Invalid color (got "..abb..")",2)end;_ca=abb end
local bab=function(abb)
if type(abb)~="number"then
error("bad argument #1 (expected number, got "..type(abb)..")",2)elseif bb[abb]==nil then
error("Invalid color (got "..abb..")",2)end;dba=abb end
local cab=function(abb,bbb,cbb,dbb)if type(abb)~="number"then
error("bad argument #1 (expected number, got "..type(abb)..")",2)end
if bb[abb]==nil then error("Invalid color (got "..
abb..")",2)end;local _cb
if
type(bbb)=="number"and cbb==nil and dbb==nil then _cb={colours.rgb8(bbb)}ada[abb]=_cb else if
type(bbb)~="number"then
error("bad argument #2 (expected number, got "..type(bbb)..")",2)end;if type(cbb)~="number"then
error(
"bad argument #3 (expected number, got "..type(cbb)..")",2)end;if type(dbb)~="number"then
error(
"bad argument #4 (expected number, got "..type(dbb)..")",2)end;_cb=ada[abb]_cb[1]=bbb
_cb[2]=cbb;_cb[3]=dbb end end
local dab=function(abb)if type(abb)~="number"then
error("bad argument #1 (expected number, got "..type(abb)..")",2)end
if bb[abb]==nil then error("Invalid color (got "..
abb..")",2)end;local bbb=ada[abb]return bbb[1],bbb[2],bbb[3]end
local _bb={setCursorPos=function(abb,bbb)if type(abb)~="number"then
error("bad argument #1 (expected number, got "..type(abb)..")",2)end;if type(bbb)~="number"then
error(
"bad argument #2 (expected number, got "..type(bbb)..")",2)end;bba=math.floor(abb)
cba=math.floor(bbb)if(bca)then a_b()end end,getCursorPos=function()return
bba,cba end,setCursorBlink=function(abb)if type(abb)~="boolean"then
error("bad argument #1 (expected boolean, got "..
type(abb)..")",2)end;aca=abb end,getCursorBlink=function()return
aca end,getPaletteColor=dab,getPaletteColour=dab,setBackgroundColor=bab,setBackgroundColour=bab,setTextColor=aab,setTextColour=aab,setPaletteColor=cab,setPaletteColour=cab,getBackgroundColor=function()return dba end,getBackgroundColour=function()return dba end,getSize=function()
return daa,_ba end,getTextColor=function()return _ca end,getTextColour=function()return _ca end,basalt_resize=function(abb,bbb)daa,_ba=abb,bbb;__b()end,basalt_reposition=function(abb,bbb)
baa,caa=abb,bbb end,basalt_setVisible=function(abb)bca=abb end,drawBackgroundBox=function(abb,bbb,cbb,dbb,_cb)for n=1,dbb do
d_b(abb,bbb+ (n-1),bb[_cb]:rep(cbb))end end,drawForegroundBox=function(abb,bbb,cbb,dbb,_cb)
for n=1,dbb do _ab(abb,
bbb+ (n-1),bb[_cb]:rep(cbb))end end,drawTextBox=function(abb,bbb,cbb,dbb,_cb)for n=1,dbb do
c_b(abb,bbb+ (n-1),_cb:rep(cbb))end end,writeText=function(abb,bbb,cbb,dbb,_cb)
dbb=dbb or dba;_cb=_cb or _ca;c_b(baa,bbb,cbb)
d_b(abb,bbb,bb[dbb]:rep(cbb:len()))_ab(abb,bbb,bb[_cb]:rep(cbb:len()))end,basalt_update=function()
if(
bc~=nil)then for n=1,_ba do bc:setText(baa,caa+ (n-1),cca[n])bc:setBG(baa,caa+
(n-1),dca[n])
bc:setFG(baa,caa+ (n-1),_da[n])end end end,scroll=function(abb)if
type(abb)~="number"then
error("bad argument #1 (expected number, got "..type(abb)..")",2)end
if abb~=0 then local bbb=bda
local cbb=cda[_ca]local dbb=cda[dba]
for newY=1,_ba do local _cb=newY+abb
if _cb>=1 and _cb<=_ba then
cca[newY]=cca[_cb]dca[newY]=dca[_cb]_da[newY]=_da[_cb]else cca[newY]=bbb
_da[newY]=cbb;dca[newY]=dbb end end end;if(bca)then a_b()end end,isColor=function()return
bc:getBasaltInstance().getBaseTerm().isColor()end,isColour=function()return
bc:getBasaltInstance().getBaseTerm().isColor()end,write=function(abb)
abb=tostring(abb)if(bca)then
b_b(abb,bb[_ca]:rep(abb:len()),bb[dba]:rep(abb:len()))end end,clearLine=function()
if
(bca)then c_b(1,cba,(" "):rep(daa))
d_b(1,cba,bb[dba]:rep(daa))_ab(1,cba,bb[_ca]:rep(daa))end;if(bca)then a_b()end end,clear=function()
for n=1,_ba
do c_b(1,n,(" "):rep(daa))
d_b(1,n,bb[dba]:rep(daa))_ab(1,n,bb[_ca]:rep(daa))end;if(bca)then a_b()end end,blit=function(abb,bbb,cbb)if
type(abb)~="string"then
error("bad argument #1 (expected string, got "..type(abb)..")",2)end;if type(bbb)~="string"then
error(
"bad argument #2 (expected string, got "..type(bbb)..")",2)end;if type(cbb)~="string"then
error(
"bad argument #3 (expected string, got "..type(cbb)..")",2)end
if
#bbb~=#abb or#cbb~=#abb then error("Arguments must be the same length",2)end;if(bca)then b_b(abb,bbb,cbb)end end}return _bb end;cc.width=30;cc.height=12;local dd=cd(1,1,cc.width,cc.height)local __a
local a_a=false;local b_a={}
local function c_a(baa)local caa,daa=dd.getCursorPos()
local _ba,aba=baa:getAnchorPosition()local bba,cba=baa:getSize()
if(_ba+caa-1 >=1 and
_ba+caa-1 <=_ba+bba-1 and daa+aba-1 >=1 and
daa+aba-1 <=aba+cba-1)then
baa.parent:setCursor(
baa:isFocused()and dd.getCursorBlink(),_ba+caa-1,daa+aba-1,dd.getTextColor())end end
local function d_a(baa,caa,...)local daa,_ba=__a:resume(caa,...)
if(daa==false)and(_ba~=nil)and
(_ba~="Terminated")then
local aba=baa:sendEvent("program_error",_ba)
if(aba~=false)then error("Basalt Program - ".._ba)end end
if(__a:getStatus()=="dead")then baa:sendEvent("program_done")end end
local function _aa(baa,caa,daa,_ba,aba)if(__a==nil)then return false end
if not(__a:isDead())then if not(a_a)then
local bba,cba=baa:getAbsolutePosition(baa:getAnchorPosition(
nil,nil,true))d_a(baa,caa,daa,_ba-bba+1,aba-cba+1)
c_a(baa)end end end
local function aaa(baa,caa,daa,_ba)if(__a==nil)then return false end
if not(__a:isDead())then if not(a_a)then if(baa.draw)then
d_a(baa,caa,daa,_ba)c_a(baa)end end end end
_d={getType=function(baa)return dc end,show=function(baa)cc.show(baa)
dd.setBackgroundColor(baa.bgColor)dd.setTextColor(baa.fgColor)
dd.basalt_setVisible(true)return baa end,hide=function(baa)
cc.hide(baa)dd.basalt_setVisible(false)return baa end,setPosition=function(baa,caa,daa,_ba)
cc.setPosition(baa,caa,daa,_ba)
dd.basalt_reposition(baa:getAnchorPosition())return baa end,setValuesByXMLData=function(baa,caa)
cc.setValuesByXMLData(baa,caa)if(db("path",caa)~=nil)then ad=db("path",caa)end
if(
db("execute",caa)~=nil)then if(db("execute",caa))then
if(ad~=nil)then baa:execute(ad)end end end end,getBasaltWindow=function()return
dd end,getBasaltProcess=function()return __a end,setSize=function(baa,caa,daa,_ba)cc.setSize(baa,caa,daa,_ba)
dd.basalt_resize(baa:getWidth(),baa:getHeight())return baa end,getStatus=function(baa)if(__a~=nil)then return
__a:getStatus()end;return"inactive"end,setEnviroment=function(baa,caa)bd=
caa or{}return baa end,execute=function(baa,caa,...)ad=caa or ad
__a=cb:new(ad,dd,bd,...)dd.setBackgroundColor(colors.black)
dd.setTextColor(colors.white)dd.clear()dd.setCursorPos(1,1)
dd.setBackgroundColor(baa.bgColor)dd.setTextColor(baa.fgColor)
dd.basalt_setVisible(true)a_a=false
if(baa.parent~=nil)then
baa.parent:addEvent("mouse_click",baa)baa.parent:addEvent("mouse_up",baa)
baa.parent:addEvent("mouse_drag",baa)baa.parent:addEvent("mouse_scroll",baa)
baa.parent:addEvent("key",baa)baa.parent:addEvent("key_up",baa)
baa.parent:addEvent("char",baa)baa.parent:addEvent("other_event",baa)end;return baa end,stop=function(baa)
if(
__a~=nil)then
if not(__a:isDead())then d_a(baa,"terminate")if(__a:isDead())then
if(
baa.parent~=nil)then baa.parent:setCursor(false)end end end end;baa.parent:removeEvents(baa)return baa end,pause=function(baa,caa)a_a=
caa or(not a_a)
if(__a~=nil)then if not(__a:isDead())then if not(a_a)then
baa:injectEvents(b_a)b_a={}end end end;return baa end,isPaused=function(baa)return
a_a end,injectEvent=function(baa,caa,daa,_ba,aba,bba,cba)
if(__a~=nil)then
if not(__a:isDead())then if(a_a==false)or(cba)then
d_a(baa,caa,daa,_ba,aba,bba)else
table.insert(b_a,{event=caa,args={daa,_ba,aba,bba}})end end end;return baa end,getQueuedEvents=function(baa)return
b_a end,updateQueuedEvents=function(baa,caa)b_a=caa or b_a;return baa end,injectEvents=function(baa,caa)if(__a~=nil)then
if not
(__a:isDead())then for daa,_ba in pairs(caa)do
d_a(baa,_ba.event,table.unpack(_ba.args))end end end;return baa end,mouseHandler=function(baa,caa,daa,_ba)
if
(cc.mouseHandler(baa,caa,daa,_ba))then _aa(baa,"mouse_click",caa,daa,_ba)return true end;return false end,mouseUpHandler=function(baa,caa,daa,_ba)
if
(cc.mouseUpHandler(baa,caa,daa,_ba))then _aa(baa,"mouse_up",caa,daa,_ba)return true end;return false end,scrollHandler=function(baa,caa,daa,_ba)
if
(cc.scrollHandler(baa,caa,daa,_ba))then _aa(baa,"mouse_scroll",caa,daa,_ba)return true end;return false end,dragHandler=function(baa,caa,daa,_ba)
if
(cc.dragHandler(baa,caa,daa,_ba))then _aa(baa,"mouse_drag",caa,daa,_ba)return true end;return false end,keyHandler=function(baa,caa,daa)if
(cc.keyHandler(baa,caa,daa))then aaa(baa,"key",caa,daa)return true end;return
false end,keyUpHandler=function(baa,caa)if
(cc.keyUpHandler(baa,caa))then aaa(baa,"key_up",caa)return true end
return false end,charHandler=function(baa,caa)if
(cc.charHandler(baa,caa))then aaa(baa,"char",caa)return true end
return false end,getFocusHandler=function(baa)
cc.getFocusHandler(baa)
if(__a~=nil)then
if not(__a:isDead())then
if not(a_a)then
if(baa.parent~=nil)then
local caa,daa=dd.getCursorPos()local _ba,aba=baa:getAnchorPosition()local bba,cba=baa:getSize()
if
(
_ba+caa-1 >=1 and _ba+caa-1 <=_ba+bba-1 and
daa+aba-1 >=1 and daa+aba-1 <=aba+cba-1)then
baa.parent:setCursor(dd.getCursorBlink(),_ba+caa-1,daa+aba-1,dd.getTextColor())end end end end end end,loseFocusHandler=function(baa)
cc.loseFocusHandler(baa)
if(__a~=nil)then if not(__a:isDead())then if(baa.parent~=nil)then
baa.parent:setCursor(false)end end end end,eventHandler=function(baa,caa,daa,_ba,aba,bba)
if
(cc.eventHandler(baa,caa,daa,_ba,aba,bba))then if(__a==nil)then return end
if(caa=="dynamicValueEvent")then local cba,dba=dd.getSize()
local _ca,aca=baa:getSize()
if(cba~=_ca)or(dba~=aca)then dd.basalt_resize(_ca,aca)if not
(__a:isDead())then d_a(baa,"term_resize")end end
dd.basalt_reposition(baa:getAnchorPosition())end
if not(__a:isDead())then
if not(a_a)then if(caa~="terminate")then
d_a(baa,caa,daa,_ba,aba,bba)end
if(baa:isFocused())then
local cba,dba=baa:getAnchorPosition()local _ca,aca=dd.getCursorPos()
if(baa.parent~=nil)then
local bca,cca=baa:getSize()
if
(cba+_ca-1 >=1 and cba+_ca-1 <=cba+bca-1 and
aca+dba-1 >=1 and aca+dba-1 <=dba+cca-1)then
baa.parent:setCursor(dd.getCursorBlink(),cba+_ca-1,aca+dba-1,dd.getTextColor())end end;if(caa=="terminate")then d_a(baa,caa)
baa.parent:setCursor(false)return true end end else
table.insert(b_a,{event=caa,args={daa,_ba,aba,bba}})end end;return false end end,draw=function(baa)
if
(cc.draw(baa))then
if(baa.parent~=nil)then local caa,daa=baa:getAnchorPosition()
local _ba,aba=dd.getCursorPos()local bba,cba=baa:getSize()dd.basalt_reposition(caa,daa)
dd.basalt_update()
if
(caa+_ba-1 >=1 and caa+_ba-1 <=caa+bba-1 and
aba+daa-1 >=1 and aba+daa-1 <=daa+cba-1)then
baa.parent:setCursor(baa:isFocused()and dd.getCursorBlink(),
caa+_ba-1,aba+daa-1,dd.getTextColor())end end end end,onError=function(baa,...)
for caa,daa in
pairs(table.pack(...))do if(type(daa)=="function")then
baa:registerEvent("program_error",daa)end end;if(baa.parent~=nil)then
baa.parent:addEvent("other_event",baa)end;return baa end,onDone=function(baa,...)
for caa,daa in
pairs(table.pack(...))do if(type(daa)=="function")then
baa:registerEvent("program_done",daa)end end;if(baa.parent~=nil)then
baa.parent:addEvent("other_event",baa)end;return baa end,init=function(baa)
if
(cc.init(baa))then baa.bgColor=baa.parent:getTheme("ProgramBG")end end}return setmetatable(_d,cc)end end
aa["objects"]["Label"]=function(...)local ab=da("Object")local bb=da("utils")
local cb=bb.getValueFromXML;local db=bb.createText;local _c=da("tHex")local ac=da("bigfont")
return
function(bc)local cc=ab(bc)
local dc="Label"cc:setZIndex(3)local _d=true;cc:setValue("Label")cc.width=5
local ad="left"local bd="top"local cd=0;local dd,__a=false,false
local a_a={getType=function(b_a)return dc end,setText=function(b_a,c_a)c_a=tostring(c_a)
cc:setValue(c_a)
if(_d)then
if
(c_a:len()+b_a:getX()>b_a.parent:getWidth())then local d_a=b_a.parent:getWidth()-b_a:getX()cc.setSize(b_a,d_a,
#db(c_a,d_a))else
cc.setSize(b_a,c_a:len(),1)end end;b_a:updateDraw()return b_a end,setBackground=function(b_a,c_a)
cc.setBackground(b_a,c_a)__a=true;b_a:updateDraw()return b_a end,setForeground=function(b_a,c_a)
cc.setForeground(b_a,c_a)dd=true;b_a:updateDraw()return b_a end,setTextAlign=function(b_a,c_a,d_a)ad=
c_a or ad;bd=d_a or bd;b_a:updateDraw()return b_a end,setFontSize=function(b_a,c_a)if(
c_a>0)and(c_a<=4)then cd=c_a-1 or 0 end
b_a:updateDraw()return b_a end,getFontSize=function(b_a)return cd+1 end,setValuesByXMLData=function(b_a,c_a)
cc.setValuesByXMLData(b_a,c_a)
if(cb("text",c_a)~=nil)then b_a:setText(cb("text",c_a))end
if(cb("verticalAlign",c_a)~=nil)then bd=cb("verticalAlign",c_a)end;if(cb("horizontalAlign",c_a)~=nil)then
ad=cb("horizontalAlign",c_a)end;if(cb("font",c_a)~=nil)then
b_a:setFontSize(cb("font",c_a))end;return b_a end,setSize=function(b_a,c_a,d_a,_aa)
cc.setSize(b_a,c_a,d_a,_aa)_d=false;b_a:updateDraw()return b_a end,eventHandler=function(b_a,c_a)
if(
c_a=="basalt_resize")then
if(_d)then local d_a=b_a:getValue()
if(
d_a:len()+b_a:getX()>b_a.parent:getWidth())then local _aa=
b_a.parent:getWidth()-b_a:getX()
cc.setSize(b_a,_aa,#db(d_a,_aa))else cc.setSize(b_a,d_a:len(),1)end else end end end,draw=function(b_a)
if
(cc.draw(b_a))then
if(b_a.parent~=nil)then local c_a,d_a=b_a:getAnchorPosition()
local _aa,aaa=b_a:getSize()local baa=bb.getTextVerticalAlign(aaa,bd)
if(cd==0)then
if not(_d)then
local caa=db(b_a:getValue(),b_a:getWidth())
for daa,_ba in pairs(caa)do if(daa<=aaa)then
b_a.parent:writeText(c_a,d_a+daa-1,_ba,b_a.bgColor,b_a.fgColor)end end else
if
(#b_a:getValue()+c_a>b_a.parent:getWidth())then local caa=db(b_a:getValue(),b_a:getWidth())
for daa,_ba in
pairs(caa)do if(daa<=aaa)then
b_a.parent:writeText(c_a,d_a+daa-1,_ba,b_a.bgColor,b_a.fgColor)end end else
b_a.parent:writeText(c_a,d_a,b_a:getValue(),b_a.bgColor,b_a.fgColor)end end else
local caa=ac(cd,b_a:getValue(),b_a.fgColor,b_a.bgColor or colors.lightGray)
if(_d)then b_a:setSize(#caa[1][1],#caa[1]-1)end;local daa,_ba=b_a.parent:getSize()
local aba,bba=#caa[1][1],#caa[1]
c_a=c_a or math.floor((daa-aba)/2)+1
d_a=d_a or math.floor((_ba-bba)/2)+1
for i=1,bba do
b_a.parent:setFG(c_a,d_a+i-1,caa[2][i])b_a.parent:setBG(c_a,d_a+i-1,caa[3][i])b_a.parent:setText(c_a,
d_a+i-1,caa[1][i])end end end end end,init=function(b_a)
b_a.parent:addEvent("other_event",b_a)
if(cc.init(b_a))then
b_a.bgColor=b_a.parent:getTheme("LabelBG")b_a.fgColor=b_a.parent:getTheme("LabelText")
if
(
b_a.parent.bgColor==colors.black)and(b_a.fgColor==colors.black)then b_a.fgColor=colors.lightGray end end end}return setmetatable(a_a,cc)end end
aa["objects"]["Progressbar"]=function(...)local ab=da("Object")
local bb=da("utils").getValueFromXML
return
function(cb)local db=ab(cb)local _c="Progressbar"local ac=0;db:setZIndex(5)
db:setValue(false)db.width=25;db.height=1;local bc;local cc=""local dc=colors.white;local _d=""local ad=0
local bd={init=function(cd)
if
(db.init(cd))then cd.bgColor=cd.parent:getTheme("ProgressbarBG")
cd.fgColor=cd.parent:getTheme("ProgressbarText")bc=cd.parent:getTheme("ProgressbarActiveBG")end end,getType=function(cd)return
_c end,setValuesByXMLData=function(cd,dd)db.setValuesByXMLData(cd,dd)if(bb("direction",dd)~=
nil)then ad=bb("direction",dd)end
if(
bb("progressColor",dd)~=nil)then bc=colors[bb("progressColor",dd)]end
if(bb("progressSymbol",dd)~=nil)then cc=bb("progressSymbol",dd)end;if(bb("backgroundSymbol",dd)~=nil)then
_d=bb("backgroundSymbol",dd)end
if
(bb("progressSymbolColor",dd)~=nil)then dc=colors[bb("progressSymbolColor",dd)]end;if(bb("onDone",dd)~=nil)then
cd:generateXMLEventFunction(cd.onProgressDone,bb("onDone",dd))end;return cd end,setDirection=function(cd,dd)
ad=dd;cd:updateDraw()return cd end,setProgressBar=function(cd,dd,__a,a_a)bc=dd or bc
cc=__a or cc;dc=a_a or dc;cd:updateDraw()return cd end,setBackgroundSymbol=function(cd,dd)
_d=dd:sub(1,1)cd:updateDraw()return cd end,setProgress=function(cd,dd)if
(dd>=0)and(dd<=100)and(ac~=dd)then ac=dd;cd:setValue(ac)if(ac==100)then
cd:progressDoneHandler()end end
cd:updateDraw()return cd end,getProgress=function(cd)return
ac end,onProgressDone=function(cd,dd)cd:registerEvent("progress_done",dd)
return cd end,progressDoneHandler=function(cd)
cd:sendEvent("progress_done",cd)end,draw=function(cd)
if(db.draw(cd))then
if(cd.parent~=nil)then
local dd,__a=cd:getAnchorPosition()local a_a,b_a=cd:getSize()if(cd.bgColor~=false)then
cd.parent:drawBackgroundBox(dd,__a,a_a,b_a,cd.bgColor)end;if(_d~="")then
cd.parent:drawTextBox(dd,__a,a_a,b_a,_d)end;if(cd.fgColor~=false)then
cd.parent:drawForegroundBox(dd,__a,a_a,b_a,cd.fgColor)end
if(ad==1)then cd.parent:drawBackgroundBox(dd,__a,a_a,
b_a/100 *ac,bc)cd.parent:drawForegroundBox(dd,__a,a_a,
b_a/100 *ac,dc)cd.parent:drawTextBox(dd,__a,a_a,
b_a/100 *ac,cc)elseif(ad==2)then
cd.parent:drawBackgroundBox(dd,
__a+math.ceil(b_a-b_a/100 *ac),a_a,b_a/100 *ac,bc)
cd.parent:drawForegroundBox(dd,__a+math.ceil(b_a-b_a/100 *ac),a_a,
b_a/100 *ac,dc)
cd.parent:drawTextBox(dd,__a+math.ceil(b_a-b_a/100 *ac),a_a,
b_a/100 *ac,cc)elseif(ad==3)then
cd.parent:drawBackgroundBox(dd+math.ceil(a_a-a_a/100 *ac),__a,
a_a/100 *ac,b_a,bc)
cd.parent:drawForegroundBox(dd+math.ceil(a_a-a_a/100 *ac),__a,
a_a/100 *ac,b_a,dc)
cd.parent:drawTextBox(dd+math.ceil(a_a-a_a/100 *ac),__a,
a_a/100 *ac,b_a,cc)else
cd.parent:drawBackgroundBox(dd,__a,a_a/100 *ac,b_a,bc)
cd.parent:drawForegroundBox(dd,__a,a_a/100 *ac,b_a,dc)
cd.parent:drawTextBox(dd,__a,a_a/100 *ac,b_a,cc)end end end end}return setmetatable(bd,db)end end
aa["objects"]["Radio"]=function(...)local ab=da("Object")local bb=da("utils")
local cb=bb.getValueFromXML
return
function(db)local _c=ab(db)local ac="Radio"_c.width=8;_c:setZIndex(5)local bc={}local cc;local dc
local _d;local ad;local bd;local cd;local dd=true;local __a="\7"local a_a="left"
local b_a={getType=function(c_a)return ac end,setValuesByXMLData=function(c_a,d_a)
_c.setValuesByXMLData(c_a,d_a)if(cb("selectionBG",d_a)~=nil)then
cc=colors[cb("selectionBG",d_a)]end;if(cb("selectionFG",d_a)~=nil)then
dc=colors[cb("selectionFG",d_a)]end;if(cb("boxBG",d_a)~=nil)then
_d=colors[cb("boxBG",d_a)]end;if(cb("inactiveBoxBG",d_a)~=nil)then
bd=colors[cb("inactiveBoxBG",d_a)]end;if(cb("inactiveBoxFG",d_a)~=nil)then
cd=colors[cb("inactiveBoxFG",d_a)]end;if(cb("boxFG",d_a)~=nil)then
ad=colors[cb("boxFG",d_a)]end;if(cb("symbol",d_a)~=nil)then
__a=cb("symbol",d_a)end
if(d_a["item"]~=nil)then local _aa=d_a["item"]if(
_aa.properties~=nil)then _aa={_aa}end;for aaa,baa in pairs(_aa)do
c_a:addItem(cb("text",baa),cb("x",baa),cb("y",baa),colors[cb("bg",baa)],colors[cb("fg",baa)])end end;return c_a end,addItem=function(c_a,d_a,_aa,aaa,baa,caa,...)
table.insert(bc,{x=
_aa or 1,y=aaa or 1,text=d_a,bgCol=baa or c_a.bgColor,fgCol=caa or c_a.fgColor,args={...}})if(#bc==1)then c_a:setValue(bc[1])end
c_a:updateDraw()return c_a end,getAll=function(c_a)return
bc end,removeItem=function(c_a,d_a)table.remove(bc,d_a)c_a:updateDraw()
return c_a end,getItem=function(c_a,d_a)return bc[d_a]end,getItemIndex=function(c_a)
local d_a=c_a:getValue()for _aa,aaa in pairs(bc)do if(aaa==d_a)then return _aa end end end,clear=function(c_a)
bc={}c_a:setValue({})c_a:updateDraw()return c_a end,getItemCount=function(c_a)return
#bc end,editItem=function(c_a,d_a,_aa,aaa,baa,caa,daa,...)table.remove(bc,d_a)
table.insert(bc,d_a,{x=aaa or 1,y=baa or 1,text=_aa,bgCol=
caa or c_a.bgColor,fgCol=daa or c_a.fgColor,args={...}})c_a:updateDraw()return c_a end,selectItem=function(c_a,d_a)c_a:setValue(
bc[d_a]or{})c_a:updateDraw()return c_a end,setActiveSymbol=function(c_a,d_a)
__a=d_a:sub(1,1)c_a:updateDraw()return c_a end,setSelectedItem=function(c_a,d_a,_aa,aaa,baa,caa)
cc=d_a or cc;dc=_aa or dc;_d=aaa or _d;ad=baa or ad
dd=caa~=nil and caa or true;c_a:updateDraw()return c_a end,mouseHandler=function(c_a,d_a,_aa,aaa)
if(
#bc>0)then
local baa,caa=c_a:getAbsolutePosition(c_a:getAnchorPosition())
for daa,_ba in pairs(bc)do
if(baa+_ba.x-1 <=_aa)and(
baa+_ba.x-1 +_ba.text:len()+1 >=_aa)and(
caa+_ba.y-1 ==aaa)then
c_a:setValue(_ba)
local aba=c_a:getEventSystem():sendEvent("mouse_click",c_a,"mouse_click",d_a,_aa,aaa)if(aba==false)then return aba end;if(c_a.parent~=nil)then
c_a.parent:setFocusedObject(c_a)end;c_a:updateDraw()return true end end end;return false end,draw=function(c_a)
if(
c_a.parent~=nil)then local d_a,_aa=c_a:getAnchorPosition()
for aaa,baa in pairs(bc)do
if(baa==
c_a:getValue())then if(a_a=="left")then
c_a.parent:writeText(baa.x+d_a-1,baa.y+_aa-1,__a,_d,ad)
c_a.parent:writeText(baa.x+2 +d_a-1,baa.y+_aa-1,baa.text,cc,dc)end else
c_a.parent:drawBackgroundBox(
baa.x+d_a-1,baa.y+_aa-1,1,1,bd or c_a.bgColor)
c_a.parent:writeText(baa.x+2 +d_a-1,baa.y+_aa-1,baa.text,baa.bgCol,baa.fgCol)end end;return true end end,init=function(c_a)
c_a.parent:addEvent("mouse_click",c_a)
if(_c.init(c_a))then
c_a.bgColor=c_a.parent:getTheme("MenubarBG")c_a.fgColor=c_a.parent:getTheme("MenubarFG")
cc=c_a.parent:getTheme("SelectionBG")dc=c_a.parent:getTheme("SelectionText")
_d=c_a.parent:getTheme("MenubarBG")ad=c_a.parent:getTheme("MenubarText")end end}return setmetatable(b_a,_c)end end
aa["objects"]["Scrollbar"]=function(...)local ab=da("Object")
local bb=da("utils").getValueFromXML
return
function(cb)local db=ab(cb)local _c="Scrollbar"db.width=1;db.height=8;db:setValue(1)
db:setZIndex(2)local ac="vertical"local bc=" "local cc;local dc="\127"local _d=db.height;local ad=1;local bd=1
local function cd(__a,a_a,b_a,c_a)
local d_a,_aa=__a:getAbsolutePosition(__a:getAnchorPosition())local aaa,baa=__a:getSize()
if(ac=="horizontal")then
for _index=0,aaa do
if
(d_a+_index==b_a)and(_aa<=c_a)and(_aa+baa>c_a)then
ad=math.min(_index+1,aaa- (bd-1))__a:setValue(_d/aaa* (ad))__a:updateDraw()end end end
if(ac=="vertical")then
for _index=0,baa do
if
(_aa+_index==c_a)and(d_a<=b_a)and(d_a+aaa>b_a)then ad=math.min(_index+1,baa- (bd-1))
__a:setValue(_d/baa* (ad))__a:updateDraw()end end end end
local dd={getType=function(__a)return _c end,setSymbol=function(__a,a_a)bc=a_a:sub(1,1)__a:updateDraw()return __a end,setValuesByXMLData=function(__a,a_a)
db.setValuesByXMLData(__a,a_a)
if(bb("maxValue",a_a)~=nil)then _d=bb("maxValue",a_a)end;if(bb("backgroundSymbol",a_a)~=nil)then
dc=bb("backgroundSymbol",a_a):sub(1,1)end;if(bb("symbol",a_a)~=nil)then
bc=bb("symbol",a_a):sub(1,1)end;if(bb("barType",a_a)~=nil)then
ac=bb("barType",a_a):lower()end;if(bb("symbolSize",a_a)~=nil)then
__a:setSymbolSize(bb("symbolSize",a_a))end;if(bb("symbolColor",a_a)~=nil)then
cc=colors[bb("symbolColor",a_a)]end;if(bb("index",a_a)~=nil)then
__a:setIndex(bb("index",a_a))end end,setIndex=function(__a,a_a)
ad=a_a;if(ad<1)then ad=1 end;local b_a,c_a=__a:getSize()
ad=math.min(ad,(
ac=="vertical"and c_a or b_a)- (bd-1))
__a:setValue(_d/ (ac=="vertical"and c_a or b_a)*ad)__a:updateDraw()return __a end,getIndex=function(__a)return
ad end,setSymbolSize=function(__a,a_a)bd=tonumber(a_a)or 1
local b_a,c_a=__a:getSize()
if(ac=="vertical")then
__a:setValue(ad-1 * (_d/ (c_a- (bd-1)))- (_d/ (c_a-
(bd-1))))elseif(ac=="horizontal")then
__a:setValue(ad-1 * (_d/ (b_a- (bd-1)))- (_d/ (b_a- (
bd-1))))end;__a:updateDraw()return __a end,setMaxValue=function(__a,a_a)
_d=a_a;__a:updateDraw()return __a end,setBackgroundSymbol=function(__a,a_a)
dc=string.sub(a_a,1,1)__a:updateDraw()return __a end,setSymbolColor=function(__a,a_a)cc=a_a
__a:updateDraw()return __a end,setBarType=function(__a,a_a)ac=a_a:lower()
__a:updateDraw()return __a end,mouseHandler=function(__a,a_a,b_a,c_a)if(db.mouseHandler(__a,a_a,b_a,c_a))then
cd(__a,a_a,b_a,c_a)return true end;return false end,dragHandler=function(__a,a_a,b_a,c_a)if
(db.dragHandler(__a,a_a,b_a,c_a))then cd(__a,a_a,b_a,c_a)return true end
return false end,scrollHandler=function(__a,a_a,b_a,c_a)
if
(db.scrollHandler(__a,a_a,b_a,c_a))then local d_a,_aa=__a:getSize()ad=ad+a_a;if(ad<1)then ad=1 end
ad=math.min(ad,(
ac=="vertical"and _aa or d_a)- (bd-1))
__a:setValue(_d/ (ac=="vertical"and _aa or d_a)*ad)__a:updateDraw()end end,draw=function(__a)
if
(db.draw(__a))then
if(__a.parent~=nil)then local a_a,b_a=__a:getAnchorPosition()
local c_a,d_a=__a:getSize()
if(ac=="horizontal")then
__a.parent:writeText(a_a,b_a,dc:rep(ad-1),__a.bgColor,__a.fgColor)
__a.parent:writeText(a_a+ad-1,b_a,bc:rep(bd),cc,cc)
__a.parent:writeText(a_a+ad+bd-1,b_a,dc:rep(c_a- (ad+bd-1)),__a.bgColor,__a.fgColor)end
if(ac=="vertical")then
for n=0,d_a-1 do
if(ad==n+1)then
for curIndexOffset=0,math.min(bd-1,d_a)do __a.parent:writeText(a_a,b_a+n+
curIndexOffset,bc,cc,cc)end else if(n+1 <ad)or(n+1 >ad-1 +bd)then
__a.parent:writeText(a_a,b_a+n,dc,__a.bgColor,__a.fgColor)end end end end end end end,init=function(__a)
__a.parent:addEvent("mouse_click",__a)__a.parent:addEvent("mouse_drag",__a)
__a.parent:addEvent("mouse_scroll",__a)
if(db.init(__a))then
__a.bgColor=__a.parent:getTheme("ScrollbarBG")__a.fgColor=__a.parent:getTheme("ScrollbarText")
cc=__a.parent:getTheme("ScrollbarSymbolColor")end end}return setmetatable(dd,db)end end
aa["objects"]["Textfield"]=function(...)local ab=da("Object")local bb=da("tHex")
local cb=da("basaltLogs")local db=da("utils").getValueFromXML;local _c=string.rep
return
function(ac)local bc=ab(ac)
local cc="Textfield"local dc,_d,ad,bd=1,1,1,1;local cd={""}local dd={""}local __a={""}local a_a={}local b_a={}bc.width=30
bc.height=12;bc:setZIndex(5)
local function c_a(baa,caa)local daa={}
if(baa:len()>0)then
for _ba in string.gmatch(baa,caa)do
local aba,bba=string.find(baa,_ba)
if(aba~=nil)and(bba~=nil)then table.insert(daa,aba)
table.insert(daa,bba)local cba=string.sub(baa,1,(aba-1))
local dba=string.sub(baa,bba+1,baa:len())
baa=cba.. (":"):rep(_ba:len())..dba end end end;return daa end
local function d_a(baa,caa)caa=caa or bd
local daa=bb[baa.fgColor]:rep(__a[caa]:len())
local _ba=bb[baa.bgColor]:rep(dd[caa]:len())
for aba,bba in pairs(b_a)do local cba=c_a(cd[caa],bba[1])
if(#cba>0)then
for x=1,#cba/2 do local dba=x*2 -1;if(
bba[2]~=nil)then
daa=daa:sub(1,cba[dba]-1)..bb[bba[2]]:rep(cba[dba+1]-
(cba[dba]-1))..
daa:sub(cba[dba+1]+1,daa:len())end;if
(bba[3]~=nil)then
_ba=_ba:sub(1,cba[dba]-1)..

bb[bba[3]]:rep(cba[dba+1]- (cba[dba]-1)).._ba:sub(cba[dba+1]+1,_ba:len())end end end end
for aba,bba in pairs(a_a)do
for cba,dba in pairs(bba)do local _ca=c_a(cd[caa],dba)
if(#_ca>0)then for x=1,#_ca/2 do
local aca=x*2 -1
daa=daa:sub(1,_ca[aca]-1)..

bb[aba]:rep(_ca[aca+1]- (_ca[aca]-1))..daa:sub(_ca[aca+1]+1,daa:len())end end end end;__a[caa]=daa;dd[caa]=_ba;baa:updateDraw()end;local function _aa(baa)for n=1,#cd do d_a(baa,n)end end
local aaa={getType=function(baa)return cc end,setBackground=function(baa,caa)
bc.setBackground(baa,caa)_aa(baa)return baa end,setForeground=function(baa,caa)
bc.setForeground(baa,caa)_aa(baa)return baa end,setValuesByXMLData=function(baa,caa)
bc.setValuesByXMLData(baa,caa)
if(caa["lines"]~=nil)then local daa=caa["lines"]["line"]if
(daa.properties~=nil)then daa={daa}end;for _ba,aba in pairs(daa)do
baa:addLine(aba:value())end end
if(caa["keywords"]~=nil)then
for daa,_ba in pairs(caa["keywords"])do
if(colors[daa]~=nil)then
local aba=_ba;if(aba.properties~=nil)then aba={aba}end;local bba={}
for cba,dba in pairs(aba)do
local _ca=dba["keyword"]if(dba["keyword"].properties~=nil)then
_ca={dba["keyword"]}end;for aca,bca in pairs(_ca)do
table.insert(bba,bca:value())end end;baa:addKeywords(colors[daa],bba)end end end
if(caa["rules"]~=nil)then
if(caa["rules"]["rule"]~=nil)then
local daa=caa["rules"]["rule"]if(caa["rules"]["rule"].properties~=nil)then
daa={caa["rules"]["rule"]}end
for _ba,aba in pairs(daa)do if(db("pattern",aba)~=nil)then
baa:addRule(db("pattern",aba),colors[db("fg",aba)],colors[db("bg",aba)])end end end end end,getLines=function(baa)return
cd end,getLine=function(baa,caa)return cd[caa]end,editLine=function(baa,caa,daa)
cd[caa]=daa or cd[caa]d_a(baa,caa)baa:updateDraw()return baa end,clear=function(baa)
cd={""}dd={""}__a={""}dc,_d,ad,bd=1,1,1,1;baa:updateDraw()return baa end,addLine=function(baa,caa,daa)
if(
caa~=nil)then if(#cd==1)and(cd[1]=="")then cd[1]=caa
dd[1]=bb[baa.bgColor]:rep(caa:len())__a[1]=bb[baa.fgColor]:rep(caa:len())
d_a(baa,1)return baa end
if(
daa~=nil)then table.insert(cd,daa,caa)
table.insert(dd,daa,bb[baa.bgColor]:rep(caa:len()))
table.insert(__a,daa,bb[baa.fgColor]:rep(caa:len()))else table.insert(cd,caa)
table.insert(dd,bb[baa.bgColor]:rep(caa:len()))
table.insert(__a,bb[baa.fgColor]:rep(caa:len()))end end;d_a(baa,daa or#cd)baa:updateDraw()return baa end,addKeywords=function(baa,caa,daa)if(
a_a[caa]==nil)then a_a[caa]={}end;for _ba,aba in pairs(daa)do
table.insert(a_a[caa],aba)end;baa:updateDraw()return baa end,addRule=function(baa,caa,daa,_ba)
table.insert(b_a,{caa,daa,_ba})baa:updateDraw()return baa end,editRule=function(baa,caa,daa,_ba)for aba,bba in
pairs(b_a)do
if(bba[1]==caa)then b_a[aba][2]=daa;b_a[aba][3]=_ba end end;baa:updateDraw()return baa end,removeRule=function(baa,caa)
for daa,_ba in
pairs(b_a)do if(_ba[1]==caa)then table.remove(b_a,daa)end end;baa:updateDraw()return baa end,setKeywords=function(baa,caa,daa)
a_a[caa]=daa;baa:updateDraw()return baa end,removeLine=function(baa,caa)table.remove(cd,caa or#
cd)
if(#cd<=0)then table.insert(cd,"")end;baa:updateDraw()return baa end,getTextCursor=function(baa)return
ad,bd end,getFocusHandler=function(baa)bc.getFocusHandler(baa)
if(baa.parent~=nil)then
local caa,daa=baa:getAnchorPosition()if(baa.parent~=nil)then
baa.parent:setCursor(true,caa+ad-_d,daa+bd-dc,baa.fgColor)end end end,loseFocusHandler=function(baa)
bc.loseFocusHandler(baa)
if(baa.parent~=nil)then baa.parent:setCursor(false)end end,keyHandler=function(baa,caa)
if
(bc.keyHandler(baa,event,caa))then local daa,_ba=baa:getAnchorPosition()local aba,bba=baa:getSize()
if(caa==
keys.backspace)then
if(cd[bd]=="")then
if(bd>1)then table.remove(cd,bd)
table.remove(__a,bd)table.remove(dd,bd)ad=cd[bd-1]:len()+1;_d=
ad-aba+1;if(_d<1)then _d=1 end;bd=bd-1 end elseif(ad<=1)then
if(bd>1)then ad=cd[bd-1]:len()+1;_d=ad-aba+1
if(_d<1)then _d=1 end;cd[bd-1]=cd[bd-1]..cd[bd]
__a[bd-1]=__a[bd-1]..__a[bd]dd[bd-1]=dd[bd-1]..dd[bd]table.remove(cd,bd)
table.remove(__a,bd)table.remove(dd,bd)bd=bd-1 end else
cd[bd]=cd[bd]:sub(1,ad-2)..cd[bd]:sub(ad,cd[bd]:len())__a[bd]=__a[bd]:sub(1,ad-2)..
__a[bd]:sub(ad,__a[bd]:len())
dd[bd]=
dd[bd]:sub(1,ad-2)..dd[bd]:sub(ad,dd[bd]:len())if(ad>1)then ad=ad-1 end
if(_d>1)then if(ad<_d)then _d=_d-1 end end end;if(bd<dc)then dc=dc-1 end;d_a(baa)baa:setValue("")end
if(caa==keys.delete)then
if(ad>cd[bd]:len())then
if(cd[bd+1]~=nil)then cd[bd]=cd[bd]..
cd[bd+1]table.remove(cd,bd+1)
table.remove(dd,bd+1)table.remove(__a,bd+1)end else
cd[bd]=cd[bd]:sub(1,ad-1)..cd[bd]:sub(ad+1,cd[bd]:len())__a[bd]=__a[bd]:sub(1,ad-1)..
__a[bd]:sub(ad+1,__a[bd]:len())
dd[bd]=
dd[bd]:sub(1,ad-1)..dd[bd]:sub(ad+1,dd[bd]:len())end;d_a(baa)end
if(caa==keys.enter)then
table.insert(cd,bd+1,cd[bd]:sub(ad,cd[bd]:len()))
table.insert(__a,bd+1,__a[bd]:sub(ad,__a[bd]:len()))
table.insert(dd,bd+1,dd[bd]:sub(ad,dd[bd]:len()))cd[bd]=cd[bd]:sub(1,ad-1)
__a[bd]=__a[bd]:sub(1,ad-1)dd[bd]=dd[bd]:sub(1,ad-1)bd=bd+1;ad=1;_d=1;if(bd-dc>=bba)then
dc=dc+1 end;baa:setValue("")end
if(caa==keys.up)then
if(bd>1)then bd=bd-1;if(ad>cd[bd]:len()+1)then ad=
cd[bd]:len()+1 end;if(_d>1)then if(ad<_d)then _d=ad-aba+1;if(_d<1)then
_d=1 end end end;if(dc>1)then if(
bd<dc)then dc=dc-1 end end end end
if(caa==keys.down)then
if(bd<#cd)then bd=bd+1;if(ad>cd[bd]:len()+1)then ad=
cd[bd]:len()+1 end;if(_d>1)then if(ad<_d)then _d=ad-aba+1;if(_d<1)then
_d=1 end end end;if(bd>=
dc+bba)then dc=dc+1 end end end
if(caa==keys.right)then ad=ad+1;if(bd<#cd)then if(ad>cd[bd]:len()+1)then ad=1
bd=bd+1 end elseif(ad>cd[bd]:len())then
ad=cd[bd]:len()+1 end;if(ad<1)then ad=1 end;if
(ad<_d)or(ad>=aba+_d)then _d=ad-aba+1 end
if(_d<1)then _d=1 end end
if(caa==keys.left)then ad=ad-1;if(ad>=1)then
if(ad<_d)or(ad>=aba+_d)then _d=ad end end
if(bd>1)then if(ad<1)then bd=bd-1
ad=cd[bd]:len()+1;_d=ad-aba+1 end end;if(ad<1)then ad=1 end;if(_d<1)then _d=1 end end;local cba=
(ad<=cd[bd]:len()and ad-1 or cd[bd]:len())- (_d-1)if(cba>
baa.x+aba-1)then cba=baa.x+aba-1 end;local dba=(
bd-dc<bba and bd-dc or bd-dc-1)if(cba<1)then cba=0 end;baa.parent:setCursor(true,
daa+cba,_ba+dba,baa.fgColor)
baa:updateDraw()return true end end,charHandler=function(baa,caa)
if
(bc.charHandler(baa,caa))then local daa,_ba=baa:getAnchorPosition()local aba,bba=baa:getSize()
cd[bd]=cd[bd]:sub(1,
ad-1)..caa..cd[bd]:sub(ad,cd[bd]:len())
__a[bd]=__a[bd]:sub(1,ad-1)..bb[baa.fgColor]..
__a[bd]:sub(ad,__a[bd]:len())
dd[bd]=dd[bd]:sub(1,ad-1)..bb[baa.bgColor]..
dd[bd]:sub(ad,dd[bd]:len())ad=ad+1;if(ad>=aba+_d)then _d=_d+1 end;d_a(baa)
baa:setValue("")local cba=
(ad<=cd[bd]:len()and ad-1 or cd[bd]:len())- (_d-1)if(cba>
baa.x+aba-1)then cba=baa.x+aba-1 end;local dba=(
bd-dc<bba and bd-dc or bd-dc-1)if(cba<1)then cba=0 end;baa.parent:setCursor(true,
daa+cba,_ba+dba,baa.fgColor)
baa:updateDraw()return true end end,dragHandler=function(baa,caa,daa,_ba)
if
(bc.dragHandler(baa,caa,daa,_ba))then
local aba,bba=baa:getAbsolutePosition(baa:getAnchorPosition())local cba,dba=baa:getAnchorPosition()local _ca,aca=baa:getSize()
if(cd[
_ba-bba+dc]~=nil)then
if
(cba+_ca>cba+daa- (aba+1)+_d)and(cba<cba+daa-aba+_d)then
ad=daa-aba+_d;bd=_ba-bba+dc;if(ad>cd[bd]:len())then
ad=cd[bd]:len()+1 end
if(ad<_d)then _d=ad-1;if(_d<1)then _d=1 end end;if(baa.parent~=nil)then
baa.parent:setCursor(true,cba+ad-_d,dba+bd-dc,baa.fgColor)end;baa:updateDraw()end end;return true end end,scrollHandler=function(baa,caa,daa,_ba)
if
(bc.scrollHandler(baa,caa,daa,_ba))then
local aba,bba=baa:getAbsolutePosition(baa:getAnchorPosition())local cba,dba=baa:getAnchorPosition()local _ca,aca=baa:getSize()
dc=dc+caa;if(dc>#cd- (aca-1))then dc=#cd- (aca-1)end
if(dc<1)then dc=1 end
if(baa.parent~=nil)then
if

(aba+ad-_d>=aba and aba+ad-_d<aba+_ca)and(bba+bd-dc>=bba and bba+bd-dc<bba+aca)then
baa.parent:setCursor(true,cba+ad-_d,dba+bd-dc,baa.fgColor)else baa.parent:setCursor(false)end end;baa:updateDraw()return true end end,mouseHandler=function(baa,caa,daa,_ba)
if
(bc.mouseHandler(baa,caa,daa,_ba))then
local aba,bba=baa:getAbsolutePosition(baa:getAnchorPosition())local cba,dba=baa:getAnchorPosition()
if(cd[_ba-bba+dc]~=nil)then ad=
daa-aba+_d;bd=_ba-bba+dc;if(ad>cd[bd]:len())then ad=
cd[bd]:len()+1 end
if(ad<_d)then _d=ad-1;if(_d<1)then _d=1 end end end;if(baa.parent~=nil)then
baa.parent:setCursor(true,cba+ad-_d,dba+bd-dc,baa.fgColor)end;return true end end,eventHandler=function(baa,caa,daa,_ba,aba,bba)
if
(bc.eventHandler(baa,caa,daa,_ba,aba,bba))then
if(caa=="paste")then
if(baa:isFocused())then local cba,dba=baa:getSize()
cd[bd]=
cd[bd]:sub(1,ad-1)..daa..cd[bd]:sub(ad,cd[bd]:len())
__a[bd]=__a[bd]:sub(1,ad-1)..

bb[baa.fgColor]:rep(daa:len())..__a[bd]:sub(ad,__a[bd]:len())
dd[bd]=dd[bd]:sub(1,ad-1)..
bb[baa.bgColor]:rep(daa:len())..dd[bd]:sub(ad,dd[bd]:len())ad=ad+daa:len()if(ad>=cba+_d)then _d=(ad+1)-cba end
local _ca,aca=baa:getAnchorPosition()
baa.parent:setCursor(true,_ca+ad-_d,aca+bd-dc,baa.fgColor)d_a(baa)baa:updateDraw()end end end end,draw=function(baa)
if
(bc.draw(baa))then
if(baa.parent~=nil)then local caa,daa=baa:getAnchorPosition()
local _ba,aba=baa:getSize()
for n=1,aba do local bba=""local cba=""local dba=""if(cd[n+dc-1]~=nil)then bba=cd[n+dc-1]
dba=__a[n+dc-1]cba=dd[n+dc-1]end
bba=bba:sub(_d,_ba+_d-1)cba=cba:sub(_d,_ba+_d-1)
dba=dba:sub(_d,_ba+_d-1)local _ca=_ba-bba:len()if(_ca<0)then _ca=0 end
bba=bba.._c(baa.bgSymbol,_ca)cba=cba.._c(bb[baa.bgColor],_ca)dba=dba..
_c(bb[baa.fgColor],_ca)
baa.parent:setText(caa,daa+n-1,bba)baa.parent:setBG(caa,daa+n-1,cba)baa.parent:setFG(caa,
daa+n-1,dba)end;if(baa:isFocused())then local bba,cba=baa:getAnchorPosition()
baa.parent:setCursor(true,
bba+ad-_d,cba+bd-dc,baa.fgColor)end end end end,init=function(baa)
baa.parent:addEvent("mouse_click",baa)baa.parent:addEvent("mouse_scroll",baa)
baa.parent:addEvent("mouse_drag",baa)baa.parent:addEvent("key",baa)
baa.parent:addEvent("char",baa)baa.parent:addEvent("other_event",baa)
if(bc.init(baa))then
baa.bgColor=baa.parent:getTheme("TextfieldBG")baa.fgColor=baa.parent:getTheme("TextfieldText")end end}return setmetatable(aaa,bc)end end
aa["objects"]["Thread"]=function(...)local ab=da("utils").getValueFromXML
return
function(bb)local cb
local db="Thread"local _c;local ac;local bc=false
local cc=function(dc,_d)
if(_d:sub(1,1)=="#")then
local ad=dc:getBaseFrame():getDeepObject(_d:sub(2,_d:len()))
if(ad~=nil)and(ad.internalObjetCall~=nil)then return(function()
ad:internalObjetCall()end)end else return dc:getBaseFrame():getVariable(_d)end;return dc end
cb={name=bb,getType=function(dc)return db end,getZIndex=function(dc)return 1 end,getName=function(dc)return dc.name end,getBaseFrame=function(dc)if
(dc.parent~=nil)then return dc.parent:getBaseFrame()end
return dc end,setValuesByXMLData=function(dc,_d)local ad;if(ab("thread",_d)~=nil)then
ad=cc(dc,ab("thread",_d))end
if(ab("start",_d)~=nil)then if
(ab("start",_d))and(ad~=nil)then dc:start(ad)end end;return dc end,start=function(dc,_d)
if(
_d==nil)then error("Function provided to thread is nil")end;_c=_d;ac=coroutine.create(_c)bc=true
local ad,bd=coroutine.resume(ac)if not(ad)then if(bd~="Terminated")then
error("Thread Error Occurred - "..bd)end end
dc.parent:addEvent("other_event",dc)return dc end,getStatus=function(dc,_d)if(
ac~=nil)then return coroutine.status(ac)end;return nil end,stop=function(dc,_d)
bc=false;dc.parent:removeEvent("other_event",dc)return dc end,eventHandler=function(dc,_d,ad,bd,cd)
if
(bc)then
if(coroutine.status(ac)~="dead")then
local dd,__a=coroutine.resume(ac,_d,ad,bd,cd)
if not(dd)then if(__a~="Terminated")then
error("Thread Error Occurred - "..__a)end end else bc=false end end end}cb.__index=cb;return cb end end
aa["objects"]["Switch"]=function(...)local ab=da("Object")
local bb=da("utils").getValueFromXML
return
function(cb)local db=ab(cb)local _c="Switch"db.width=2;db.height=1
db.bgColor=colors.lightGray;db.fgColor=colors.gray;db:setValue(false)db:setZIndex(5)
local ac=colors.black;local bc=colors.red;local cc=colors.green
local dc={getType=function(_d)return _c end,setSymbolColor=function(_d,ad)ac=ad
_d:updateDraw()return _d end,setActiveBackground=function(_d,ad)cc=ad;_d:updateDraw()return _d end,setInactiveBackground=function(_d,ad)
bc=ad;_d:updateDraw()return _d end,setValuesByXMLData=function(_d,ad)
db.setValuesByXMLData(_d,ad)if(bb("inactiveBG",ad)~=nil)then
bc=colors[bb("inactiveBG",ad)]end;if(bb("activeBG",ad)~=nil)then
cc=colors[bb("activeBG",ad)]end;if(bb("symbolColor",ad)~=nil)then
ac=colors[bb("symbolColor",ad)]end end,mouseHandler=function(_d,ad,bd,cd)
if
(db.mouseHandler(_d,ad,bd,cd))then
local dd,__a=_d:getAbsolutePosition(_d:getAnchorPosition())_d:setValue(not _d:getValue())
_d:updateDraw()return true end end,draw=function(_d)
if
(db.draw(_d))then
if(_d.parent~=nil)then local ad,bd=_d:getAnchorPosition()
local cd,dd=_d:getSize()
_d.parent:drawBackgroundBox(ad,bd,cd,dd,_d.bgColor)
if(_d:getValue())then
_d.parent:drawBackgroundBox(ad,bd,1,dd,cc)_d.parent:drawBackgroundBox(ad+1,bd,1,dd,ac)else
_d.parent:drawBackgroundBox(ad,bd,1,dd,ac)_d.parent:drawBackgroundBox(ad+1,bd,1,dd,bc)end end end end,init=function(_d)
_d.parent:addEvent("mouse_click",_d)
if(db.init(_d))then _d.bgColor=_d.parent:getTheme("SwitchBG")
_d.fgColor=_d.parent:getTheme("SwitchText")ac=_d.parent:getTheme("SwitchBGSymbol")
bc=_d.parent:getTheme("SwitchInactive")cc=_d.parent:getTheme("SwitchActive")end end}return setmetatable(dc,db)end end
aa["objects"]["Timer"]=function(...)local ab=da("basaltEvent")
local bb=da("utils").getValueFromXML
return
function(cb)local db="Timer"local _c=0;local ac=0;local bc=0;local cc;local dc=ab()local _d=false
local ad=function(cd,dd,__a)
local a_a=function(b_a)
if(b_a:sub(1,1)=="#")then
local c_a=cd:getBaseFrame():getDeepObject(b_a:sub(2,b_a:len()))
if(c_a~=nil)and(c_a.internalObjetCall~=nil)then dd(cd,function()
c_a:internalObjetCall()end)end else
dd(cd,cd:getBaseFrame():getVariable(b_a))end end;if(type(__a)=="string")then a_a(__a)elseif(type(__a)=="table")then
for b_a,c_a in pairs(__a)do a_a(c_a)end end;return cd end
local bd={name=cb,getType=function(cd)return db end,setValuesByXMLData=function(cd,dd)
if(bb("time",dd)~=nil)then _c=bb("time",dd)end;if(bb("repeat",dd)~=nil)then ac=bb("repeat",dd)end
if(
bb("start",dd)~=nil)then if(bb("start",dd))then cd:start()end end;if(bb("onCall",dd)~=nil)then
ad(cd,cd.onCall,bb("onCall",dd))end;return cd end,getBaseFrame=function(cd)
if(
cd.parent~=nil)then return cd.parent:getBaseFrame()end;return cd end,getZIndex=function(cd)return 1 end,getName=function(cd)
return cd.name end,setTime=function(cd,dd,__a)_c=dd or 0;ac=__a or 1;return cd end,start=function(cd)if(_d)then
os.cancelTimer(cc)end;bc=ac;cc=os.startTimer(_c)_d=true
cd.parent:addEvent("other_event",cd)return cd end,isActive=function(cd)return _d end,cancel=function(cd)if(
cc~=nil)then os.cancelTimer(cc)end;_d=false
cd.parent:removeEvent("other_event",cd)return cd end,onCall=function(cd,dd)
dc:registerEvent("timed_event",dd)return cd end,eventHandler=function(cd,dd,__a)
if
dd=="timer"and __a==cc and _d then dc:sendEvent("timed_event",cd)
if(bc>=1)then bc=bc-1;if(bc>=1)then
cc=os.startTimer(_c)end elseif(bc==-1)then cc=os.startTimer(_c)end end end}bd.__index=bd;return bd end end
aa["objects"]["Slider"]=function(...)local ab=da("Object")
local bb=da("basaltLogs")local cb=da("utils").getValueFromXML
return
function(db)local _c=ab(db)local ac="Slider"
_c.width=8;_c.height=1;_c:setValue(1)local bc="horizontal"local cc=" "local dc;local _d="\140"
local ad=_c.width;local bd=1;local cd=1
local function dd(a_a,b_a,c_a,d_a)
local _aa,aaa=a_a:getAbsolutePosition(a_a:getAnchorPosition())local baa,caa=a_a:getSize()
if(bc=="horizontal")then
for _index=0,baa do
if
(_aa+_index==c_a)and(aaa<=d_a)and(aaa+caa>d_a)then
bd=math.min(_index+1,baa- (cd-1))a_a:setValue(ad/baa* (bd))a_a:updateDraw()end end end
if(bc=="vertical")then
for _index=0,caa do
if
(aaa+_index==d_a)and(_aa<=c_a)and(_aa+baa>c_a)then bd=math.min(_index+1,caa- (cd-1))
a_a:setValue(ad/caa* (bd))a_a:updateDraw()end end end end
local __a={getType=function(a_a)return ac end,setSymbol=function(a_a,b_a)cc=b_a:sub(1,1)a_a:updateDraw()return a_a end,setValuesByXMLData=function(a_a,b_a)
_c.setValuesByXMLData(a_a,b_a)
if(cb("maxValue",b_a)~=nil)then ad=cb("maxValue",b_a)end;if(cb("backgroundSymbol",b_a)~=nil)then
_d=cb("backgroundSymbol",b_a):sub(1,1)end;if(cb("barType",b_a)~=nil)then
bc=cb("barType",b_a):lower()end;if(cb("symbol",b_a)~=nil)then
cc=cb("symbol",b_a):sub(1,1)end;if(cb("symbolSize",b_a)~=nil)then
a_a:setSymbolSize(cb("symbolSize",b_a))end;if(cb("symbolColor",b_a)~=nil)then
dc=colors[cb("symbolColor",b_a)]end;if(cb("index",b_a)~=nil)then
a_a:setIndex(cb("index",b_a))end end,setIndex=function(a_a,b_a)
bd=b_a;if(bd<1)then bd=1 end;local c_a,d_a=a_a:getSize()
bd=math.min(bd,(
bc=="vertical"and d_a or c_a)- (cd-1))
a_a:setValue(ad/ (bc=="vertical"and d_a or c_a)*bd)a_a:updateDraw()return a_a end,getIndex=function(a_a)return
bd end,setSymbolSize=function(a_a,b_a)cd=tonumber(b_a)or 1
if(bc=="vertical")then
a_a:setValue(bd-1 * (ad/ (h- (cd-
1)))- (ad/ (h- (cd-1))))elseif(bc=="horizontal")then
a_a:setValue(bd-1 * (ad/ (w- (cd-1)))- (ad/
(w- (cd-1))))end;a_a:updateDraw()return a_a end,setMaxValue=function(a_a,b_a)
ad=b_a;return a_a end,setBackgroundSymbol=function(a_a,b_a)_d=string.sub(b_a,1,1)
a_a:updateDraw()return a_a end,setSymbolColor=function(a_a,b_a)dc=b_a;a_a:updateDraw()
return a_a end,setBarType=function(a_a,b_a)bc=b_a:lower()a_a:updateDraw()
return a_a end,mouseHandler=function(a_a,b_a,c_a,d_a)if(_c.mouseHandler(a_a,b_a,c_a,d_a))then
dd(a_a,b_a,c_a,d_a)return true end;return false end,dragHandler=function(a_a,b_a,c_a,d_a)if
(_c.dragHandler(a_a,b_a,c_a,d_a))then dd(a_a,b_a,c_a,d_a)return true end
return false end,scrollHandler=function(a_a,b_a,c_a,d_a)
if
(_c.scrollHandler(a_a,b_a,c_a,d_a))then local _aa,aaa=a_a:getSize()bd=bd+b_a;if(bd<1)then bd=1 end
bd=math.min(bd,(
bc=="vertical"and aaa or _aa)- (cd-1))
a_a:setValue(ad/ (bc=="vertical"and aaa or _aa)*bd)a_a:updateDraw()return true end;return false end,draw=function(a_a)
if
(_c.draw(a_a))then
if(a_a.parent~=nil)then local b_a,c_a=a_a:getAnchorPosition()
local d_a,_aa=a_a:getSize()
if(bc=="horizontal")then
a_a.parent:writeText(b_a,c_a,_d:rep(bd-1),a_a.bgColor,a_a.fgColor)
a_a.parent:writeText(b_a+bd-1,c_a,cc:rep(cd),dc,dc)
a_a.parent:writeText(b_a+bd+cd-1,c_a,_d:rep(d_a- (bd+cd-1)),a_a.bgColor,a_a.fgColor)end
if(bc=="vertical")then
for n=0,_aa-1 do
if(bd==n+1)then
for curIndexOffset=0,math.min(cd-1,_aa)do a_a.parent:writeText(b_a,c_a+n+
curIndexOffset,cc,dc,dc)end else if(n+1 <bd)or(n+1 >bd-1 +cd)then
a_a.parent:writeText(b_a,c_a+n,_d,a_a.bgColor,a_a.fgColor)end end end end end end end,init=function(a_a)
a_a.parent:addEvent("mouse_click",a_a)a_a.parent:addEvent("mouse_drag",a_a)
a_a.parent:addEvent("mouse_scroll",a_a)
if(_c.init(a_a))then
a_a.bgColor=a_a.parent:getTheme("SliderBG")a_a.fgColor=a_a.parent:getTheme("SliderText")
dc=a_a.parent:getTheme("SliderSymbolColor")end end}return setmetatable(__a,_c)end end;aa["libraries"]={}
aa["libraries"]["basaltDraw"]=function(...)
local ab=da("tHex")local bb,cb=string.sub,string.rep
return
function(db)local _c=db or term.current()
local ac;local bc,cc=_c.getSize()local dc={}local _d={}local ad={}local bd={}local cd={}local dd={}local __a;local a_a={}local function b_a()
__a=cb(" ",bc)
for n=0,15 do local caa=2 ^n;local daa=ab[caa]a_a[caa]=cb(daa,bc)end end;b_a()
local function c_a()b_a()local caa=__a
local daa=a_a[colors.white]local _ba=a_a[colors.black]
for currentY=1,cc do
dc[currentY]=bb(
dc[currentY]==nil and caa or
dc[currentY]..caa:sub(1,bc-dc[currentY]:len()),1,bc)
ad[currentY]=bb(ad[currentY]==nil and daa or ad[currentY]..daa:sub(1,bc-
ad[currentY]:len()),1,bc)
_d[currentY]=bb(_d[currentY]==nil and _ba or _d[currentY].._ba:sub(1,bc-
_d[currentY]:len()),1,bc)end end;c_a()
local function d_a(caa,daa,_ba)
if(daa>=1)and(daa<=cc)then
if
(caa+_ba:len()>0)and(caa<=bc)then local aba=dc[daa]local bba;local cba=caa+#_ba-1
if(caa<1)then local dba=1 -caa+1
local _ca=bc-caa+1;_ba=bb(_ba,dba,_ca)elseif(cba>bc)then local dba=bc-caa+1;_ba=bb(_ba,1,dba)end
if(caa>1)then local dba=caa-1;bba=bb(aba,1,dba).._ba else bba=_ba end;if cba<bc then bba=bba..bb(aba,cba+1,bc)end
dc[daa]=bba end end end
local function _aa(caa,daa,_ba)
if(daa>=1)and(daa<=cc)then
if(caa+_ba:len()>0)and(caa<=bc)then
local aba=_d[daa]local bba;local cba=caa+#_ba-1
if(caa<1)then
_ba=bb(_ba,1 -caa+1,bc-caa+1)elseif(cba>bc)then _ba=bb(_ba,1,bc-caa+1)end
if(caa>1)then bba=bb(aba,1,caa-1).._ba else bba=_ba end;if cba<bc then bba=bba..bb(aba,cba+1,bc)end
_d[daa]=bba end end end
local function aaa(caa,daa,_ba)
if(daa>=1)and(daa<=cc)then
if(caa+_ba:len()>0)and(caa<=bc)then
local aba=ad[daa]local bba;local cba=caa+#_ba-1
if(caa<1)then local dba=1 -caa+1;local _ca=bc-caa+1
_ba=bb(_ba,dba,_ca)elseif(cba>bc)then local dba=bc-caa+1;_ba=bb(_ba,1,dba)end
if(caa>1)then local dba=caa-1;bba=bb(aba,1,dba).._ba else bba=_ba end;if cba<bc then bba=bba..bb(aba,cba+1,bc)end
ad[daa]=bba end end end
local baa={setSize=function(caa,daa)bc,cc=caa,daa;c_a()end,setMirror=function(caa)ac=caa end,setBG=function(caa,daa,_ba)
_aa(caa,daa,_ba)end,setText=function(caa,daa,_ba)d_a(caa,daa,_ba)end,setFG=function(caa,daa,_ba)
aaa(caa,daa,_ba)end,drawBackgroundBox=function(caa,daa,_ba,aba,bba)for n=1,aba do
_aa(caa,daa+ (n-1),cb(ab[bba],_ba))end end,drawForegroundBox=function(caa,daa,_ba,aba,bba)
for n=1,aba do aaa(caa,
daa+ (n-1),cb(ab[bba],_ba))end end,drawTextBox=function(caa,daa,_ba,aba,bba)for n=1,aba do
d_a(caa,daa+ (n-1),cb(bba,_ba))end end,writeText=function(caa,daa,_ba,aba,bba)
if(_ba~=nil)then
d_a(caa,daa,_ba)if(aba~=nil)and(aba~=false)then
_aa(caa,daa,cb(ab[aba],_ba:len()))end;if(bba~=nil)and(bba~=false)then
aaa(caa,daa,cb(ab[bba],_ba:len()))end end end,update=function()
local caa,daa=_c.getCursorPos()local _ba=false
if(_c.getCursorBlink~=nil)then _ba=_c.getCursorBlink()end;_c.setCursorBlink(false)if(ac~=nil)then
ac.setCursorBlink(false)end
for n=1,cc do _c.setCursorPos(1,n)
_c.blit(dc[n],ad[n],_d[n])if(ac~=nil)then ac.setCursorPos(1,n)
ac.blit(dc[n],ad[n],_d[n])end end;_c.setBackgroundColor(colors.black)
_c.setCursorBlink(_ba)_c.setCursorPos(caa,daa)
if(ac~=nil)then
ac.setBackgroundColor(colors.black)ac.setCursorBlink(_ba)ac.setCursorPos(caa,daa)end end,setTerm=function(caa)
_c=caa end}return baa end end
aa["libraries"]["basaltEvent"]=function(...)
return
function()local ab={}local bb={}
local cb={registerEvent=function(db,_c,ac)if(ab[_c]==nil)then ab[_c]={}
bb[_c]=1 end;ab[_c][bb[_c]]=ac;bb[_c]=bb[_c]+1;return
bb[_c]-1 end,removeEvent=function(db,_c,ac)ab[_c][ac[_c]]=
nil end,sendEvent=function(db,_c,...)local ac
if(ab[_c]~=nil)then for bc,cc in pairs(ab[_c])do
local dc=cc(...)if(dc==false)then ac=dc end end end;return ac end}cb.__index=cb;return cb end end
aa["libraries"]["module"]=function(...)return function(ab)local bb,cb=pcall(da,ab)
return bb and cb or nil end end
aa["libraries"]["layout"]=function(...)
local function ab(cb)local db={}db.___value=nil;db.___name=cb
db.___children={}db.___props={}function db:value()return self.___value end;function db:setValue(_c)
self.___value=_c end;function db:name()return self.___name end;function db:setName(_c)
self.___name=_c end;function db:children()return self.___children end;function db:numChildren()return
#self.___children end
function db:addChild(_c)
if
self[_c:name()]~=nil then if
type(self[_c:name()].name)=="function"then local ac={}table.insert(ac,self[_c:name()])
self[_c:name()]=ac end
table.insert(self[_c:name()],_c)else self[_c:name()]=_c end;table.insert(self.___children,_c)end;function db:properties()return self.___props end;function db:numProperties()
return#self.___props end
function db:addProperty(_c,ac)local bc="@".._c
if self[bc]~=nil then if
type(self[bc])=="string"then local cc={}table.insert(cc,self[bc])
self[bc]=cc end
table.insert(self[bc],ac)else self[bc]=ac end
table.insert(self.___props,{name=_c,value=self[_c]})end;return db end;local bb={}
function bb:ToXmlString(cb)cb=string.gsub(cb,"&","&amp;")
cb=string.gsub(cb,"<","&lt;")cb=string.gsub(cb,">","&gt;")
cb=string.gsub(cb,"\"","&quot;")
cb=string.gsub(cb,"([^%w%&%;%p%\t% ])",function(db)
return string.format("&#x%X;",string.byte(db))end)return cb end
function bb:FromXmlString(cb)
cb=string.gsub(cb,"&#x([%x]+)%;",function(db)
return string.char(tonumber(db,16))end)
cb=string.gsub(cb,"&#([0-9]+)%;",function(db)return string.char(tonumber(db,10))end)cb=string.gsub(cb,"&quot;","\"")
cb=string.gsub(cb,"&apos;","'")cb=string.gsub(cb,"&gt;",">")
cb=string.gsub(cb,"&lt;","<")cb=string.gsub(cb,"&amp;","&")return cb end;function bb:ParseArgs(cb,db)
string.gsub(db,"(%w+)=([\"'])(.-)%2",function(_c,ac,bc)
cb:addProperty(_c,self:FromXmlString(bc))end)end
function bb:ParseXmlText(cb)
local db={}local _c=ab()table.insert(db,_c)local ac,bc,cc,dc,_d;local ad,bd=1,1
while true do
ac,bd,bc,cc,dc,_d=string.find(cb,"<(%/?)([%w_:]+)(.-)(%/?)>",ad)if not ac then break end;local dd=string.sub(cb,ad,ac-1)
if not
string.find(dd,"^%s*$")then
local __a=(_c:value()or"")..self:FromXmlString(dd)db[#db]:setValue(__a)end
if _d=="/"then local __a=ab(cc)self:ParseArgs(__a,dc)
_c:addChild(__a)elseif bc==""then local __a=ab(cc)self:ParseArgs(__a,dc)
table.insert(db,__a)_c=__a else local __a=table.remove(db)_c=db[#db]
if#db<1 then error("XmlParser: nothing to close with "..
cc)end;if __a:name()~=cc then
error("XmlParser: trying to close "..__a.name.." with "..cc)end;_c:addChild(__a)end;ad=bd+1 end;local cd=string.sub(cb,ad)if#db>1 then
error("XmlParser: unclosed "..db[#db]:name())end;return _c end
function bb:loadFile(cb,db)if not db then db=system.ResourceDirectory end
local _c=system.pathForFile(cb,db)local ac,bc=io.open(_c,"r")
if ac and not bc then local cc=ac:read("*a")
io.close(ac)return self:ParseXmlText(cc),nil else print(bc)return nil end end;return bb end
aa["libraries"]["process"]=function(...)local ab={}local bb={}local cb=0
local db=dofile("rom/modules/main/cc/require.lua").make
function bb:new(_c,ac,bc,...)local cc={...}
local dc=setmetatable({path=_c},{__index=self})dc.window=ac;ac.current=term.current;ac.redirect=term.redirect
dc.processId=cb
if(type(_c)=="string")then
dc.coroutine=coroutine.create(function()
local _d=shell.resolveProgram(_c)local ad=setmetatable(bc,{__index=_ENV})ad.shell=shell
ad.basaltProgram=true;ad.arg={[0]=_c,table.unpack(cc)}
ad.require,ad.package=db(ad,fs.getDir(_d))
if(fs.exists(_d))then local bd=fs.open(_d,"r")local cd=bd.readAll()
bd.close()local dd=load(cd,_c,"bt",ad)if(dd~=nil)then return dd()end end end)elseif(type(_c)=="function")then
dc.coroutine=coroutine.create(function()
_c(table.unpack(cc))end)else return end;ab[cb]=dc;cb=cb+1;return dc end
function bb:resume(_c,...)local ac=term.current()term.redirect(self.window)
if(
self.filter~=nil)then if(_c~=self.filter)then return end;self.filter=nil end;local bc,cc=coroutine.resume(self.coroutine,_c,...)if bc then
self.filter=cc else printError(cc)end;term.redirect(ac)
return bc,cc end
function bb:isDead()
if(self.coroutine~=nil)then
if
(coroutine.status(self.coroutine)=="dead")then table.remove(ab,self.processId)return true end else return true end;return false end
function bb:getStatus()if(self.coroutine~=nil)then
return coroutine.status(self.coroutine)end;return nil end
function bb:start()coroutine.resume(self.coroutine)end;return bb end
aa["libraries"]["basaltMon"]=function(...)
local ab={[colors.white]="0",[colors.orange]="1",[colors.magenta]="2",[colors.lightBlue]="3",[colors.yellow]="4",[colors.lime]="5",[colors.pink]="6",[colors.gray]="7",[colors.lightGray]="8",[colors.cyan]="9",[colors.purple]="a",[colors.blue]="b",[colors.brown]="c",[colors.green]="d",[colors.red]="e",[colors.black]="f"}local bb,cb,db,_c=type,string.len,string.rep,string.sub
return
function(ac)local bc={}
for _ba,aba in pairs(ac)do
bc[_ba]={}
for bba,cba in pairs(aba)do local dba=peripheral.wrap(cba)if(dba==nil)then
error("Unable to find monitor "..cba)end;bc[_ba][bba]=dba
bc[_ba][bba].name=cba end end;local cc,dc,_d,ad,bd,cd,dd,__a=1,1,1,1,0,0,0,0;local a_a,b_a=false,1
local c_a,d_a=colors.white,colors.black
local function _aa()local _ba,aba=0,0
for bba,cba in pairs(bc)do local dba,_ca=0,0
for aca,bca in pairs(cba)do local cca,dca=bca.getSize()
dba=dba+cca;_ca=dca>_ca and dca or _ca end;_ba=_ba>dba and _ba or dba;aba=aba+_ca end;dd,__a=_ba,aba end;_aa()
local function aaa()local _ba=0;local aba,bba=0,0
for cba,dba in pairs(bc)do local _ca=0;local aca=0
for bca,cca in pairs(dba)do
local dca,_da=cca.getSize()if(cc-_ca>=1)and(cc-_ca<=dca)then aba=bca end;cca.setCursorPos(
cc-_ca,dc-_ba)_ca=_ca+dca
if(aca<_da)then aca=_da end end;if(dc-_ba>=1)and(dc-_ba<=aca)then bba=cba end
_ba=_ba+aca end;_d,ad=aba,bba end;aaa()
local function baa(_ba,...)local aba={...}return
function()for bba,cba in pairs(bc)do for dba,_ca in pairs(cba)do
_ca[_ba](table.unpack(aba))end end end end
local function caa()baa("setCursorBlink",false)()
if not(a_a)then return end;if(bc[ad]==nil)then return end;local _ba=bc[ad][_d]
if(_ba==nil)then return end;_ba.setCursorBlink(a_a)end
local function daa(_ba,aba,bba)if(bc[ad]==nil)then return end;local cba=bc[ad][_d]
if(cba==nil)then return end;cba.blit(_ba,aba,bba)local dba,_ca=cba.getSize()
if
(cb(_ba)+cc>dba)then local aca=bc[ad][_d+1]if(aca~=nil)then aca.blit(_ba,aba,bba)_d=_d+1;cc=cc+
cb(_ba)end end;aaa()end
return
{clear=baa("clear"),setCursorBlink=function(_ba)a_a=_ba;caa()end,getCursorBlink=function()return a_a end,getCursorPos=function()return cc,dc end,setCursorPos=function(_ba,aba)
cc,dc=_ba,aba;aaa()caa()end,setTextScale=function(_ba)
baa("setTextScale",_ba)()_aa()aaa()b_a=_ba end,getTextScale=function()return b_a end,blit=function(_ba,aba,bba)
daa(_ba,aba,bba)end,write=function(_ba)_ba=tostring(_ba)local aba=cb(_ba)
daa(_ba,db(ab[c_a],aba),db(ab[d_a],aba))end,getSize=function()return dd,__a end,setBackgroundColor=function(_ba)
baa("setBackgroundColor",_ba)()d_a=_ba end,setTextColor=function(_ba)
baa("setTextColor",_ba)()c_a=_ba end,calculateClick=function(_ba,aba,bba)local cba=0
for dba,_ca in pairs(bc)do local aca=0;local bca=0
for cca,dca in pairs(_ca)do
local _da,ada=dca.getSize()if(dca.name==_ba)then return aba+aca,bba+cba end
aca=aca+_da;if(ada>bca)then bca=ada end end;cba=cba+bca end;return aba,bba end}end end
aa["libraries"]["basaltLogs"]=function(...)local ab=""local bb="basaltLog.txt"local cb="Debug"
fs.delete(
ab~=""and ab.."/"..bb or bb)
local db={__call=function(_c,ac,bc)if(ac==nil)then return end
local cc=ab~=""and ab.."/"..bb or bb
local dc=fs.open(cc,fs.exists(cc)and"a"or"w")
dc.writeLine("[Basalt][".. (bc and bc or cb).."]: "..tostring(ac))dc.close()end}return setmetatable({},db)end
aa["libraries"]["tHex"]=function(...)
return
{[colors.white]="0",[colors.orange]="1",[colors.magenta]="2",[colors.lightBlue]="3",[colors.yellow]="4",[colors.lime]="5",[colors.pink]="6",[colors.gray]="7",[colors.lightGray]="8",[colors.cyan]="9",[colors.purple]="a",[colors.blue]="b",[colors.brown]="c",[colors.green]="d",[colors.red]="e",[colors.black]="f"}end
aa["libraries"]["utils"]=function(...)
local ab=function(bb,cb)if cb==nil then cb="%s"end;local db={}
for _c in string.gmatch(bb,"([^"..
cb.."]+)")do table.insert(db,_c)end;return db end
return
{getTextHorizontalAlign=function(bb,cb,db,_c)bb=string.sub(bb,1,cb)local ac=cb-string.len(bb)
if
(db=="right")then bb=string.rep(_c or" ",ac)..bb elseif(db=="center")then
bb=string.rep(
_c or" ",math.floor(ac/2))..bb..
string.rep(_c or" ",math.floor(ac/2))
bb=bb.. (string.len(bb)<cb and(_c or" ")or"")else bb=bb..string.rep(_c or" ",ac)end;return bb end,getTextVerticalAlign=function(bb,cb)
local db=0
if(cb=="center")then db=math.ceil(bb/2)if(db<1)then db=1 end end;if(cb=="bottom")then db=bb end;if(db<1)then db=1 end;return db end,rpairs=function(bb)return function(cb,db)db=
db-1;if db~=0 then return db,cb[db]end end,bb,
#bb+1 end,tableCount=function(bb)
local cb=0;if(bb~=nil)then for db,_c in pairs(bb)do cb=cb+1 end end;return cb end,splitString=ab,createText=function(bb,cb)
local db=ab(bb,"\n")local _c={}
for ac,bc in pairs(db)do local cc=""local dc=ab(bc," ")
for _d,ad in pairs(dc)do
if(#cc+#ad<=cb)then cc=
cc==""and ad or cc.." "..ad;if(_d==#dc)then
table.insert(_c,cc)end else table.insert(_c,cc)cc=ad:sub(1,cb)if
(_d==#dc)then table.insert(_c,cc)end end end end;return _c end,getValueFromXML=function(bb,cb)
local db;if(type(cb)~="table")then return end;if(cb[bb]~=nil)then
if
(type(cb[bb])=="table")then if(cb[bb].value~=nil)then db=cb[bb]:value()end end end;if(db==nil)then
db=cb["@"..bb]end;if(db=="true")then db=true elseif(db=="false")then db=false elseif(tonumber(db)~=nil)then
db=tonumber(db)end;return db end,numberFromString=function(bb)return load(
"return "..bb)()end,uuid=function()
local bb=math.random
local function cb()local db='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'return
string.gsub(db,'[xy]',function(_c)local ac=
(_c=='x')and bb(0,0xf)or bb(8,0xb)
return string.format('%x',ac)end)end;return cb()end}end
aa["libraries"]["bigfont"]=function(...)local ab=da("tHex")
local bb={{"\32\32\32\137\156\148\158\159\148\135\135\144\159\139\32\136\157\32\159\139\32\32\143\32\32\143\32\32\32\32\32\32\32\32\147\148\150\131\148\32\32\32\151\140\148\151\140\147","\32\32\32\149\132\149\136\156\149\144\32\133\139\159\129\143\159\133\143\159\133\138\32\133\138\32\133\32\32\32\32\32\32\150\150\129\137\156\129\32\32\32\133\131\129\133\131\132","\32\32\32\130\131\32\130\131\32\32\129\32\32\32\32\130\131\32\130\131\32\32\32\32\143\143\143\32\32\32\32\32\32\130\129\32\130\135\32\32\32\32\131\32\32\131\32\131","\139\144\32\32\143\148\135\130\144\149\32\149\150\151\149\158\140\129\32\32\32\135\130\144\135\130\144\32\149\32\32\139\32\159\148\32\32\32\32\159\32\144\32\148\32\147\131\132","\159\135\129\131\143\149\143\138\144\138\32\133\130\149\149\137\155\149\159\143\144\147\130\132\32\149\32\147\130\132\131\159\129\139\151\129\148\32\32\139\131\135\133\32\144\130\151\32","\32\32\32\32\32\32\130\135\32\130\32\129\32\129\129\131\131\32\130\131\129\140\141\132\32\129\32\32\129\32\32\32\32\32\32\32\131\131\129\32\32\32\32\32\32\32\32\32","\32\32\32\32\149\32\159\154\133\133\133\144\152\141\132\133\151\129\136\153\32\32\154\32\159\134\129\130\137\144\159\32\144\32\148\32\32\32\32\32\32\32\32\32\32\32\151\129","\32\32\32\32\133\32\32\32\32\145\145\132\141\140\132\151\129\144\150\146\129\32\32\32\138\144\32\32\159\133\136\131\132\131\151\129\32\144\32\131\131\129\32\144\32\151\129\32","\32\32\32\32\129\32\32\32\32\130\130\32\32\129\32\129\32\129\130\129\129\32\32\32\32\130\129\130\129\32\32\32\32\32\32\32\32\133\32\32\32\32\32\129\32\129\32\32","\150\156\148\136\149\32\134\131\148\134\131\148\159\134\149\136\140\129\152\131\32\135\131\149\150\131\148\150\131\148\32\148\32\32\148\32\32\152\129\143\143\144\130\155\32\134\131\148","\157\129\149\32\149\32\152\131\144\144\131\148\141\140\149\144\32\149\151\131\148\32\150\32\150\131\148\130\156\133\32\144\32\32\144\32\130\155\32\143\143\144\32\152\129\32\134\32","\130\131\32\131\131\129\131\131\129\130\131\32\32\32\129\130\131\32\130\131\32\32\129\32\130\131\32\130\129\32\32\129\32\32\133\32\32\32\129\32\32\32\130\32\32\32\129\32","\150\140\150\137\140\148\136\140\132\150\131\132\151\131\148\136\147\129\136\147\129\150\156\145\138\143\149\130\151\32\32\32\149\138\152\129\149\32\32\157\152\149\157\144\149\150\131\148","\149\143\142\149\32\149\149\32\149\149\32\144\149\32\149\149\32\32\149\32\32\149\32\149\149\32\149\32\149\32\144\32\149\149\130\148\149\32\32\149\32\149\149\130\149\149\32\149","\130\131\129\129\32\129\131\131\32\130\131\32\131\131\32\131\131\129\129\32\32\130\131\32\129\32\129\130\131\32\130\131\32\129\32\129\131\131\129\129\32\129\129\32\129\130\131\32","\136\140\132\150\131\148\136\140\132\153\140\129\131\151\129\149\32\149\149\32\149\149\32\149\137\152\129\137\152\129\131\156\133\149\131\32\150\32\32\130\148\32\152\137\144\32\32\32","\149\32\32\149\159\133\149\32\149\144\32\149\32\149\32\149\32\149\150\151\129\138\155\149\150\130\148\32\149\32\152\129\32\149\32\32\32\150\32\32\149\32\32\32\32\32\32\32","\129\32\32\130\129\129\129\32\129\130\131\32\32\129\32\130\131\32\32\129\32\129\32\129\129\32\129\32\129\32\131\131\129\130\131\32\32\32\129\130\131\32\32\32\32\140\140\132","\32\154\32\159\143\32\149\143\32\159\143\32\159\144\149\159\143\32\159\137\145\159\143\144\149\143\32\32\145\32\32\32\145\149\32\144\32\149\32\143\159\32\143\143\32\159\143\32","\32\32\32\152\140\149\151\32\149\149\32\145\149\130\149\157\140\133\32\149\32\154\143\149\151\32\149\32\149\32\144\32\149\149\153\32\32\149\32\149\133\149\149\32\149\149\32\149","\32\32\32\130\131\129\131\131\32\130\131\32\130\131\129\130\131\129\32\129\32\140\140\129\129\32\129\32\129\32\137\140\129\130\32\129\32\130\32\129\32\129\129\32\129\130\131\32","\144\143\32\159\144\144\144\143\32\159\143\144\159\138\32\144\32\144\144\32\144\144\32\144\144\32\144\144\32\144\143\143\144\32\150\129\32\149\32\130\150\32\134\137\134\134\131\148","\136\143\133\154\141\149\151\32\129\137\140\144\32\149\32\149\32\149\154\159\133\149\148\149\157\153\32\154\143\149\159\134\32\130\148\32\32\149\32\32\151\129\32\32\32\32\134\32","\133\32\32\32\32\133\129\32\32\131\131\32\32\130\32\130\131\129\32\129\32\130\131\129\129\32\129\140\140\129\131\131\129\32\130\129\32\129\32\130\129\32\32\32\32\32\129\32","\32\32\32\32\149\32\32\149\32\32\32\32\32\32\32\32\149\32\32\149\32\32\32\32\32\32\32\32\149\32\32\149\32\32\32\32\32\32\32\32\149\32\32\149\32\32\32\32","\32\32\32\32\32\32\32\32\32\32\32\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\32\32\32\32\32\32\32\32\32\32\32","\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32","\32\32\32\32\149\32\32\149\32\32\32\32\32\32\32\32\149\32\32\149\32\32\32\32\32\32\32\32\149\32\32\149\32\32\32\32\32\32\32\32\149\32\32\149\32\32\32\32","\32\32\32\32\32\32\32\32\32\32\32\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\32\32\32\32\32\32\32\32\32\32\32","\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32\32\149\32","\32\32\32\32\145\32\159\139\32\151\131\132\155\143\132\134\135\145\32\149\32\158\140\129\130\130\32\152\147\155\157\134\32\32\144\144\32\32\32\32\32\32\152\131\155\131\131\129","\32\32\32\32\149\32\149\32\145\148\131\32\149\32\149\140\157\132\32\148\32\137\155\149\32\32\32\149\154\149\137\142\32\153\153\32\131\131\149\131\131\129\149\135\145\32\32\32","\32\32\32\32\129\32\130\135\32\131\131\129\134\131\132\32\129\32\32\129\32\131\131\32\32\32\32\130\131\129\32\32\32\32\129\129\32\32\32\32\32\32\130\131\129\32\32\32","\150\150\32\32\148\32\134\32\32\132\32\32\134\32\32\144\32\144\150\151\149\32\32\32\32\32\32\145\32\32\152\140\144\144\144\32\133\151\129\133\151\129\132\151\129\32\145\32","\130\129\32\131\151\129\141\32\32\142\32\32\32\32\32\149\32\149\130\149\149\32\143\32\32\32\32\142\132\32\154\143\133\157\153\132\151\150\148\151\158\132\151\150\148\144\130\148","\32\32\32\140\140\132\32\32\32\32\32\32\32\32\32\151\131\32\32\129\129\32\32\32\32\134\32\32\32\32\32\32\32\129\129\32\129\32\129\129\130\129\129\32\129\130\131\32","\156\143\32\159\141\129\153\140\132\153\137\32\157\141\32\159\142\32\150\151\129\150\131\132\140\143\144\143\141\145\137\140\148\141\141\144\157\142\32\159\140\32\151\134\32\157\141\32","\157\140\149\157\140\149\157\140\149\157\140\149\157\140\149\157\140\149\151\151\32\154\143\132\157\140\32\157\140\32\157\140\32\157\140\32\32\149\32\32\149\32\32\149\32\32\149\32","\129\32\129\129\32\129\129\32\129\129\32\129\129\32\129\129\32\129\129\131\129\32\134\32\131\131\129\131\131\129\131\131\129\131\131\129\130\131\32\130\131\32\130\131\32\130\131\32","\151\131\148\152\137\145\155\140\144\152\142\145\153\140\132\153\137\32\154\142\144\155\159\132\150\156\148\147\32\144\144\130\145\136\137\32\146\130\144\144\130\145\130\136\32\151\140\132","\151\32\149\151\155\149\149\32\149\149\32\149\149\32\149\149\32\149\149\32\149\152\137\144\157\129\149\149\32\149\149\32\149\149\32\149\149\32\149\130\150\32\32\157\129\149\32\149","\131\131\32\129\32\129\130\131\32\130\131\32\130\131\32\130\131\32\130\131\32\32\32\32\130\131\32\130\131\32\130\131\32\130\131\32\130\131\32\32\129\32\130\131\32\133\131\32","\156\143\32\159\141\129\153\140\132\153\137\32\157\141\32\159\142\32\159\159\144\152\140\144\156\143\32\159\141\129\153\140\132\157\141\32\130\145\32\32\147\32\136\153\32\130\146\32","\152\140\149\152\140\149\152\140\149\152\140\149\152\140\149\152\140\149\149\157\134\154\143\132\157\140\133\157\140\133\157\140\133\157\140\133\32\149\32\32\149\32\32\149\32\32\149\32","\130\131\129\130\131\129\130\131\129\130\131\129\130\131\129\130\131\129\130\130\131\32\134\32\130\131\129\130\131\129\130\131\129\130\131\129\32\129\32\32\129\32\32\129\32\32\129\32","\159\134\144\137\137\32\156\143\32\159\141\129\153\140\132\153\137\32\157\141\32\32\132\32\159\143\32\147\32\144\144\130\145\136\137\32\146\130\144\144\130\145\130\138\32\146\130\144","\149\32\149\149\32\149\149\32\149\149\32\149\149\32\149\149\32\149\149\32\149\131\147\129\138\134\149\149\32\149\149\32\149\149\32\149\149\32\149\154\143\149\32\157\129\154\143\149","\130\131\32\129\32\129\130\131\32\130\131\32\130\131\32\130\131\32\130\131\32\32\32\32\130\131\32\130\131\129\130\131\129\130\131\129\130\131\129\140\140\129\130\131\32\140\140\129"},{"000110000110110000110010101000000010000000100101","000000110110000000000010101000000010000000100101","000000000000000000000000000000000000000000000000","100010110100000010000110110000010100000100000110","000000110000000010110110000110000000000000110000","000000000000000000000000000000000000000000000000","000000110110000010000000100000100000000000000010","000000000110110100010000000010000000000000000100","000000000000000000000000000000000000000000000000","010000000000100110000000000000000000000110010000","000000000000000000000000000010000000010110000000","000000000000000000000000000000000000000000000000","011110110000000100100010110000000100000000000000","000000000000000000000000000000000000000000000000","000000000000000000000000000000000000000000000000","110000110110000000000000000000010100100010000000","000010000000000000110110000000000100010010000000","000000000000000000000000000000000000000000000000","010110010110100110110110010000000100000110110110","000000000000000000000110000000000110000000000000","000000000000000000000000000000000000000000000000","010100010110110000000000000000110000000010000000","110110000000000000110000110110100000000010000000","000000000000000000000000000000000000000000000000","000100011111000100011111000100011111000100011111","000000000000100100100100011011011011111111111111","000000000000000000000000000000000000000000000000","000100011111000100011111000100011111000100011111","000000000000100100100100011011011011111111111111","100100100100100100100100100100100100100100100100","000000110100110110000010000011110000000000011000","000000000100000000000010000011000110000000001000","000000000000000000000000000000000000000000000000","010000100100000000000000000100000000010010110000","000000000000000000000000000000110110110110110000","000000000000000000000000000000000000000000000000","110110110110110110000000110110110110110110110110","000000000000000000000110000000000000000000000000","000000000000000000000000000000000000000000000000","000000000000110110000110010000000000000000010010","000010000000000000000000000000000000000000000000","000000000000000000000000000000000000000000000000","110110110110110110110000110110110110000000000000","000000000000000000000110000000000000000000000000","000000000000000000000000000000000000000000000000","110110110110110110110000110000000000000000010000","000000000000000000000000100000000000000110000110","000000000000000000000000000000000000000000000000"}}local cb={}local db={}
do local bc=0;local cc=#bb[1]local dc=#bb[1][1]
for i=1,cc,3 do
for j=1,dc,3 do
local _d=string.char(bc)local ad={}ad[1]=bb[1][i]:sub(j,j+2)
ad[2]=bb[1][i+1]:sub(j,j+2)ad[3]=bb[1][i+2]:sub(j,j+2)local bd={}bd[1]=bb[2][i]:sub(j,
j+2)bd[2]=bb[2][i+1]:sub(j,j+2)bd[3]=bb[2][
i+2]:sub(j,j+2)db[_d]={ad,bd}bc=bc+1 end end;cb[1]=db end
local function _c(bc,cc)local dc={["0"]="1",["1"]="0"}if bc<=#cb then return true end
for f=#cb+1,bc do local _d={}local ad=cb[
f-1]
for char=0,255 do local bd=string.char(char)local cd={}local dd={}
local __a=ad[bd][1]local a_a=ad[bd][2]
for i=1,#__a do local b_a,c_a,d_a,_aa,aaa,baa={},{},{},{},{},{}
for j=1,#__a[1]do
local caa=db[__a[i]:sub(j,j)][1]table.insert(b_a,caa[1])
table.insert(c_a,caa[2])table.insert(d_a,caa[3])
local daa=db[__a[i]:sub(j,j)][2]
if a_a[i]:sub(j,j)=="1"then
table.insert(_aa,(daa[1]:gsub("[01]",dc)))
table.insert(aaa,(daa[2]:gsub("[01]",dc)))
table.insert(baa,(daa[3]:gsub("[01]",dc)))else table.insert(_aa,daa[1])
table.insert(aaa,daa[2])table.insert(baa,daa[3])end end;table.insert(cd,table.concat(b_a))
table.insert(cd,table.concat(c_a))table.insert(cd,table.concat(d_a))
table.insert(dd,table.concat(_aa))table.insert(dd,table.concat(aaa))
table.insert(dd,table.concat(baa))end;_d[bd]={cd,dd}if cc then cc="Font"..f.."Yeld"..char
os.queueEvent(cc)os.pullEvent(cc)end end;cb[f]=_d end;return true end
local function ac(bc,cc,dc,_d,ad)
if not type(cc)=="string"then error("Not a String",3)end
local bd=type(dc)=="string"and dc:sub(1,1)or ab[dc]or
error("Wrong Front Color",3)
local cd=type(_d)=="string"and _d:sub(1,1)or ab[_d]or
error("Wrong Back Color",3)if(cb[bc]==nil)then _c(3,false)end;local dd=cb[bc]or
error("Wrong font size selected",3)if cc==""then
return{{""},{""},{""}}end;local __a={}
for baa in cc:gmatch('.')do table.insert(__a,baa)end;local a_a={}local b_a=#dd[__a[1]][1]
for nLine=1,b_a do local baa={}
for i=1,#__a do baa[i]=dd[__a[i]]and
dd[__a[i]][1][nLine]or""end;a_a[nLine]=table.concat(baa)end;local c_a={}local d_a={}local _aa={["0"]=bd,["1"]=cd}local aaa={["0"]=cd,["1"]=bd}
for nLine=1,b_a do
local baa={}local caa={}
for i=1,#__a do
local daa=dd[__a[i]]and dd[__a[i]][2][nLine]or""
baa[i]=daa:gsub("[01]",
ad and{["0"]=dc:sub(i,i),["1"]=_d:sub(i,i)}or _aa)
caa[i]=daa:gsub("[01]",
ad and{["0"]=_d:sub(i,i),["1"]=dc:sub(i,i)}or aaa)end;c_a[nLine]=table.concat(baa)
d_a[nLine]=table.concat(caa)end;return{a_a,c_a,d_a}end;return ac end;return aa["main"]()

