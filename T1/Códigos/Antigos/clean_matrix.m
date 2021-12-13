function M = clean_matrix(M,n)
    dim_M = size(M);
    lin_M = dim_M(1);
    col_M = dim_M(2);
    for i = 1:lin_M
        for j = 1:col_M
            if M(i,j) < 10^(-n)
                M(i,j)=0;
            end
        end
    end
                