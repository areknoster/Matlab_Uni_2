x = [1 2 3 4 5];
mids = x(1:end-1) +diff(x) / 2;
els = [6 3 2 7];
[~, inds] = maxk(els, 2);
inds = sort(inds);

res = mergeSorted(x, inds, mids);