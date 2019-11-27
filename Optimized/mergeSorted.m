function [r] = mergeSorted(a,inds, mids)
%MERGESORTED Merges array a and mids elements with indexes inds
r = zeros(1, length(a) + length(inds));
ai = 1; ri = 1;
for bi = inds
    re = ri + bi - ai;
    r(ri: re) = a(ai:bi);
    ri = re + 1;
    r(ri) = mids(bi);
    ri = ri + 1;
    ai = bi + 1;
end
r(ri:end) = a(ai: end);
end
