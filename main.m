% Sistemas lineares

sistema = [1 -5 1 -13 3 16;
          -5 1 16 -2 -7 7;
          -17 6 5 -1 4 -14;
          2 11 -1 -5 -20 3;
          3 -21 -8 -4 5 -5];
detSistema = det(sistema);      
if detSistema ~= 0
    %Eliminação de Gauss
    gauss(sistema);
    
else
    fprintf('O sistema não possui solução única');
end

 