function [XX,YY] = makePoints(X,Y,minX)
    s1 = length(X);
    s2 = length(Y);
    XX = zeros(1,s1*s2);
    for i = 1:1:s1
        XX(1, (i-1)*s2+1:i*s2) = i+minX;
    end
    YY = repmat(Y,1,s1);
end