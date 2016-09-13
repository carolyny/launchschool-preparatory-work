def interleave(arr1, arr2)
  result=[]
  i=0
  while i<arr1.length
    result.push arr1[i]
    result.push arr2[i]
    i+=1
  end
  p result
end

interleave(["a","b","c"],[1,2,3])
