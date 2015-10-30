function [xx,yy] = mapPoint(X,Y,H,inverse)
    if inverse
        H = inv(H);
    end
    [~,num] = size(X);
    points = [X; Y; ones(1,num)];
    p = H*points;
    xx = p(1,:)./p(3,:);
    yy = p(2,:)./p(3,:);
end