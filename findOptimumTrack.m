function jalurOptimum = findOptimumTrack(jalur,indeksQTable)

    x = 15; % baris awal objek berada
    y = 1; % kolom awal objek berada
    loopingForever = true; % Set loopingForever menjadi true
    J=2; % Indeks jalur pencarian selanjutnya
    jalurOptimum(1) = indeksQTable(x,y); % inisialisasi jalur optimum pertama dengan titik awal objek berada

    while loopingForever==true % Looping forever
        jalurOptimum(J) = jalur(jalurOptimum(J-1));  % Assign jalur yang optimum
        if jalurOptimum(J) == 15 % Jika jalur sudah sampai di finish
            loopingForever=false; % Looping berhenti
        end
        J = J+1; % Iterasi indeks jalur
    end
end