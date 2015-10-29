function [xx,yy] = mapPoint(x,y,H,inverse)
    if inverse
        H = inv(H);
    end
    p = H*[x y 1]';
    xx = p(1)/p(3);
    yy = p(2)/p(3);
end