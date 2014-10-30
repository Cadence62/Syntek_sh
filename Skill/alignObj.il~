when(low<high

l=low
h=high
tmp=sortArray[low]
subtmp=selsub[low]
mid=nth(refp tmp)

while(l<h
 while(l<h && nth(refp sortArray[h])>mid h--)
  if(l<h then
    sortArray[l]=sortArray[h]
    selsub[l]=selsub[h]
    l++
  );if

 while(l<h && nth(refp sortArray[l])<=mid l++)
  if(l<h then
    sortArray[h]=sortArray[l]
    selsub[h]=selsub[l]
    h--
  );if
);while

 sortArray[l]=tmp
 selsub[l]=subtmp
 quicksort(low l-1 sortArray refp selsub)
 quicksort(l+1 high sortArray refp selsub)
);when

  );prog
);proce

procedure(alignObjects(selobjs selfigs XYbase SignMove GapMove)
  prog((selfig x_offset y_offset i sellong)

;println("enter alignObjects proce");
case(SignMove
    ("HBL"
    for(i 0 length(selobjs)-1
	if(alignForm->equidistant->value then
	if(i==0 then
	x_offset=0;
	else
	x_offset=nth(0 selfigs[i])-nth(2 selfigs[i-1])
	x_offset=GapMove-x_offset
	);if
	else
	x_offset=0;
	);if
if(alignForm->alignon->value then
;printf("xybase %f selfigs %f\n" XYbase nth(1 selfigs[i]))
	y_offset=XYbase-nth(1 selfigs[i])
else
y_offset=0;
);if
	;dbMoveFig(selfigs[i],nil,list(x_offset:y_offset "R0" 1.0))
	dbMoveFig(selobjs[i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[i]):nth(1 selfigs[i]) nth(2 selfigs[i]):nth(3 selfigs[i])) 
           list(x_offset:y_offset "R0" 1.0))
selfigs[i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))
    );for
    )
    ("HBR"
	sellong=length(selobjs)-1
    for(i 0 sellong 
        if(alignForm->equidistant->value then
        if(i==0 then
        x_offset=0;
        else
        x_offset=nth(0 selfigs[sellong-i+1])-nth(2 selfigs[sellong-i])
        x_offset=x_offset-GapMove
        );if
        else
        x_offset=0;
        );if
if(alignForm->alignon->value then
        y_offset=XYbase-nth(1 selfigs[sellong-i])
else
y_offset=0
);if
        ;dbMoveFig(selfigs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
        dbMoveFig(selobjs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[sellong-i]):nth(1 selfigs[sellong-i]) 
                nth(2 selfigs[sellong-i]):nth(3 selfigs[sellong-i])) 
           list(x_offset:y_offset "R0" 1.0))
selfigs[sellong-i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))

    );for
    )
    ("HTL"
    for(i 0 length(selobjs)-1
        if(alignForm->equidistant->value then
        if(i==0 then
        x_offset=0;
        else
        x_offset=nth(0 selfigs[i])-nth(2 selfigs[i-1])
        x_offset=GapMove-x_offset
        );if
        else
        x_offset=0;
        );if
if(alignForm->alignon->value then
        y_offset=XYbase-nth(3 selfigs[i])
else
y_offset=0;
);if
        ;dbMoveFig(selfigs[i],nil,list(x_offset:y_offset "R0" 1.0))
        dbMoveFig(selobjs[i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[i]):nth(1 selfigs[i]) nth(2 selfigs[i]):nth(3 selfigs[i])) 
           list(x_offset:y_offset "R0" 1.0))
selfigs[i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))

    );for
    )
    ("HTR"
        sellong=length(selobjs)-1
    for(i 0 sellong 
        if(alignForm->equidistant->value then
        if(i==0 then
        x_offset=0;
        else
        x_offset=nth(0 selfigs[sellong-i+1])-nth(2 selfigs[sellong-i])
        x_offset=x_offset-GapMove
        );if
        else
        x_offset=0;
        );if
if(alignForm->alignon->value then
        y_offset=XYbase-nth(3 selfigs[sellong-i])
else
y_offset=0;
);if
        ;dbMoveFig(selfigs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
        dbMoveFig(selobjs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[sellong-i]):nth(1 selfigs[sellong-i])
                nth(2 selfigs[sellong-i]):nth(3 selfigs[sellong-i]))
           list(x_offset:y_offset "R0" 1.0))
selfigs[sellong-i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))

    );for
    )
    ("VBL"
    for(i 0 length(selobjs)-1
        if(alignForm->equidistant->value then
        if(i==0 then
        y_offset=0;
        else
        y_offset=nth(1 selfigs[i])-nth(3 selfigs[i-1])
        y_offset=GapMove-y_offset
        );if
        else
        y_offset=0;
        );if
if(alignForm->alignon->value then
        x_offset=XYbase-nth(0 selfigs[i])
else
x_offset=0;
);if
        ;dbMoveFig(selfigs[i],nil,list(x_offset:y_offset "R0" 1.0))
        dbMoveFig(selobjs[i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[i]):nth(1 selfigs[i]) nth(2 selfigs[i]):nth(3 selfigs[i])) 
           list(x_offset:y_offset "R0" 1.0))
selfigs[i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))

    );for
    )
    ("VTL"
        sellong=length(selobjs)-1
    for(i 0 sellong
        if(alignForm->equidistant->value then
        if(i==0 then
        y_offset=0;
        else
        y_offset=nth(1 selfigs[sellong-i+1])-nth(3 selfigs[sellong-i])
        y_offset=y_offset-GapMove
        );if
        else
        y_offset=0;
        );if
if(alignForm->alignon->value then
        x_offset=XYbase-nth(0 selfigs[sellong-i])
else
x_offset=0;
);if
        ;dbMoveFig(selfigs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
        dbMoveFig(selobjs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[sellong-i]):nth(1 selfigs[sellong-i])
                nth(2 selfigs[sellong-i]):nth(3 selfigs[sellong-i]))
           list(x_offset:y_offset "R0" 1.0))
selfigs[sellong-i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))

    );for
    )
    ("VBR"
    for(i 0 length(selobjs)-1
        if(alignForm->equidistant->value then
        if(i==0 then
        y_offset=0;
        else
        y_offset=nth(1 selfigs[i])-nth(3 selfigs[i-1])
        y_offset=GapMove-y_offset
        );if
        else
        y_offset=0;
        );if
if(alignForm->alignon->value then
        x_offset=XYbase-nth(2 selfigs[i])
else
x_offset=0
);if
        ;dbMoveFig(selfigs[i],nil,list(x_offset:y_offset "R0" 1.0))
        dbMoveFig(selobjs[i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[i]):nth(1 selfigs[i]) nth(2 selfigs[i]):nth(3 selfigs[i])) 
           list(x_offset:y_offset "R0" 1.0))
selfigs[i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))

    );for
    )
    ("VTR"
        sellong=length(selobjs)-1
    for(i 0 sellong
        if(alignForm->equidistant->value then
        if(i==0 then
        y_offset=0;
        else
        y_offset=nth(1 selfigs[sellong-i+1])-nth(3 selfigs[sellong-i])
        y_offset=y_offset-GapMove
        );if
        else
        y_offset=0;
        );if
if(alignForm->alignon->value then
        x_offset=XYbase-nth(2 selfigs[sellong-i])
else
x_offset=0
);if
        ;dbMoveFig(selfigs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
        dbMoveFig(selobjs[sellong-i],nil,list(x_offset:y_offset "R0" 1.0))
selfigsilist=geTransformUserBBox(
           list(nth(0 selfigs[sellong-i]):nth(1 selfigs[sellong-i])
                nth(2 selfigs[sellong-i]):nth(3 selfigs[sellong-i]))
           list(x_offset:y_offset "R0" 1.0))
selfigs[sellong-i]=list(caar(selfigsilist) cadar(selfigsilist) caadr(selfigsilist) cadadr(selfigsilist))

    );for
    )
    (t println("Warning!!"))
);case
return(t);
;println("out alignObjects proce");
  );prog
);proce

