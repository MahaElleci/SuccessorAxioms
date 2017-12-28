:-include("config.pl"). %knowledge base



r2d2At(X,Y,result(A,S)):-     %effect axioms of r2d2   

                      (
                        Y2 is Y-1,
          						  Y3 is Y+1,
          						  r2d2At(X,Y2,S),
                        A=east,                 %east movement
                        \+(    
                            obstacle(X,Y);
                            wallcolumnsRight(Y);
                            (      
                                rockAt(X,Y,S),
                                (
                                	rockAt(X,Y3,S);
                                	wallcolumnsRight(Y3);
                                	obstacle(X,Y3)
                                )
                          	)
                          )
                      );

                        (
                        Y4 is Y+1, 
                        Y5 is Y-1, 
                        r2d2At(X,Y4,S),
                        A=west,             %west movement
                         \+(    
                        obstacle(X,Y);
                        wallcolumnsLeft(Y);
                        (      
                        	   rockAt(X,Y,S),
	                        (
	                        	rockAt(X,Y5,S); 
	                        	wallcolumnsLeft(Y5); 
	                        	obstacle(X,Y5)

	                        )
	                        	
	                     )
                            )
                        );


						            (
                            X2 is X+1,
                            X3 is X-1,
                            r2d2At(X2,Y,S),
                            A=north,            %north movement
                            \+(
                                obstacle(X,Y);
                                wallrowsUp(X);
                                (
                                    rockAt(X,Y,S),
                                    (
                                        rockAt(X3,Y,S);
                                        wallrowsUp(X3);
                                        obstacle(X3,Y)
	                        	
                                    )
	                        	
                                )
                            )
                        );


                        (
                        X4 is X-1,
                        X5 is X+1,
                        r2d2At(X4,Y,S),
                        A=south,            %south movement
                          \+(    
                            obstacle(X,Y);
                            wallrowsDown(X);
                                (
                                    rockAt(X,Y,S),
                                    (
                                    rockAt(X5,Y,S);
                                    wallrowsDown(X5);
                                    obstacle(X5,Y)
	                        	
                                    )
	                        	
                                )
                            )
                        ).




rockAt(X,Y,result(A,S)) :-             %effect axioms of rock 
        
                           (
                              Y1 is Y-1,
                             Y2 is Y-2,
                             r2d2At(X,Y2,S),
                             rockAt(X,Y1,S), 
                             A = east,        %east movement succeed
                              \+(
                             	  obstacle(X,Y); 
                                wallcolumnsRight(Y);  
                                rockAt(X,Y,S)
                                  )
                          );
                               

                         (
                           Y3 is Y+1,
                           Y4 is Y+2,
                           r2d2At(X,Y4,S),
                           rockAt(X,Y3,S), 
                           A = west,         %west movement succeed
                           \+( 
                           	  obstacle(X,Y); 
                              wallcolumnsLeft(Y);
                              rockAt(X,Y,S)
         	                 )
                         ); 




                        (
                           X1 is X+1,
                           X2 is X+2,
                           r2d2At(X2,Y,S),
                           rockAt(X1,Y,S), 
                           A = north,         %north movement succeed
                           \+( 
                           	  obstacle(X,Y); 
                              wallrowsUp(X);
                              rockAt(X,Y,S)
         	                 )
                       ); 


                        (
                          X3 is X-1,
                           X4 is X-2,
                           r2d2At(X4,Y,S),
                           rockAt(X3,Y,S), 
                           A = south,        %south movement succeed
                           \+( 
                           	  obstacle(X,Y); 
                              wallrowsDown(X);
                              rockAt(X,Y,S)
         	                 )
                      ).




rockAt(X,Y,result(A,S)) :-                 %persistence of the rock

                           (
                              Y1 is Y-1,
                              Y2 is Y+1,
                                A = east,        %east movement fail
                                 rockAt(X,Y,S),  
                              (  
                               
                                (
                                 
                        
                                  (
                                      obstacle(X,Y2);
                                      wallcolumnsRight(Y2);
                                      rockAt(X,Y2,S)
                                  )
                                );
                                \+r2d2At(X,Y1,S)
                              )
                           );
         	               
                           (
                              Y1 is Y-1,
                              Y2 is Y+1,
                                A = west,        %west movement fail
                                 rockAt(X,Y,S), 
                              (
                                (
                                     
                                   
          	                        (
                                      obstacle(X,Y1); 
                                      wallcolumnsLeft(Y1);
                                      rockAt(X,Y1,S)
                                    )
                                );
                                \+r2d2At(X,Y2,S)
                              )
                            );

                          (
                             X1 is X+1,
                             X2 is X-1,
                                  A = north,  %north movement fail
                              rockAt(X,Y,S), 
                             (
                              (
                                 
                            
                             	  (
                                  obstacle(X2,Y); 
                                  wallrowsUp(X2);
                                  rockAt(X2,Y,S)
                                )
                              );
                              \+r2d2At(X1,Y,S)
                            )
                          );

                            (
                            X1 is X+1,
                            X2 is X-1,
                             A = south,            %south movement fail
                              rockAt(X,Y,S), 
                            ( 
                                (
                                    
                                   
                                    (
                                        obstacle(X1,Y);
                                        wallrowsDown(X1);
                                        rockAt(X1,Y,S)
                                    )
                                );
                                \+r2d2At(X2,Y,S)
                            )
                        ).













