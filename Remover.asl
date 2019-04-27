at(0,0).
st(0,0).
!detect(OX,OY).
+!detect(OX,OY): st(0,0) <- -at(0,0); .sense_location(OX,OY); .print("initial at ",OX,OY); +at(OX,OY).

+!move_to(X,Y): at(X,Y) <-.sense_location(OX,OY);.print("arrive",OX,OY).
+!move_to(X,Y): at(OX,OY) & OX>X <-.west;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OX<X <-.east;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OY>Y <-.south;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OY<Y <-.north;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).

!move_to(2,2).

!test(8,8).

+!test(X,Y):at(X,Y)<- .print("finish at",X,Y).

+!test(X,Y): at(OX,OY) & st(0,0)<-.sense_location(CX,CY); .print("checking at ",CX,CY);
-st(0,0); +st(1,1);
.incinerate;.check_for_garbage;
!test(X,Y).

+!test(X,Y): at(CX,CY) & garbage(A,B) & st(1,1)<-
    garbage(A,B);.print("garbage on",A,B);
    !move_to(A,B);
    .pickup;.print("pick up the garbage");
    !move_to(0,0);
    .drop;.print("drop the garbage");
    .incinerate;.print("incinerate the garbage");
    -garbage(A,B);.print("back",CX,CY);
    !move_to(CX,CY);
    - st(1,1);+ st(0,0);
    !test(X,Y).

+!test(X,Y): at(NX,NY) & not garbage(A,B) & st(1,1)<-
    .print("nothing in this area");
    if (NX mod 2 = 0 & NX<9 & NY>1 &  NY<8) {!move_to(NX,NY+3);-st(1,1);+st(0,0);}
    if (NX mod 2 = 1 & NX<9 & NY>2 & NY<9) {!move_to(NX,NY-3);-st(1,1);+st(0,0); }
    if (NX mod 2 = 0 & NX<8 & NY=8) {!move_to(NX+3,NY);-st(1,1);+st(0,0);}
    if (NX mod 2 = 1 & NX<8 & NY=2) {!move_to(NX+3,NY);-st(1,1);+st(0,0);}
    .print("arrive next stop");
    !test(X,Y).