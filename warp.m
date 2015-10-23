function J = warp(I, H)
    [h, w] =size(I);
    [hq, wq] = findExtremePoints(I,H);
    J = zeros(hq,wq);
    [X, Y] = meshgrid(1:1:w,1:1:h);
    for i = 1:1:wq
        for j = 1:1:hq
            [i,j]
            [xx,yy] = mapPoint(i,j,H,1);
            J(i,j) = interp2(X,Y,I,xx,yy);
        end
    end
end