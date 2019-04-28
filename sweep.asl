at(1,1).

!detect(OX,OY).
+!detect(OX,OY): at(M,N) <- .sense_location(OX,OY); .print("initial at ",OX,OY);

!move_to(0,0).
+!move_to(X,Y): at(X,Y) <-
.print("arrived at",X,Y,"and start to sweep").

+!move_to(X,Y): at(OX,OY) & OX>X <- .west; .sense_location(NX,NY); -at(OX,OY); +at(NX,NY); .print("west "); .print("at ",NX,NY);
!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OX<X <- .east; .sense_location(NX,NY); -at(OX,OY); +at(NX,NY); .print("east "); .print("at ",NX,NY);
!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OY>Y <- .south; .sense_location(NX,NY); -at(OX,OY); +at(NX,NY); .print("south "); .print("at ",NX,NY);
!move_to(X,Y).
+!move_to(X,Y): at(OX,OY) & OY<Y <- .north; .sense_location(NX,NY); -at(OX,OY); +at(NX,NY); .print("north "); .print("at ",NX,NY);
!move_to(X,Y).

!sweep_to(10,10).

+!sweep_to(X,Y): at(X,Y) <-
.print("finish sweep at",X,Y).

+!sweep_to(X,Y): at(OX,OY) & OX mod 2 == 0 & OY>-1 & OY<10 <-
.north;.sense_location(CX,CY);if ((CY-OY)>1) { .south; }.sense_location(NX,NY);
-at(OX,OY);+at(NX,NY);.print("north ");.print("at ",NX,NY);
!sweep_to(X,Y).

+!sweep_to(X,Y): at(OX,OY) & OX mod 2 == 1 & OY>0 & OY<11 <-
.south;.sense_location(CX,CY);if ((OY-CY)>1) { .north; }.sense_location(NX,NY);
-at(OX,OY);+at(NX,NY);.print("south ");.print("at ",NX,NY);
!sweep_to(X,Y).

+!sweep_to(X,Y): at(OX,OY)& OX < 10 & OX mod 2 == 1 & OY=0 <-
.east;.sense_location(CX,CY);if ((CX-OX)>1) { .west; }.sense_location(NX,NY);
-at(OX,OY);+at(NX,NY);.print("east ");.print("at ",NX,NY);
!sweep_to(X,Y).

+!sweep_to(X,Y): at(OX,OY)& OX < 10 & OX mod 2 == 0 & OY=10 <-
.east;.sense_location(CX,CY);if ((CX-OX)>1) { .west; }.sense_location(NX,NY);
-at(OX,OY);+at(NX,NY);.print("east ");.print("at ",NX,NY);
!sweep_to(X,Y).