;uni_list=nil
procedure(unique(isList)
let((item)

foreach(item isList
if(listp(item) then
unique(item)
else
when((and item~>isShape member(item uni_list)==nil) 
when(item~>layerName==car(LSW_layer) uni_list=append1(uni_list item))
)));when_if_foreach

));pro

procedure(alignMain()
  prog((cw cv selObjects objSum subsel i  HVsign
	BTsign LRsign typeSign MoveGap refpoint selMinMax
	depXY MoveSign)

shapebox=nil;
shapelist=nil;
uni_list=nil;

cw=hiGetCurrentWindow()
cv=geGetEditCellView()

selObjects=geGetSelSet(cv)
objSum=length(selObjects);
subsel=listToVector(selObjects)

if(alignForm->iDependObj->value=="Boundary" then
declare(boxlist[objSum])
for(i 0 objSum-1
 boxlist[i]=nth(i selObjects)~>bBox
 boxlist[i]=append(xCoord(boxlist[i]) yCoord(boxlist[i]))
);for

else
;;align depend on LSW layer

LSW_layer=leGetEntryLayer()
LSW_level=0:1

declare(boxlist[objSum])
for(i 0 objSum-1
 ;shapelist=dbGetTrueOverlaps(cv nth(i selObjects)~>bBox LSW_layer LSW_level)
 ;shapelist=dbGetOverlaps(cv nth(i selObjects)~>bBox LSW_layer LSW_level)
shapelist_all=nth(i selObjects)~>master~>shapes
shapelist=nil;
foreach(shape shapelist_all
when(shape~>lpp==LSW_layer 
 shapelist=append1(shapelist shape)
);when
);foreach

if(null(shapelist) then
boxlisti=nth(i selObjects)~>bBox
boxlist[i]=list(caar(boxlisti) cadar(boxlisti) caadr(boxlisti) cadadr(boxlisti))
;(dbCreateRect cv list("mt2" "drawing") boxlisti);
else
 ;unique(shapelist)
 ;shapelist=uni_list
shapebox=geTransformUserBBox(car(shapelist)~>bBox nth(i selObjects)~>transform)
 minx=caar(shapebox)
 miny=cadar(shapebox)
 maxx=caadr(shapebox)
 maxy=cadadr(shapebox)

 foreach(shape shapelist
 shapebox=geTransformUserBBox(shape~>bBox nth(i selObjects)~>transform)
;(dbCreateRect cv list("mt1" "drawing") shapebox);
 lx=caar(shapebox)
 ly=cadar(shapebox)
 rx=caadr(shapebox)
 ry=cadadr(shapebox)

 minx=min(lx minx)
 miny=min(ly miny)
 maxx=max(rx maxx)
 maxy=max(ry maxy)

 );foreach

 boxlist[i]=list(minx miny maxx maxy)
);if
;(dbCreateRect cv list("poly2" "drawing") list(minx:miny maxx:maxy));
;println(boxlist[i])
);for

);if_LSW


HVsign=alignForm->HValign->value
BTsign=alignForm->BTalign->value
LRsign=alignForm->LRalign->value
typeSign=list(HVsign BTsign LRsign)
MoveGap=alignForm->distantValue->value
case(typeSign
	((("Horizontal" "Bottom" "Left"))
	refpoint=0
	selMinMax=0
	depXY=1
	MoveSign="HBL"
	)
	((("Horizontal" "Bottom" "Right"))
	refpoint=2
	selMinMax=objSum-1
	depXY=1
	MoveSign="HBR"
	)
        ((("Horizontal" "Top" "Left"))
        refpoint=0
        selMinMax=0
        depXY=3
	MoveSign="HTL"
        )
        ((("Horizontal" "Top" "Right"))
        refpoint=2
        selMinMax=objSum-1
        depXY=3
	MoveSign="HTR"
        )
        ((("Vertical" "Bottom" "Left"))
        refpoint=1
        selMinMax=0
        depXY=0
	MoveSign="VBL"
        )
        ((("Vertical" "Bottom" "Right"))
        refpoint=1
        selMinMax=0
        depXY=2
	MoveSign="VBR"
        )
        ((("Vertical" "Top" "Left"))
        refpoint=3
        selMinMax=objSum-1
        depXY=0
	MoveSign="VTL"
        )
        ((("Vertical" "Top" "Right"))
        refpoint=3
        selMinMax=objSum-1
        depXY=2
	MoveSign="VTR"
        )
	(t println("Warning!!"))
);case

quicksort(0 objSum-1 boxlist refpoint subsel)
;selObjects=vectorToList(subsel)
baseXY=nth(depXY boxlist[selMinMax])
;alignObjects(subsel baseXY MoveSign MoveGap);
alignObjects(subsel boxlist baseXY MoveSign MoveGap);
;geDeselectAll(cw);
return(t);
  );prog
);proce


