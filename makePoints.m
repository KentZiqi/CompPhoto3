function [XX,YY] = makePoints(X,Y)
    [~,s1] = size(X);
    [~,s2] = size(Y);
    XX = repmat(X,1,s2);
    YY = repmat(Y,1,s1);
end