function [x,y,QTable] = move(x,y,QTable,indeksQTable,learningRate,epsilon,dataset)

    % Fungsi ini bertujuan untuk menggerakkan agen / objek dari titik
    % start hingga finish dan juga mengupdate QTable (dengan memanggil fungsi
    % 'updateQTable') 

    atas = 1; % set arah atas
    bawah = 2; % set arah bawah
    kiri = 3; % set arah kiri
    kanan = 4; % set arah kanan
     
    indeks = indeksQTable(x,y); % get indeks pada indeksQTable
    
    if (x+1 == 16) && (y-1==0) % Jika objek berada di pojok kiri bawah, hanya ada 2 aksi
        random = randi([1 2]); % Random 2 Aksi
        if(random == 1) % Aksi ke atas
            x = x-1; % Objek pindah ke atas blok 1 langkah
            arah = atas;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif (random == 2) % Aksi ke kanan
            y = y+1; % Objek pindah ke kanan blok 1 langkah
            arah = kanan;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    elseif (x+1 == 16) && (y+1 == 16) % Jika objek berada di pojok bawah kanan
        random = randi([1 2]); % Random 2 aksi, hanya ada 2 aksi
        if(random == 1) % Aksi ke atas
            x = x-1; % Objek pindah ke atas blok 1 langkah
            arah = atas;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif (random == 2) % Aksi ke kiri
            y = y-1; % Objek pindah ke kiri blok 1 langkah
            arah = kiri;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    elseif (x-1 == 0) && (y-1 == 0)
        random = randi([1 2]);
        if(random == 1) % Aksi ke kanan
            y = y+1; % Objek pindah ke kanan blok 1 langkah
            arah = kanan;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif (random == 2) % Aksi ke bawah
            x = x+1; % Objek pindah ke bawah blok 1 langkah
            arah = bawah;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    elseif (x+1 == 16)
        random = randi([1 3]);
        if random == 1 % Aksi ke atas
            x = x-1;  % Objek pindah ke atas blok 1 langkah
            arah = atas;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 2 % Aksi ke kanan
            y = y+1; % Objek pindah ke kanan blok 1 langkah
            arah = kanan;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 3 % Aksi ke kiri
            y = y-1;  % Objek pindah ke kiri blok 1 langkah
            arah = kiri;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    elseif (x-1 == 0)
        random = randi([1 3]);
        if random == 1 % Aksi ke bawah
            x = x+1;  % Objek pindah ke bawah blok 1 langkah
            arah = bawah;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 2 % Aksi ke kanan
            y = y+1;  % Objek pindah ke kanan blok 1 langkah
            arah = kanan; 
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 3 % Aksi ke kiri
            y = y-1;  % Objek pindah ke kiri blok 1 langkah
            arah = kiri;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    elseif (y+1 == 16)
        random = randi([1 3]);
        if random == 1 % Aksi ke atas
            x = x-1;  % Objek pindah ke atas blok 1 langkah
            arah = atas;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 2 % Aksi ke bawah
            x = x+1;  % Objek pindah ke bawah blok 1 langkah
            arah = bawah;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 3 % Aksi ke kiri
            y = y-1;  % Objek pindah ke kiri blok 1 langkah
            arah = kiri;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    elseif (y-1 == 0)
        random = randi([1 3]);
        if random == 1 % Aksi ke atas
            x = x-1;  % Objek pindah ke atas blok 1 langkah
            arah = atas;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 2 % Aksi ke bawah
            x = x+1; % Objek pindah ke bawah blok 1 langkah
            arah = bawah;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif random == 3 % Aksi ke kanan
            y = y+1; % Objek pindah ke kanan blok 1 langkah
            arah = kanan;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    else 
        randomMove = randi([1 4]);

        if (randomMove == atas) % Aksi ke atas
            x = x-1; % Objek pindah ke atas blok 1 langkah
            arah = atas;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable 
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif (randomMove == bawah) % Aksi ke bawah
            x = x+1; % Objek pindah ke bawah blok 1 langkah
            arah = bawah;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif (randomMove == kiri) % Aksi ke kiri
            y = y-1; % Objek pindah ke kiri blok 1 langkah
            arah = kiri;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        elseif (randomMove == kanan) % Aksi ke kanan
            y = y+1; % Objek pindah ke kanan blok 1 langkah
            arah = kanan;
            indeksSelanjutnya = indeksQTable(x,y);
            QTableSelanjutnya = QTable(:,indeksSelanjutnya); % Inisialisasi 'QTableSelanjutnya' untuk update QTable
            r = dataset(x,y); % Inisialisasi reward 'r' untuk update QTable
            QTable = updateQTable(QTable,QTableSelanjutnya,indeks,arah,learningRate,epsilon,r); % update QTable
        end
    end
    
end