function s0 = get_samples(dir, file_prefix, file_num, file_append, N)

  s = wavread([dir file_prefix file_num file_append]);
  s0 = s(:,1)';
  
  [val ind] = max(abs(s0));
  
  % if peak is outside the window of [1:N], move the starting point
  if (ind > N) 
    s0 = s0(ind-N+N/2:end);
  end
  
  % if length is less than N, append 0's in the end
  if (length(s0) < N)
    s0 = [s0 zeros(1,N-length(s0))];
  else
    s0 = s0(1:N);
  end
  
endfunction