
function M = xylayer(x,y,xx,yy)
    M = [x y 1 0 0 0 -xx*x -xx*y -xx; 
         0 0 0 x y 1 -yy*x -yy*x -yy];
end