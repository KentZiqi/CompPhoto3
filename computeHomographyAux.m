function M = computeHomographyAux(x,y,xx,yy)
    M = -1 * [x y 1 0 0 0 -xx*x -xx*y -xx; 
         0 0 0 x y 1 -yy*x -yy*y -yy];
end