procedure(alignForm()
  prog((HValignID BTalignID LRalignID equidistantID
	alignonID distantValueID)

alignonID=hiCreateBooleanButton(
        ?name 'alignon
        ?buttonText "align ?"
        ?value t 
        ?defValue t 
)

(setq lDependObj (list "Boundary" "LSW"))

(setq iDependObjID 
 (hiCreateCyclicField
        ?name (quote iDependObj)
        ?prompt "Depend :"
        ?choices lDependObj 
        ?value "Boundary"
        ?defValue "LSW"
))

HValignID=hiCreateRadioField(
	?name 'HValign
	?prompt "Manner :"
	?value "Horizontal"
	?defValue "Horizontal"
	?choices list("Horizontal" "Vertical")
	;?callback '("HVenablesw(alignForm)")
	)

BTalignID=hiCreateRadioField(
        ?name 'BTalign
        ?prompt "depend :"
        ?value "Bottom"
        ?defValue "Bottom"
        ?choices list("Bottom" "Top")
	;?enabled t
        ;?callback
        )

LRalignID=hiCreateRadioField(
        ?name 'LRalign
        ?prompt "depend :"
        ?value "Left"
        ?defValue "Left"
        ?choices list("Left" "Right")
	;?enabled t 
        ;?callback
        )

equidistantID=hiCreateBooleanButton(
	?name 'equidistant
	?buttonText "equidistance ?"
	?value nil
	?defValue nil
	?callback 
"alignForm->distantValue->editable=alignForm->equidistant->value"
	)
distantValueID=hiCreateFloatField(
	?name 'distantValue
	?prompt "Gap : "
	?value 0.0
	?editable nil
	)

CopyRightID=hiCreateLabel(
	?name 'copyright
	?labelText "CopyRight by nfmao"
	)

AboutButtonID=hiCreateButton(
	?name 'AboutButton
	?buttonText "About"
	?callback "chalayoutabout()"
)


alignFormID=hiCreateAppForm(
	?name 'alignForm
	?formTitle "align Objects v3.0"
	?callback list("alignMain()")
	?fields
	 list(
	  list(alignonID 0:20 150:30 120)
	  list(iDependObjID 170:20 80:30 70)
	  list(HValignID 0:50 320:30 120)
          list(BTalignID 0:80 320:30 120)
          list(LRalignID 0:120 320:30 120)
	  list(equidistantID 0:140 320:30 120)
	  list(distantValueID 0:170 320:30 120)
	  list(CopyRightID 100:210 220:30 120)
	  list(AboutButtonID 240:210 80:30 80)
	)
	;?buttonLayout 'OKCancelDef
	)
  ;hiDisplayForm(alignFormID)
return(t);
  );prog
);proce

