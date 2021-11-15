function output = cumulativeFunc(pdf)

Len = length(pdf);
output = zeros(1,Len);

for i=1:Len
   output(i) = sum( pdf(1:i));
end

end

