at(0,0).
!detect(OX,OY).
+!detect(OX,OY): at(M,N) <- -at(M,N); .sense_location(OX,OY); .print("initial at ",OX,OY);+at(OX,OY);

!move_to(10,10).
+!move_to(X,Y): at(X,Y) <-
.print("arrived at",X,Y).

+!move_to(X,Y): at(OX,OY) & OX>X <-
.west;
.sense_location(NX,NY);
-at(OX,OY);
+at(NX,NY);
.print("west ");
.print("at ",NX,NY);
!move_to(X,Y).

+!move_to(X,Y): at(OX,OY) & OX<X <-
.east;
.sense_location(NX,NY);
-at(OX,OY);
+at(NX,NY);
.print("east ");
.print("at ",NX,NY);
!move_to(X,Y).

+!move_to(X,Y): at(OX,OY) & OY>Y <-
.south;
.sense_location(NX,NY);
-at(OX,OY);
+at(NX,NY);
.print("south ");
.print("at ",NX,NY);
!move_to(X,Y).

+!move_to(X,Y): at(OX,OY) & OY<Y <-
.north;
.sense_location(NX,NY);
-at(OX,OY);
+at(NX,NY);
.print("north ");
.print("at ",NX,NY);
!move_to(X,Y).