procedure(falignformdis()
if(boundp('alignFormID)==nil then
(alignForm)
);if
hiDisplayForm(alignFormID)
);pro

procedure(HVenablesw(form)
  prog((type)
type=form->HValign->value
if(type=="Horizontal" then
  form->BTalign->enabled=t
  form->LRalign->enabled=nil
else
  form->BTalign->enabled=nil
  form->LRalign->enabled=t
);if

  );prog
);proce
procedure(chalayoutabout() 
	let((dl penTable wid string colorIndex) 

	    (dl = dlMakeDisplayList()) 
	    (penTable = dlMakePenTable(8)) 
	    dlSetPenTable(dl penTable) 
	    (stipple1 = dlMakeStipple("0101\n1010"))
	    (stipple2 = dlMakeStipple("1010\n0101")) 

	    (colorIndex = hiMatchColor(nameToColor("black"))) 
	    dlSetPenColor(0 colorIndex penTable) 
	    dlSetPenFillStyle(0 "OutlineStippleFill" penTable) 

	    (colorIndex = hiMatchColor(nameToColor("blue")))
	    dlSetPenColor(1 colorIndex penTable) 
	    dlSetPenFillStyle(1 "OutlineStippleFill" penTable) 
	    dlSetPenStipple(1 stipple1 penTable) 

	    (colorIndex = hiMatchColor(nameToColor("green"))) 
	    dlSetPenColor(2 colorIndex penTable)
	    dlSetPenFillStyle(2 "SolidFill" penTable) 

	    (colorIndex = hiMatchColor(nameToColor("red"))) 
	    dlSetPenColor(4 colorIndex penTable) 
	    dlSetPenFillStyle(4 "SolidFill" penTable) 

	    (colorIndex = hiMatchColor(nameToColor("gold")))
	    dlSetPenColor(5 colorIndex penTable) 
	    dlSetPenFillStyle(5 "OutlineStippleFill" penTable) 
	    dlSetPenStipple(5 stipple1 penTable) 

	    (colorIndex = hiMatchColor(nameToColor("yellow"))) 
	    dlSetPenColor(6 colorIndex penTable)
	    dlSetPenFillStyle(6 "SolidFill" penTable) 

	    (colorIndex = hiMatchColor(nameToColor("darkGrey"))) 
	    dlSetPenColor(7 colorIndex penTable) 
	    dlSetPenFillStyle(7 "OutlineStippleFill" penTable) 
	    dlSetPenStipple(7 stipple2 penTable)

	    (wid = dlMakeWidget(3 0:0 560:270))

	    (string = "ALIGN OBJECTS BY SELECTED") 
	    dlAddRasterText(dl 0 (120:240) string "TimB24")

	    (string = "") 
	    dlAddRasterText(dl 0 (70:10) string "TimB18")

	    (string = "http://www.chalayout.com") 
	    dlAddRasterText(dl 0 (220:45) string "TimB14")

	    (string = "Copyright by nfmao") 
	    dlAddRasterText(dl 0 (230:220) string "TimB14")
 
lpiclist1=list(530:229 390:229 390:206 211:206 211:229 
              35:229 35:42 211:42 211:65 390:65 390:42 530:42)
lpiclist2=list((67:130) (77:120) (97:120) (107:130) (107:135) 
               (97:135) (92:130) (82:130) (77:135) (77:155) 
               (82:160) (92:160) (97:155) (107:155) (107:160) 
               (97:170) (77:170) (67:160) (67:130))

lpiclist3=list((117:120) (127:120) (127:140) (147:140) 
	       (147:120) (157:120) (157:170) (147:170) 
               (147:150) (127:150) (127:170) (117:170) (117:120)) 

lpiclist4=list((482:120) (492:120) (492:160) (507:160) (507:170)
(467:170) (467:160) (482:160) (482:120)
)

lpiclist5=list((427:120) (447:120) (457:130) (457:170) (447:170)
(447:135) (442:130) (432:130) (427:135) (427:170)
(417:170) (417:130) (427:120)
)

lpiclist6=list((387:120) (397:120) (407:130) (407:160) (397:170)
(387:170) (387:160) (392:160) (397:155) (397:135)
(392:130) (387:130) (387:120)
)

lpiclist7=list((387:120) (387:130) (382:130) (377:135) (377:155)
(382:160) (387:160) (387:170) (377:170) (367:160)
(367:130) (377:120) (387:120)
)

lpiclist8=list((332:120) (342:120) (342:137) (357:152) (357:170)
(347:170) (347:157) (337:147) (327:157) (327:170)
(317:170) (317:152) (332:137) (332:120)
)

lpiclist9=list((287:135) (297:135) (297:120) (307:120) (307:160) (297:170)
(287:170) (287:160) (292:160) (297:155) (297:145) (287:145) (287:135)
)

lpiclist10=list((287:135) (287:145) (277:145) (277:155) (282:160) (287:160)
(287:170) (277:170) (267:160) (267:120) (277:120) (277:135) (287:135)
)

lpiclist11=list((217:120) (257:120) (257:130) (227:130) (227:170)
(217:170) (217:120)
)

lpiclist12=list((187:135) (197:135) (197:120) (207:120) (207:160)
(197:170) (187:170) (187:160) (192:160) (197:155)
(197:145) (187:145) (187:135)
)

lpiclist13=list((187:135) (187:145) (177:145) (177:155) (182:160) (187:160)
(187:170) (177:170) (167:160) (167:120) (177:120) (177:135) (187:135)
)


dlAddPolygon(dl 7 lpiclist1)
dlAddPolygon(dl 5 lpiclist2);c
dlAddPolygon(dl 1 lpiclist3);h
dlAddPolygon(dl 1 lpiclist4);t
dlAddPolygon(dl 1 lpiclist5);u
dlAddPolygon(dl 1 lpiclist6);or
dlAddPolygon(dl 1 lpiclist7);ol
dlAddPolygon(dl 1 lpiclist8);y
dlAddPolygon(dl 1 lpiclist9);ar
dlAddPolygon(dl 1 lpiclist10);al
dlAddPolygon(dl 5 lpiclist11);l
dlAddPolygon(dl 1 lpiclist12);ar
dlAddPolygon(dl 1 lpiclist13);al

dlAttachDlistToWidget(dl wid)

));let-proce

