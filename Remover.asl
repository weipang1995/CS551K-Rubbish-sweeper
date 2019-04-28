at(0,0).
st(0,0).
hand(0).

!detect(OX,OY).
+!detect(OX,OY): st(0,0) <- -at(0,0); .sense_location(OX,OY); .print("initial at ",OX,OY); +at(OX,OY).

+!move_to(X,Y): at(X,Y) <-.sense_location(OX,OY);.print("arrive",OX,OY).
+!move_to(X,Y): at(OX,OY) & OX>X <-.west;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OX<X <-.east;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OY>Y <-.south;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OY<Y <-.north;.sense_location(NX,NY);-at(OX,OY);+at(NX,NY);!move_to(X,Y).

!move_to(2,2).

!test(8,8).

+!test(X,Y):at(X,Y) & finish(1) & not garbage(A,B)<- .print("finish at",X,Y).

+!test(X,Y): at(OX,OY) & not garbage(A,B)<-
    .sense_location(CX,CY); .print("checking at ",CX,CY);
    .check_for_garbage;
    if(not garbage(A,B)){
        .print("nothing in this area");
        if (CX=8 & CY=8){ +finish(1);}
        if (CX mod 2 = 0 & CX<9 & CY>1 &  CY<8) {!move_to(CX,CY+3);}
        if (CX mod 2 = 1 & CX<9 & CY>2 & CY<9) {!move_to(CX,CY-3);}
        if (CX mod 2 = 0 & CX<8 & CY=8) {!move_to(CX+3,CY);}
        if (CX mod 2 = 1 & CX<8 & CY=2) {!move_to(CX+3,CY);}
    }
    !test(X,Y).

+!test(X,Y): at(CX,CY) & garbage(A,B)& hand(NY)<-
    if(NY < 2 ){garbage(A,B);.print("garbage on",A,B);
    !move_to(A,B);.pickup;.print("pick up the garbage");
    -garbage(A,B);!move_to(CX,CY);
    -hand(NY);+hand(NY+1);
    }
    if(NY = 2){!move_to(0,0);
    .drop;.print("drop the garbage");
    .print("back",CX,CY);!move_to(CX,CY);
    -hand(2);+hand(0);
    }
    if(CX=8 & CY=8){+finish(1);}
    !test(X,Y).

