function jalur = findBestTrack(QTable)
    % Perulangan setiap data (225 data)
    for j =1:225
        [QTerbesar(j), indeksTerbesar(j)] = max(QTable(:,j)); % get nilai maksimal dari QTable dan mencari indeks (arah terbaik)
        if indeksTerbesar(j) == 1 % jika arah ke atas
            jalur(j) = j - 15;
        elseif indeksTerbesar(j) == 2 % jika arah ke bawah
            jalur(j) = j + 15;
        elseif indeksTerbesar(j) == 3 % jika arah ke kiri
            jalur(j) = j - 1;
        elseif indeksTerbesar(j) == 4 % jika arah ke kanan
            jalur(j) = j + 1;
        end
    end
end