function TFM = tf_matrix(A,B,C,D,n_round)
    for i = 1:size(B,2)
        x = ss2tf(A,B,C,D,i);
        x = round(x,n_round);ss
        for j = 1:size(C,1)
            TFM(j,i) = poly2sym(x(j,:),sym('s'));
        end
        if i == 3
           TFM = TFM/charpoly(A,'s');
        end 
    end
end
