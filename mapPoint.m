function [xx,yy] = mapPoint(x,y,H)
    p = H*[x y 1]';
    xx = p(1)/p(3);
    yy = p(1)/p(3);
end