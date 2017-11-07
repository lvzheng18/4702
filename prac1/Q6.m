function [ out ] = Q6( in, n )
%PRAC1 Summary of this function goes here
%   Detailed explanation goes here
out = [];

while n <= length(in)
    out = ([out,in(end-n+1:end)]);
    in(end-n+1:end) = [];
    %length(in)
end

out = [out,in];

end

